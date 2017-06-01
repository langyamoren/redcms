package com.redcms.servlet.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.servlet.core.ServletBase;
@WebServlet("/web/right")
public class RightServlet extends ServletBase {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		 this.forward(req, resp, "templates/right.jsp");
	}

}
