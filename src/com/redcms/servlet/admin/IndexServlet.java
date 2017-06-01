package com.redcms.servlet.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.servlet.core.ServletBase;
import com.redcms.util.HtmlUtil;
@WebServlet("/admin/index")
public class IndexServlet extends ServletBase {
	private static final long serialVersionUID = -165544657105633513L;

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String path = req.getContextPath();
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path+"/";
		
		String url=basePath+"web/index";
		
		String righturl=basePath+"web/right";
		
		String allpath=this.getServletContext().getRealPath("html");
		String targetfile=allpath+File.separator+"index.html";
		
		String rightrealpath=allpath+File.separator+"right.html";
		
		HtmlUtil.saveFile(targetfile,url);
		HtmlUtil.saveFile(rightrealpath, righturl);
		HtmlUtil.saveFile(this.getServletContext().getRealPath("/")+File.separator+"index.html", basePath+"html/index.html");
		
		   req.setAttribute("errors","生成首页成功");
		   this.forward(req, resp, "admin/admin_index.jsp");

	}
	

}
