package com.redcms.web.tld;

import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.log4j.Logger;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ChannelListTag extends TagSupport 
{
	private static final long serialVersionUID = 5576911006370827864L;
	private static final Logger log=Logger.getLogger(ChannelListTag.class);
	private int parentId;//父类别id,如果只需要一级类别，则给null
	private int top;//前几条
	private Iterator<Channel> its;
    private Channel item;
	@Override
	public int doStartTag() throws JspException 
	{
		ChannelDao cd=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
		try 
		{
		
			if(parentId<=0)
			{
				its=cd.getParentChannel().iterator();
			}
			else
			{
				if(top>0)
				{
					its=cd.getSubChannel(parentId,top).iterator();
				}else
				{
				its=cd.getSubChannel(parentId).iterator();
				}
			}
		}  catch (SQLException e) 
		{
			log.error("查询类别出错")  ;
		}finally
		{
			ConnectionManager.getInstance().closeConnection();
		}
		if(null!=its&&its.hasNext())
		{
			item=its.next();
			return BodyTag.EVAL_BODY_INCLUDE;
		}else
		{
			return BodyTag.SKIP_BODY;
		}
	}
	@Override
	public int doAfterBody() throws JspException 
	{
		if(null!=its&&its.hasNext())
		{
			item=its.next();
			return BodyTag.EVAL_BODY_AGAIN;
		}else
		{
			return BodyTag.SKIP_BODY;
		}
	}
	@Override
	public int doEndTag() throws JspException 
	{
		// TODO Auto-generated method stub
		return BodyTag.EVAL_PAGE;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public Iterator<Channel> getIts() {
		return its;
	}
	public void setIts(Iterator<Channel> its) {
		this.its = its;
	}
	public Channel getItem() {
		return item;
	}
	public void setItem(Channel item) {
		this.item = item;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}

}
