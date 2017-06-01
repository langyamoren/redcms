package com.redcms.servlet.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.Model;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.page.PageDiv;
import com.redcms.servlet.core.ServletBase;
@WebServlet("/web/channel")
public class ChannelServlet extends ServletBase {

	private static final long serialVersionUID = -6156546804967151142L;
/**
 * ю╦д©ап╠М
 * @param req
 * @param resp
 * @throws ServletException
 * @throws IOException
 */
	public void channelList(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException, IOException
	{
		int pageNo=1;
		int pageSize=Integer.parseInt(this.getWebInfo("pageSize"));
		if(this.getInt(req, "pageNo")>0)
		pageNo=this.getInt(req, "pageNo");
		
		int modelId=this.getInt(req, "modelId");
		int channelId=this.getInt(req,"channelId");
		
		//if(0==modelId)modelId=(Integer)req.getAttribute("modelId");
		//if(0==channelId)channelId=(Integer)req.getAttribute("channelId");
		
		try
		{
			Model model=modelDao.getById(Model.class,null, modelId);
			Channel channel=channelDao.getById(Channel.class, null, channelId);
			List<Channel> subChannel=null;
			subChannel=channelDao.getSubChannel(channelId);
			if(null==subChannel||subChannel.size()==0)
			{
				subChannel=new ArrayList<Channel>();
				subChannel.add(channelDao.getById(Channel.class,null, channelId));
				
			}else
			{
				subChannel.add(channelDao.getById(Channel.class,null, channelId));
			}
			PageDiv<Content> pd=contentDao.getContentByChannelId(model, pageNo, pageSize, subChannel);

			req.setAttribute("pd",pd);
			req.setAttribute("modelId", modelId);
			req.setAttribute("channelId", channelId);
			req.setAttribute("channel", channel);
			this.forward(req, resp, "templates/"+channel.getListTemp());
		} catch (SQLException e)
		{
			// TODO: handle exception
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
	}
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException
	{
		   String temFile=this.getString(req, "temFile");
		   int channelId=this.getInt(req,"channelId");
		   
		    if(null!=temFile&&!"".equals(temFile))
		    {
		    	
			    req.setAttribute("tableName", this.getString(req, "tableName"));
				req.setAttribute("indexTem", this.getString(req, "indexTem"));
				req.setAttribute("listTem", this.getString(req, "listTem"));
				req.setAttribute("channelId",channelId);
					   
			    this.forward(req, resp,  "templates/"+temFile);
		    }
		    else
		    {
		    this.forward(req, resp, "admin/login.jsp");
		    }
	}
	
	
}
