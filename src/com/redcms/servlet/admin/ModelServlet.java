package com.redcms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.redcms.beans.Model;
import com.redcms.beans.ModelItem;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
@WebServlet("/admin/model")
public class ModelServlet extends ServletBase
{
	private static final long serialVersionUID = 4813823988492572931L;
	private String[][]allfield=new String[][]
	       {
				{"type_id","�������",""},
				{"title","����",""},
				{"tags","��ǩ",""},
				{"author","����","����Ա"},
				{"origin","��Դ","ԭ��"},
				{"origin_url","��Դurl",""},
				{"description","����",""},
				{"title_color","������ɫ",""},
				{"is_bold","����Ӵ�",""},
				{"title_pic","����ͼ",""},
				{"content_pic","����ͼ",""},
				{"type_pic","���ͼ",""},
				{"link","����",""},
				{"temp","ģ��",""},
				{"status","״̬",""},
				{"orderlist","����",""},
				{"is_recommend","�Ƽ�",""},
				{"txt","����",""}
			};
	
	/**
	 * ��ת������ģ��ҳ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
        this.forward(req, resp, "admin/model_add.jsp");
	}
	/**
	 * �������ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveAdd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		Model model=new Model();
		this.getBean(req, model);
		ConnectionManager.getInstance().setAutoCommit(false);
		Savepoint sp=ConnectionManager.getInstance().setSavePoint("modelstart");
		try
		{
			if(model.getTableName().matches("[a-zA-Z]+"))
			{
				//��ģ�ͱ�������һ������
				int lastId=modelDao.add(model);
				//����ģ����Ӧ�ı��
	            String []batch=new String[]{
	            		"create table "+model.getTableName().trim()+" like content",
	            		"create table "+model.getTableName().trim()+"_txt like content_txt",
	            		"alter table "+model.getTableName().trim()+"_txt ADD CONSTRAINT FK_"+model.getTableName().trim()+"_txt_1  FOREIGN KEY FK_"+model.getTableName().trim()+"_txt_1(content_id) REFERENCES "+model.getTableName()+"(id) ON DELETE RESTRICT  ON UPDATE RESTRICT"
	            };
				modelDao.addBatch(batch);
				
				//����mode_item��
				ModelItem mis[]=new ModelItem[allfield.length];
				for(int i=0;i<allfield.length;i++)
				{
					ModelItem mi=new ModelItem();
					mi.setModelId(lastId);
					mi.setName(allfield[i][0]);
					mi.setLabel(allfield[i][1]);
					mi.setDefValue(allfield[i][2]);
					mis[i]=mi;
					
				}
				modelItemDao.addField(mis);
				req.setAttribute("errors","����ģ�ͳɹ�!");
			}else
			{
				req.setAttribute("errors","����ֻ������ĸ���»���");
			}
			ConnectionManager.getInstance().commit();
		} catch (SQLException e)
		{
			ConnectionManager.getInstance().rollback(sp);
			req.setAttribute("errors","����ģ��ʧ��!");
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
			this.add(req, resp);
		}

	}
	/**
	 * ��ת��ģ���б�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void tolist(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 try
		{
			List<Model> list=modelDao.getAllModel();
			req.setAttribute("list",list);
		} catch (Exception e)
		{
			req.setAttribute("errors","��ѯģ�����ݳ���");
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
        this.forward(req, resp, "admin/model_list.jsp");
	}
	/**
	 * �޸�ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void edit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {		
			 try
			{
				Model model=modelDao.getById(Model.class,null, id);
				req.setAttribute("model",model);
			} catch (SQLException e)
			{
				
				req.setAttribute("error","û���ҵ�Ҫ�޸ĵ�����");
			}finally{
				ConnectionManager.getInstance().closeConnection();
			}
			 this.forward(req, resp, "admin/model_edit.jsp");
		 }

	}
	/**
	 * �����޸�ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {
		     try
			{
				Model model=modelDao.getById(Model.class,null, id);
				this.getBean(req, model);
				modelDao.update(model);
				req.setAttribute("errors","�޸����ݳɹ�");
				
			} catch (SQLException e)
			{
				req.setAttribute("errors","�޸�����ʧ��");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		     tolist(req, resp);
		
		 }

	}
	
	/**
	 * ɾ��ģ��
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 int id=this.getInt(req, "id");
		 if(id==0)
		 {
			 req.setAttribute("error", "û��ָ��Ҫ�޸ĵ�����!");
			 tolist(req,resp);
		 }else
		 {
			ConnectionManager.getInstance().setAutoCommit(false);
			Savepoint sp= ConnectionManager.getInstance().setSavePoint("deletemodelitem");
			 try
				{
					Model model=modelDao.getById(Model.class,null, id);
					modelItemDao.deleteItemsByModelId(id);
                    modelDao.addBatch(new String[]{
                    		"drop table "+model.getTableName().trim()+"_txt",
                    		 "drop table "+model.getTableName().trim()
                    });
                    modelDao.delete(Model.class, id);
					
					req.setAttribute("errors","ɾ�����ݳɹ�");
		    ConnectionManager.getInstance().commit();
				} catch (SQLException e)
				{
					req.setAttribute("error","ɾ��ģ������ʧ��");
					ConnectionManager.getInstance().rollback(sp);
				
				}finally
				{
					ConnectionManager.getInstance().closeConnection();
				}
			     tolist(req, resp);  	 
		
		 }

	}
	/***************************************ģ���ֶι���**********************************************/
	/**
	 * ��ת��ģ�����ݹ���
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void tofield(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int id=this.getInt(req, "id");
		if(id==0)
		{
			id=(Integer)req.getAttribute("modelId");
		}
		if(id==0)
		{
			req.setAttribute("errors","û��Ҫ�����ģ��!");
			tolist(req, resp);
		}else
		{
			
			try
			{
				List<ModelItem> valids=modelItemDao.getByModelId(id,1);
				List<ModelItem> invalids=modelItemDao.getByModelId(id, 0);
				req.setAttribute("valids",valids);
				req.setAttribute("invalids",invalids);
				req.setAttribute("modelId",id);
			} catch (SQLException e)
			{
			  req.setAttribute("error","��ȡģ���ֶ����ݳ���");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			
			this.forward(req, resp, "admin/model_field.jsp");
		}
		
		
	}
	/**
	 * �����ֶ�
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void deleteField(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		int modelId=this.getInt(req,"modelId");
		req.setAttribute("modelId", modelId);
		int []ids=this.getIntArray(req, "ids");
		
		try
		{
			if(null!=ids&&ids.length>0)
			{
			modelItemDao.deleteField(ids);
			}
			req.setAttribute("errors", "����ϵͳ���ֳɹ�!");
		} catch (SQLException e)
		{
	
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		tofield(req, resp);
		
	}
	/**
	 * ���������ֶ�תΪ�����ֶ�
	 * @param req
	 * @param resp
	 */
	public void validfield(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		int modelId=this.getInt(req,"modelId");
		req.setAttribute("modelId", modelId);
		int []ids=this.getIntArray(req, "ids");
		
		try
		{
			if(null!=ids&&ids.length>0)
			{
			  modelItemDao.validField(ids);
			}
			req.setAttribute("errors", "����ϵͳ���ֳɹ�!");
		} catch (SQLException e)
		{
	
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		tofield(req, resp);
	}
	/**
	 * �����ֶ����ݺ�ֵ
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void updateField(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		int modelId=this.getInt(req,"modelId");
		req.setAttribute("modelId", modelId);
		int []ids=this.getIntArray(req, "ids");
		
		if(null!=ids&&ids.length>0)
		{
		    ModelItem []mis=new ModelItem[ids.length];
	    	
		    for(int i=0;i<ids.length;i++)
	    	{
	    		ModelItem mi=new ModelItem();
	    		mi.setId(ids[i]);
	    		mi.setLabel(this.getString(req, "label"+ids[i]));
	    		mi.setDefValue(this.getString(req, "defvalue"+ids[i]));
	    		
	    		mis[i]=mi;
	    	}
	    	
	    	try {
				modelItemDao.updateField(mis);
				req.setAttribute("errors","�����ֶγɹ���");
			} catch (SQLException e)
			{
				e.printStackTrace();
				req.setAttribute("errors","�����ֶ�ʧ�ܣ�");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}else
		{
			req.setAttribute("errors","��ѡ��Ҫ���µ��");
		}
		tofield(req, resp);
	}
	
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
	tolist(req, resp);

	}
	


}
