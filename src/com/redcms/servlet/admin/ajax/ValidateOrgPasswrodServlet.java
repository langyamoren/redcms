package com.redcms.servlet.admin.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Manager;
import com.redcms.dao.ManagerDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;
import com.redcms.servlet.core.ServletBase;
import com.redcms.util.Md5Encrypt;
@WebServlet("/admin/ajax/validatepwd")
public class ValidateOrgPasswrodServlet extends ServletBase {

	private static final long serialVersionUID = -7429515030736369567L;

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		   resp.setContentType("text/plain;charset=gbk");
		   PrintWriter out=resp.getWriter();
		   //int id=this.getInt(req, "id");
		   String pwd=this.getString(req, "orgpwd");
		   String email=this.getString(req, "email");
		   ManagerDao md=(ManagerDao)DaoFactory.getDao(ManagerDao.class);
		   try {
			Manager m=md.checkLogin(email, Md5Encrypt.md5(pwd));
			if(null!=m&&m.getEmail().equals(email))
				out.println("1");
			else
				out.println("0");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		   out.close();

	}

}
