package com.redcms.servlet.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.ContentAttachment;
import com.redcms.beans.ContentTxt;
import com.redcms.beans.Files;
import com.redcms.beans.Model;
import com.redcms.beans.ModelItem;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.page.PageDiv;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.HtmlUtil;
import com.redcms.util.ImageIOUtil;
@WebServlet("/admin/content")
public class ContentServlet extends ServletBase
{
	private static final long serialVersionUID = -8413084949945398937L;
	
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		try
		{
			Channel channel=channelDao.getById(Channel.class,null, channelId);
			Model model=modelDao.getById(Model.class,null, modelId);
			List<ModelItem>  itemlist=modelItemDao.getByModelId(modelId,1);			
			req.setAttribute("itemlist",itemlist);
			req.setAttribute("channel",channel);
			req.setAttribute("model",model);
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		
		req.setAttribute("modelId",modelId);
		req.setAttribute("channelId",channelId);
	    this.forward(req, resp, "admin/content_add.jsp");
	}
	public void addSave(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		//int managerId=this.getInt(req,"managerId");//����Ա��id
		ConnectionManager cm=ConnectionManager.getInstance();
		cm.setAutoCommit(false);
        try
		{
			Model model=modelDao.getById(Model.class,null, modelId);
			//Channel channel=channelDao.getById(Channel.class,null, channelId);
		    
			//����content��Ӧ�ķֱ�
			Content content=new Content();
			content.setCreateDate(new Date());
			content.setTableName(model.getTableName());//�������ݶ�Ӧ�����ݱ�
			this.getBean(req, content);
         
			//�Ա���ͼ���н�ͼ
			cutPicture(req, content.getTitlePic(), this.getInt(req, "titleWidth"), this.getInt(req, "titleHeight"));
			cutPicture(req, content.getContentPic(), this.getInt(req, "contentWidth"), this.getInt(req, "contentHeight"));
			cutPicture(req, content.getTypePic(), this.getInt(req, "typeWidth"), this.getInt(req, "typeHeight"));

            //�������ݱ�
			int re=contentDao.add(content);
        	ContentTxt contentTxt=new ContentTxt();
        	contentTxt.setContentId(re);
        	contentTxt.setTableName(model.getTableName()+"_txt");//���������ڵı�
        	contentTxt.setTxt(this.getString(req, "content"));
        	contentTxtDao.add(contentTxt);
        	//���Ӹ�����
        	
        	ContentAttachment cam=new ContentAttachment();
        	this.getBean(req, cam);
        	if(null!=cam.getPath()&&!"".equals(cam.getPath().trim()))
        	{
            	cam.setContentId(re);
            	cam.setModelId(modelId);
               	contentAttachmentDao.add(cam);	
        	}
        	
        	//���ļ���Դ���и���
			String filesids=this.getString(req,"filesId");
			if(null!=filesids&&!filesids.trim().equals(""))
			{
			String []fids=filesids.split("[,]");
			if(fids!=null&&fids.length>0)
			{
				for(String fid:fids)
				{
					Files f=filesDao.getById(Files.class,null,Integer.parseInt(fid.trim()));
				    f.setChannelId(channelId);
				    f.setModelId(modelId);
				    f.setContentId(re);
				    f.setIsvalid(1);
				    filesDao.update(f);
				}
			}
			}       	
        	req.setAttribute("errors","�������³ɹ�!");
        	cm.commit();
		} catch (Exception e)
		{
			req.setAttribute("errors","��������ʧ�ܣ�");
			cm.rollback();
		}finally
		{
			cm.closeConnection();
		}
	   list(req,resp);
	}
	
	
	public void list(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int pageNo=1;
		int pageSize=Integer.parseInt(this.getWebInfo("pageSize"));
		if(this.getInt(req, "pageNo")>0)
			pageNo=this.getInt(req, "pageNo");
		
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		if(0==modelId)modelId=(Integer)req.getAttribute("modelId");
		if(0==channelId)channelId=(Integer)req.getAttribute("channelId");
		try
		{
			Model model=modelDao.getById(Model.class,null, modelId);
	/*		List<Channel> subChannel=null;
			subChannel=channelDao.getSubChannel(channelId);
			if(null==subChannel||subChannel.size()==0)
			{
				subChannel=new ArrayList<Channel>();
				subChannel.add(channelDao.getById(Channel.class,null, channelId));
				
			}else
			{
				subChannel.add(channelDao.getById(Channel.class,null, channelId));
			}
			PageDiv<Content> pd=contentDao.getContentByChannelId(model, pageNo, pageSize, subChannel);
*/
			PageDiv<Content> pd=contentDao.getContentByChannelId(model, pageNo, pageSize, channelId);
			req.setAttribute("pd",pd);
		} catch (SQLException e)
		{
			// TODO: handle exception
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}

		req.setAttribute("modelId",modelId);
		req.setAttribute("channelId",channelId);
	    this.forward(req, resp, "admin/content_list.jsp");
	}
	
