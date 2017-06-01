package com.redcms.servlet.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.redcms.beans.Manager;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.Md5Encrypt;
@WebServlet("/admin/manager")
public class ManagerServelt extends ServletBase
{
	private static final long serialVersionUID = 2867729518726519060L;
	public void modifypwd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		   Manager manager=(Manager)req.getSession().getAttribute("manager");
		   String org=this.getString(req, "orgpwd");
		   String pwd=this.getString(req,"pwd");
		   String repwd=this.getString(req,"repwd");
		   if(Md5Encrypt.md5(org).equals(manager.getPasswd()))
		   {
			   if(pwd.equals(repwd))
			   {
				   manager.setPasswd(Md5Encrypt.md5(pwd));
				try
				{
					managerDao.update(manager);
				} catch (SQLException e)
				{
					   req.setAttribute("errors", "�޸�����ʧ��!");
					   this.forward(req, resp, "admin/modify_password.jsp");  
					   e.printStackTrace();
				}finally{
					ConnectionManager.getInstance().closeConnection();
				}
				   req.setAttribute("errors", "�޸�����ɹ�!");
				   this.forward(req, resp, "admin/modify_password.jsp");   
				   
			   }else
			   {
				   req.setAttribute("errors", "������������벻һõ!");
				   this.forward(req, resp, "admin/modify_password.jsp");  
			   }
		   }else
		   {
			   req.setAttribute("errors", "��ǰ���벻��!");
			   this.forward(req, resp, "admin/modify_password.jsp");
		   }
	}
	public void list(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
     {
		try {
			List<Manager> managers=managerDao.getAllManager();
			req.setAttribute("managers", managers);
		} catch (SQLException e) {
			 req.setAttribute("errors","��ȡ����Ա�б����");
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		this.forward(req, resp, "admin/managers.jsp");
		
     }
	
	public void add(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
   {
		 Manager ma=new Manager();
		 this.getBean(req, ma);
		 ma.setPasswd(Md5Encrypt.md5(ma.getPasswd()));
		 try {
			managerDao.add(ma);
			req.setAttribute("error", "���ӹ���Ա�ɹ�");
		} catch (SQLException e) {
			req.setAttribute("error", "���ӹ���Աʧ��");
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		list(req,resp);
   }
	
	public void update(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
   {
		int mid=this.getInt(req, "mid");
		if(mid>0)
		{
			try {
			 Manager ma=managerDao.getById(Manager.class, null, mid);
			 this.getBean(req, ma);
			 ma.setPasswd(Md5Encrypt.md5(ma.getPasswd()));
			 
			  managerDao.update(ma);
			  req.setAttribute("errors", "�޸Ĺ���Ա�ɹ�");
			} catch (SQLException e) {
				req.setAttribute("errors", "�޸Ĺ���Աʧ��");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}else
		{
			req.setAttribute("errors", "�޸Ĺ���Աʧ��");
		}
		list(req,resp);
   }
	public void delete(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		int mid=this.getInt(req, "mid");
		if(mid>0)
		{
			try {
			  managerDao.delete(Manager.class, mid);
			  req.setAttribute("errors", "ɾ������Ա�ɹ�");
			} catch (SQLException e) {
				req.setAttribute("errors", "ɾ������Աʧ��");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
		}else
		{
			req.setAttribute("errors", "ɾ������Աʧ��");
		}
		list(req,resp);
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		list(req,resp);
	}

}
