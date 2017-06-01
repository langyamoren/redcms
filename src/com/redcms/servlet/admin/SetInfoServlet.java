package com.redcms.servlet.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.servlet.core.ServletBase;
@WebServlet("/admin/setinfo")
public class SetInfoServlet extends ServletBase
{
	private static final long serialVersionUID = 8773559779502111266L;
	public void savexml(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		String name=this.getString(req, "name");
		String site=this.getString(req,"site");
		String icp=this.getString(req,"icp");
		String email=this.getString(req,"email");
		String port=this.getString(req,"port");
		String smtp=this.getString(req,"smtp");
		String pwd=this.getString(req,"pwd");
		String pageSize=this.getString(req, "pageSize");
		
		ServletContext sc=this.getServletContext();
	   // InputStream is=sc.getResourceAsStream("/WEB-INF/info.xml");
	    Properties p=new Properties();
	   // p.loadFromXML(is);
	    p.setProperty("name", name);
	    p.setProperty("site",site);
	    p.setProperty("icp",icp);
	    p.setProperty("email",email);
	    p.setProperty("port",port);
	    p.setProperty("smtp",smtp);
	    p.setProperty("pwd",pwd);
	    p.setProperty("pageSize", pageSize);
	    String path=sc.getRealPath("WEB-INF/info.xml");
	    FileOutputStream fo=new FileOutputStream(path);
	    p.storeToXML(fo,"��վ��Ϣ����");
	    req.setAttribute("errors","������վ������Ϣ�ɹ�!");
		this.execute(req, resp);

	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		ServletContext sc=this.getServletContext();
	    InputStream is=sc.getResourceAsStream("/WEB-INF/info.xml");
	    Properties p=new Properties();
	    p.loadFromXML(is);
	    req.setAttribute("res",p);
	    this.forward(req, resp, "admin/setinfo.jsp");

	}

}
