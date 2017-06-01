package com.redcms.web.tld;

import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.ConnectionManager;
import com.redcms.dao.core.DaoFactory;

public class ChannelTag extends SimpleTagSupport 
{
   private int id ;//栏目的id
   private String property;//栏目的属性
@Override
public void doTag() throws JspException, IOException {
	SimpleDateFormat  sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	StringBuilder sb=new StringBuilder();
	try {
		if(id>0&&null!=property&&!"".equals(property))
		{
			Class<Channel>  clazz=Channel.class;
			ChannelDao cd=(ChannelDao)DaoFactory.getDao(ChannelDao.class);
			
		 	Channel channel=cd.getById(clazz, null, id);
		    
		    Field field=clazz.getDeclaredField(property);
		    if(null!=field)
		    {
		    	field.setAccessible(true);
		    	if(property.equals("createtime"))
		    	{
		    		sb.append(sf.format((Date)field.get(channel)));
		    	}else
		    	{
		    	sb.append((String)field.get(channel));
		    	}
		    }
		
		}
	} catch (NoSuchFieldException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SecurityException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalArgumentException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IllegalAccessException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally
	{
		ConnectionManager.getInstance().closeConnection();
	}
	
	this.getJspContext().getOut().write(sb.toString());
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getProperty() {
	return property;
}
public void setProperty(String property) {
	this.property = property;
}
   
}
