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
				{"type_id","内容类别",""},
				{"title","标题",""},
				{"tags","标签",""},
				{"author","作者","管理员"},
				{"origin","来源","原创"},
				{"origin_url","来源url",""},
				{"description","描述",""},
				{"title_color","标题颜色",""},
				{"is_bold","标题加粗",""},
				{"title_pic","标题图",""},
				{"content_pic","内容图",""},
				{"type_pic","类别图",""},
				{"link","外链",""},
				{"temp","模版",""},
				{"status","状态",""},
				{"orderlist","排序",""},
				{"is_recommend","推荐",""},
				{"txt","内容",""}
			};
	
	/**
	 * 跳转到增加模型页面
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
	 * 完成增加模型
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
				//在模型表中增加一条数据
				int lastId=modelDao.add(model);
				//生成模型相应的表格
	            String []batch=new String[]{
	            		"create table "+model.getTableName().trim()+" like content",
	            		"create table "+model.getTableName().trim()+"_txt like content_txt",
	            		"alter table "+model.getTableName().trim()+"_txt ADD CONSTRAINT FK_"+model.getTableName().trim()+"_txt_1  FOREIGN KEY FK_"+model.getTableName().trim()+"_txt_1(content_id) REFERENCES "+model.getTableName()+"(id) ON DELETE RESTRICT  ON UPDATE RESTRICT"
	            };
				modelDao.addBatch(batch);
				
				//增加mode_item项
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
				req.setAttribute("errors","增加模型成功!");
			}else
			{
				req.setAttribute("errors","表名只能是字母和下划线");
			}
			ConnectionManager.getInstance().commit();
		} catch (SQLException e)
		{
			ConnectionManager.getInstance().rollback(sp);
			req.setAttribute("errors","增加模型失败!");
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
			this.add(req, resp);
		}

	}
	/**
	 * 跳转到模型列表
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
			req.setAttribute("errors","查询模型数据出错");
			e.printStackTrace();
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
        this.forward(req, resp, "admin/model_list.jsp");
	}
	/**
	 * 修改模型
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
			 req.setAttribute("error", "没有指定要修改的数据!");
			 tolist(req,resp);
		 }else
		 {		
			 try
			{
				Model model=modelDao.getById(Model.class,null, id);
				req.setAttribute("model",model);
			} catch (SQLException e)
			{
				
				req.setAttribute("error","没有找到要修改的数据");
			}finally{
				ConnectionManager.getInstance().closeConnection();
			}
			 this.forward(req, resp, "admin/model_edit.jsp");
		 }

	}
	/**
	 * 保存修改模型
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
			 req.setAttribute("error", "没有指定要修改的数据!");
			 tolist(req,resp);
		 }else
		 {
		     try
			{
				Model model=modelDao.getById(Model.class,null, id);
				this.getBean(req, model);
				modelDao.update(model);
				req.setAttribute("errors","修改数据成功");
				
			} catch (SQLException e)
			{
				req.setAttribute("errors","修改数据失败");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		     tolist(req, resp);
		
		 }

	}
	
	/**
	 * 删除模型
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
			 req.setAttribute("error", "没有指定要修改的数据!");
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
					
					req.setAttribute("errors","删除数据成功");
		    ConnectionManager.getInstance().commit();
				} catch (SQLException e)
				{
					req.setAttribute("error","删除模型数据失败");
					ConnectionManager.getInstance().rollback(sp);
				
				}finally
				{
					ConnectionManager.getInstance().closeConnection();
				}
			     tolist(req, resp);  	 
		
		 }

	}
	/***************************************模型字段管理**********************************************/
	/**
	 * 跳转到模型内容管理
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
			req.setAttribute("errors","没有要管理的模型!");
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
			  req.setAttribute("error","获取模型字段数据出错！");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			
			this.forward(req, resp, "admin/model_field.jsp");
		}
		
		
	}
	/**
	 * 保存字段
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
			req.setAttribute("errors", "保存系统段字成功!");
		} catch (SQLException e)
		{
	
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		tofield(req, resp);
		
	}
	/**
	 * 将不可用字段转为可用字段
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
			req.setAttribute("errors", "保存系统段字成功!");
		} catch (SQLException e)
		{
	
		}finally{
			ConnectionManager.getInstance().closeConnection();
		}
		
		tofield(req, resp);
	}
	/**
	 * 更新字段内容和值
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
				req.setAttribute("errors","更新字段成功！");
			} catch (SQLException e)
			{
				e.printStackTrace();
				req.setAttribute("errors","更新字段失败！");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}else
		{
			req.setAttribute("errors","请选中要更新的项！");
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
