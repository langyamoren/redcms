package com.redcms.tld;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ChannelPointerTag extends SimpleTagSupport 
{

@Override
public void doTag() throws JspException, IOException {
	ServletContext sc=((PageContext)this.getJspContext()).getServletContext();
	Properties info=(Properties)sc.getAttribute("webinfo");
	
	StringBuilder sb=new StringBuilder();
	ChannelDao channelDao=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
	int channelId=(Integer)this.getJspContext().findAttribute("channelId");
	
	LinkedList<String> stack=new LinkedList<String>();
	if(channelId>0)
	{
		try {	
			Channel channel=channelDao.getById(Channel.class, null, channelId);
			sb.append("<a href='http://"+info.getProperty("site")+"'>Ê×Ò³</a>");
			while(true)
			{
				stack.addFirst("-><a href='http://"+info.getProperty("site")+"/"+channel.getPath()+"'>"+channel.getName()+"</a>");
				if(null==channel.getParentId()||channel.getParentId()==0)
				{
					break;
				}else
				{
					channel=channelDao.getById(Channel.class, null, channel.getParentId());
				}
			}
		   while(!stack.isEmpty())sb.append(stack.removeFirst());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
	}
	
	
	this.getJspContext().getOut().write(sb.toString());
}

}
