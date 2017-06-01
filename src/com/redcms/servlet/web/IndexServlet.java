package com.redcms.servlet.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.servlet.core.ServletBase;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/web/index")
public class IndexServlet extends ServletBase {
	private static final long serialVersionUID = 1L;
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException 
			{
		      this.forward(req, resp, "templates/index.jsp");
	        }


}