	/**
	 * ��ת���༭ҳ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void edit(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	    int cid=this.getInt(req, "cid");
	    int modelId=this.getInt(req, "modelId");
	    int channelId=this.getInt(req, "channelId");
	    try {
	    	
	    	Channel channel=channelDao.getById(Channel.class,null, channelId);
			Model model=modelDao.getById(Model.class,null,modelId);
			List<ModelItem>  itemlist=modelItemDao.getByModelId(modelId,1);			
			req.setAttribute("itemlist",itemlist);
			req.setAttribute("channel",channel);
			req.setAttribute("model",model);
	    	
		
			Content temcont=new Content();
			temcont.setTableName(model.getTableName());
			@SuppressWarnings("unchecked")
			Class<Content> clazz=(Class<Content>) temcont.getClass();
	
			Content content=contentDao.getById(clazz,temcont,cid);
			ContentTxt contentTxt=contentTxtDao.getContentTxtByContentId(model.getTableName(),cid);
			
			req.setAttribute("contentTxt", contentTxt);
			req.setAttribute("content", content);
			
		} catch (Exception e) {
			req.setAttribute("errors", "�޸ĳ����⣡");
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		this.forward(req, resp, "admin/content_edit.jsp");
		
	}
	/**
	 * �����޸�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	    int cid=this.getInt(req, "cid");
		int modelId=this.getInt(req, "modelId");
		req.setAttribute("modelId", modelId);
		int channelId=this.getInt(req,"channelId");
		req.setAttribute("channelId", channelId);
		//int managerId=this.getInt(req,"managerId");//����Ա��id
		ConnectionManager cm=ConnectionManager.getInstance();
		cm.setAutoCommit(false);
        try
		{	
			Model model=modelDao.getById(Model.class,null, modelId);
			//�޸�content��Ӧ�ķֱ�
			Content tem=new Content();
			tem.setTableName(model.getTableName());
			Content content=contentDao.getById(Content.class, tem, cid);
			this.getBean(req, content);
			content.setTableName(model.getTableName());		
            contentDao.update(content);
            //�޸�txt��
			ContentTxt contentTxt=contentTxtDao.getContentTxtByContentId(model.getTableName(), cid);
		    String newtxt=this.getString(req, "content");
		    if(!newtxt.equals(contentTxt.getTxt()))
			{
	        	contentTxt.setTxt(newtxt);
	         	contentTxt.setTableName(model.getTableName()+"_txt");
	        	contentTxtDao.update(contentTxt);
			}
		    
        	//���Ӹ�����
		  /*
			String filesids=this.getString(req,"filesId");
			if(null!=filesids&&!filesids.trim().equals(""))
			{
				
        	ContentAttachment cam=new ContentAttachment();
            this.getBean(req, cam);
        	cam.setContentId(cid);
        	cam.setModelId(modelId);
            contentAttachmentDao.add(cam);
       
          //���ļ���Դ���и���
			String []fids=filesids.split("[,]");
			if(fids!=null&&fids.length>0)
			{
				for(String fid:fids)
				{
					Files f=filesDao.getById(Files.class,null,Integer.parseInt(fid.trim()));
				    f.setChannelId(channelId);
				    f.setModelId(modelId);
				    f.setContentId(cid);
				    f.setIsvalid(1);
				    filesDao.update(f);
				}
			}
			} 	
			*/
		 	cm.commit();
        	req.setAttribute("errors","�޸����³ɹ�!");
       
		} catch (SQLException e)
		{
			req.setAttribute("errors","�޸�����ʧ�ܣ�");
			cm.rollback();
		}finally
		{
			cm.closeConnection();
		}
	   list(req,resp);
	
	
	}
	
	/**
	 * ɾ������
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		
			ConnectionManager.getInstance().setAutoCommit(false);
			try {
				int cids[]=this.getIntArray(req, "cid");
			    
				int modelId=this.getInt(req, "modelId");
				req.setAttribute("modelId", modelId);
				int channelId=this.getInt(req,"channelId");
				req.setAttribute("channelId", channelId);
				if(null!=cids&&cids.length>0)
				{
					for(int cid:cids)
					{
						//ɾ����Դ
						List<Files> list=filesDao.FilesByModeContentChannel(modelId, channelId, cid);
						if(null!=list&&list.size()>0)
						{
							for(Files tem:list)
							{
							  String path=this.getServletContext().getRealPath(tem.getPath());
							  File f=new File(path);
							  f.delete();
							}
						}
						filesDao.deleteFilesByModeContentChannel(modelId, channelId, cid);
						//ɾ������
						List<ContentAttachment> attas=contentAttachmentDao.getAttachmentsByContentAndModel(modelId, cid);
						
						if(null!=attas&&attas.size()>0)
						{
							for(ContentAttachment ca:attas)
							{
								File caf=new File(this.getServletContext().getRealPath(ca.getPath()));
								if(caf.exists())caf.delete();
								contentAttachmentDao.delete(ContentAttachment.class, ca.getId());
							}
						}
						
						//ɾ��_txt��
						Model model=modelDao.getById(Model.class,null, modelId);
						contentTxtDao.deleteByContentId(model.getTableName(), cid);
						//ɾ��content��
						contentDao.deleteContent(model.getTableName(), cid);
					}
				}
				ConnectionManager.getInstance().commit();	
				req.setAttribute("errors","ɾ���ɹ���");
			} catch (SQLException e) {
				ConnectionManager.getInstance().rollback();
				req.setAttribute("errors","ɾ��ʧ�ܣ�");
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			list(req, resp);
	}

	
	/**
	 * ���һƪ����
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void browse(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		  // ServletContext sc=this.getServletContext();
		    int cid=this.getInt(req, "cid");
			int modelId=this.getInt(req, "modelId");
			req.setAttribute("modelId", modelId);
			int channelId=this.getInt(req,"channelId");
			req.setAttribute("channelId", channelId);
			req.setAttribute("ch", this.getString(req, "temch"));
			String temfile=null;
			try {
				Model model=modelDao.getById(Model.class, null, modelId);
				Content tcon=new Content();
				tcon.setTableName(model.getTableName());
				Content content=contentDao.getById(Content.class, tcon, cid);
				Channel channel=channelDao.getById(Channel.class, null, channelId);
				ContentTxt contentTxt=contentTxtDao.getContentTxtByContentId(model.getTableName(), cid);
				req.setAttribute("contentTxt",contentTxt);
				req.setAttribute("content",content);
				req.setAttribute("model",model);
				req.setAttribute("channel", channel);
				temfile=content.getTemp();
			} catch (SQLException e) 
			{
               req.setAttribute("errors", "������³���");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			this.forward(req, resp, "templates/"+temfile);
	}
	/**
	 * �������£�Ҳ���ǽ��������ɾ�̬html
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void pub(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
			try {
				ServletContext sc=this.getServletContext();
			    int cids[]=this.getIntArray(req, "cid");
			    int chs[]=this.getIntArray(req, "chs");
				int modelId=this.getInt(req, "modelId");
				req.setAttribute("modelId", modelId);
				int channelId=this.getInt(req,"channelId");
				req.setAttribute("channelId", channelId);
				Channel channel=channelDao.getById(Channel.class, null, channelId);
				//req.setAttribute("channel", channel);
				String allpath=sc.getRealPath("html/"+channel.getPath());
				
				File f=new File(allpath);
				if(!f.exists())f.mkdir();
				
				String path = req.getContextPath();
				String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
				for(int i=0;i<cids.length;i++)
				{
				String contentpath=basePath+"web/content?action=browse&cid="+cids[i]+"&channelId="+channelId+"&modelId="+modelId+"&ch="+chs[i];
				String targetfile=allpath+File.separator+channel.getId()+"_"+cids[i]+".html";
				
				HtmlUtil.saveFile(targetfile,contentpath);
				}
				req.setAttribute("errors","�������³ɹ�<br/>");
			} catch (SQLException e) 
			{
            req.setAttribute("errors", "������³���");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			list(req,resp);
	}

	
	/**
	 * ��ͼƬ��������
	 * @param req
	 * @param picture
	 * @param newWith
	 * @param newHeight
	 */
	public void cutPicture(HttpServletRequest req,String picture,int newWith,int newHeight)
	{
		try
		{
			if(null!=picture&&(!picture.equals(""))&&picture.toLowerCase().indexOf("http://")==-1)
			{
				
				int index=picture.indexOf("res/uppics");
				String substr=picture.substring(index);
				
				String filepath=this.getServletContext().getRealPath(substr);
				
				File orgfile=new File(filepath);
				orgfile.renameTo(new File(filepath+"_"));
				
				FileInputStream fi=new FileInputStream(filepath+"_");
				BufferedImage img=ImageIO.read(fi);
				ImageIOUtil.write(newWith, newHeight, filepath, fi, img);
			    
				new File(filepath+"_").delete();
			}
		} catch (FileNotFoundException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		
	}

}
