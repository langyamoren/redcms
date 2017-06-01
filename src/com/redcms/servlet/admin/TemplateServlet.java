package com.redcms.servlet.admin;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.servlet.core.ServletBase;
import com.redcms.util.FileUtil;
@WebServlet("/admin/template")
public class TemplateServlet extends ServletBase {

	private static final long serialVersionUID = -5118633942543928500L;
	public void add(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
      String fname=this.getString(req, "fname");
      if(null!=fname&&!"".equals(fname))
      {
    	  File f=new File(this.getServletContext().getRealPath("WEB-INF/templates"),fname);
    	  PrintWriter pw=new PrintWriter(f);
    	  pw.println("<%@ page language=\"java\" contentType=\"text/html; charset=GB18030\" pageEncoding=\"GB18030\"%>");
    	  pw.println("<%@ page import=\"java.util.*,com.redcms.beans.*,com.redcms.page.*\"%>");
    	  pw.println("<%@taglib prefix=\"red\" uri=\"/redcms-tags\" %>");
    	  pw.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
    	  pw.println("<html>");
    	  pw.println("<head>");
    	  pw.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=GB18030\">");
    	  pw.println("<title>页面标题</title>");
    	  pw.println("</head>");
    	  pw.println("<body>");
    	  pw.println("<!--页面内容-->");
    	  pw.println("</body>");
    	  pw.println("</html>");
    	  pw.close();
      }else
      {
    	  req.setAttribute("errors","增加模板文件失败");
      }
      execute(req,resp);
    }
	public void edit(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
	   String fname=this.getString(req, "fname");

	   String filecontents=FileUtil.readFile(this.getServletContext().getRealPath("WEB-INF/templates")+File.separator+fname);
	   req.setAttribute("fname", fname);
	   req.setAttribute("filecontents", filecontents);
	   
	   this.forward(req, resp, "admin/templates_edit.jsp");
	}
	public void saveEdit(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
	   String fname=this.getString(req, "fname");

	   File tfile=new File(this.getServletContext().getRealPath("WEB-INF/templates"),fname);
	  PrintWriter pw=new PrintWriter(tfile);
	  pw.write(this.getString(req, "content"));
	  pw.close();
	  
	   req.setAttribute("errors","修改模板文件成功");
	   execute(req,resp);
	}
	
	public void delete(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException 
	{
	   String fname=this.getString(req, "fname");
	   File tfile=new File(this.getServletContext().getRealPath("WEB-INF/templates"),fname);
	   if(tfile.exists())tfile.delete();
	   req.setAttribute("errors","删除模板文件成功");
	   execute(req,resp);
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
	{
		File dir=new File(this.getServletContext().getRealPath("WEB-INF/templates"));
		
		String [] temps=dir.list();
		req.setAttribute("temps", temps);
		
       this.forward(req, resp, "admin/templates.jsp");
	}

}
