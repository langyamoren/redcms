package com.redcms.servlet.admin;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.redcms.beans.Channel;
import com.redcms.beans.Files;
import com.redcms.beans.Model;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.HtmlUtil;
import com.redcms.util.ImageIOUtil;
@WebServlet("/admin/channel")
public class ChannelServlet extends ServletBase
{
	private static final long serialVersionUID = -8273152548322233856L;

	/**
	 * 跳转到增加栏目页面
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		try
		{
			//List<Model> model_list=modelDao.getAllModel();
			List<Channel> channel_list=channelDao.getAllChannel();
			
			//req.setAttribute("model_list", model_list);
			req.setAttribute("channel_list",channel_list);
			int modelId=this.getInt(req, "modelId");
			int parentId=this.getInt(req,"parentId");
			
			Model model=modelDao.getById(Model.class,null, modelId);
			req.setAttribute("model",model);
			
			
			req.setAttribute("modelId", modelId);
			req.setAttribute("parentId",parentId);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		this.forward(req, resp, "admin/channel_add.jsp");	
	}
	/**
	 * 增加栏目
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		Channel channel=new Channel();
		channel.setCreatetime(new Date());
		this.getBean(req, channel);
		if(null!=channel.getParentId()&&channel.getParentId()==0)
		{
			channel.setParentId(null);
		}
        ConnectionManager cm=ConnectionManager.getInstance();
		try
		{
			cm.setAutoCommit(false);
			
			//对栏目图进行裁切
			if(null!=channel.getPic()&&channel.getPic().toLowerCase().indexOf("http://")==-1)
			{
				
				int index=channel.getPic().indexOf("res/uppics");
				String substr=channel.getPic().substring(index);
				
				String filepath=this.getServletContext().getRealPath(substr);
				
				File orgfile=new File(filepath);
				orgfile.renameTo(new File(filepath+"_"));
				
				FileInputStream fi=new FileInputStream(filepath+"_");
				BufferedImage img=ImageIO.read(fi);
				
				
				ImageIOUtil.write(channel.getPicWidth(), channel.getPicHeight(), filepath, fi, img);
			    
				new File(filepath+"_").delete();
			}
			int reid=channelDao.add(channel);
			//对文件资源进行更新
			String filesids=this.getString(req,"filesId");
			if(null!=filesids&&!filesids.trim().equals(""))
			{
			String []fids=filesids.split("[,]");
			if(fids!=null&&fids.length>0)
			{
				for(String fid:fids)
				{
					Files f=filesDao.getById(Files.class,null,Integer.parseInt(fid.trim()));
				    f.setChannelId(reid);
				    f.setModelId(channel.getModelId());
				    f.setIsvalid(1);
				    filesDao.update(f);
				}
			}
			}
			cm.commit();
			req.setAttribute("errors", "增加栏目成功");
		} catch (SQLException e)
		{
			cm.rollback();
			e.printStackTrace();
		}finally{
			cm.closeConnection();
		}
	    tolist(req,resp);
		
	}
	
	
	public void tolist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		this.forward(req, resp, "admin/channel_list.jsp");
	}
	/**
	 * 跳转到修改页面
	 */
	public void edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要修改的栏目");
		}else
		{
			try
			{
				Channel channel=channelDao.getById(Channel.class,null, id);
			    Model model=modelDao.getById(Model.class,null, channel.getModelId());
			    List<Channel> channel_list=channelDao.getAllChannel();
				req.setAttribute("channel_list",channel_list);
			    
			    req.setAttribute("model",model);
				req.setAttribute("channel", channel);
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			this.forward(req, resp, "admin/channel_edit.jsp");
			
		}
		
	}
	/**
	 * 保存修改
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要修改的栏目");
		}else
		{
			ConnectionManager cm=ConnectionManager.getInstance();
			try
			{
				cm.setAutoCommit(false);
				Channel channel=channelDao.getById(Channel.class,null, id);
				this.getBean(req, channel);
				Channel temchannel=new Channel();
				this.getBean(req, temchannel);
				//对栏目图进行裁切
				if(null==channel.getPic()||"".equals(channel.getPic()))
				{
				     if(null!=temchannel.getPic()&&temchannel.getPic().toLowerCase().indexOf("http://")==-1)
				     {
				    	 int index=channel.getPic().indexOf("res/uppics");
							String substr=channel.getPic().substring(index);
							
							String filepath=this.getServletContext().getRealPath(substr);
							
							File orgfile=new File(filepath);
							orgfile.renameTo(new File(filepath+"_"));
							
							FileInputStream fi=new FileInputStream(filepath+"_");
							BufferedImage img=ImageIO.read(fi);
							
							
							ImageIOUtil.write(channel.getPicWidth(), channel.getPicHeight(), filepath, fi, img);
						    
							new File(filepath+"_").delete();
				     }
				}//end 切图

				channelDao.update(channel);
				//对文件资源进行更新
				String filesids=this.getString(req,"filesId");
				if(null!=filesids&&!filesids.trim().equals(""))
				{
					String []fids=filesids.split("[,]");
					if(fids!=null&&fids.length>0)
					{
						for(String fid:fids)
						{
							Files f=filesDao.getById(Files.class,null,Integer.parseInt(fid.trim()));
						    f.setChannelId(channel.getId());
						    f.setModelId(channel.getModelId());
						    f.setIsvalid(1);
						    filesDao.update(f);
						}
					}
				}
				req.setAttribute("errors","修改栏目成功");
				cm.commit();
			} catch (SQLException e)
			{
				cm.rollback();
				e.printStackTrace();
			}finally
			{
				cm.closeConnection();
			}
			tolist(req, resp);
		
		}
		
	}
	public void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id<=0)
		{
			req.setAttribute("errors", "请选择要删除的栏目");
		}else
		{
			ConnectionManager.getInstance().setAutoCommit(false);
			try
			{
				/**
				 * 删除栏目下的所有资源
				 */
				filesDao.updateFilesBychannel(id);
				/**
				 * 删除栏目之前，一定要确定此栏目没有对应的文章，才可删除，删除栏目，将栏目下的
				 * 所有文章级联删除
				 */
				channelDao.delete(Channel.class, id);
			
				req.setAttribute("errors", "删除成功!");
				
				ConnectionManager.getInstance().commit();
			} catch (SQLException e)
			{
				ConnectionManager.getInstance().rollback();
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}
	   tolist(req, resp);
	}
	/**
	 *  发布栏目
	 */
	public void pubs(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
	    
		String path = req.getContextPath();
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
		int channelId=this.getInt(req, "channelId");
		int modelId=this.getInt(req,"modelId");
		
		try 
		{
			if(channelId>0)
			{
				
			   Channel channel=channelDao.getById(Channel.class, null,channelId);
			   String indexTem=channel.getIndexTemp();
			   String listTem=channel.getListTemp();
			   String pathName=channel.getPath();
			   
			   Model model=modelDao.getById(Model.class, null, channel.getModelId());
			   String tableName=model.getTableName();
			   String allpath=this.getServletContext().getRealPath("html/"+pathName);
			   File f=new File(allpath);
				if(!f.exists())f.mkdir();
				
				
			   if(null!=indexTem&&!"".equals(indexTem))
			   {
				   String url=basePath+"web/channel?channelId="+channelId+"&temFile="+indexTem+"&tableName="+tableName;
				   String targetfile=allpath+File.separator+"index.html";
				   HtmlUtil.saveFile(targetfile,url);
			   }
			   if(null!=listTem&&!"".equals(listTem))
			   {
						if(!channelDao.hasSubChannel(channelId))
						{
							int totalcount=contentDao.getTotalCountbychannelId(model, channelId);
							int pageSize=Integer.parseInt(this.getWebInfo("pageSize"));
							int totalPage=(totalcount+pageSize-1)/pageSize;
							for(int i=1;i<=totalPage;i++)
							{
								 String url=basePath+"web/channel?action=channelList&channelId="+channelId+"&modelId="+modelId+"&pageNo="+i+"&temFile="+listTem+"&tableName="+tableName;	
								 String targetfile=allpath+File.separator+"list_"+i+".html";
								 HtmlUtil.saveFile(targetfile,url);
								 Thread.sleep(30);
							}
						}
					//http://localhost:8080/redcms/web/channel?action=channelList&channelId=17&modelId=21
			   }
			   
			   req.setAttribute("errors","发布栏目成功！");
			}else
			{
				req.setAttribute("errors","没有有效的栏目id");	
			}
		} catch (SQLException e) 
		{
		  req.setAttribute("errors","没有栏目id");
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		
		tolist(req, resp);
	}
	
	

	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
	   tolist(req, resp);
	}
    
}
