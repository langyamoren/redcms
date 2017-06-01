package com.redcms.servlet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.ContentAttachment;
import com.redcms.beans.ContentTxt;
import com.redcms.beans.Model;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.servlet.core.ServletBase;
@WebServlet("/web/content")
public class ContentServlet extends ServletBase {
	private static final long serialVersionUID = -6701336792343866956L;
	/**
	 * ä¯ÀÀÒ»ÆªÎÄÕÂ
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	public void browse(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		  // ServletContext sc=this.getServletContext();
		    int cid=this.getInt(req, "cid");
			int modelId=this.getInt(req, "modelId");
			req.setAttribute("modelId", modelId);
			int channelId=this.getInt(req,"channelId");
			req.setAttribute("channelId", channelId);
			int ch=this.getInt(req,"ch");
			
			String temfile=null;
			try {
				Model model=modelDao.getById(Model.class, null, modelId);
				Content tcon=new Content();
				tcon.setTableName(model.getTableName());
				Content content=contentDao.getById(Content.class, tcon, cid);
				Channel channel=channelDao.getById(Channel.class, null, channelId);
				ContentTxt contentTxt=contentTxtDao.getContentTxtByContentId(model.getTableName(), cid);
				List<ContentAttachment> attchs=contentAttachmentDao.getAttachmentsByContentAndModel(modelId, cid);
				
				
				req.setAttribute("contentTxt",contentTxt);
				req.setAttribute("content",content);
				req.setAttribute("model",model);
				req.setAttribute("channel", channel);
				req.setAttribute("ch",ch);
				req.setAttribute("attachs", attchs);
				temfile=content.getTemp();
			} catch (SQLException e) 
			{
               req.setAttribute("errors", "ä¯ÀÀÎÄÕÂ³ö´í");
			}finally
			{
				ConnectionManager.getInstance().closeConnection();
			}
			this.forward(req, resp, "templates/"+temfile);
	}
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
