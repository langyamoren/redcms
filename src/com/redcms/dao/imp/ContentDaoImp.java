package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.Model;
import com.redcms.dao.ContentDao;
import com.redcms.dao.core.BaseDaoImp;
import com.redcms.page.PageDiv;

public class ContentDaoImp extends BaseDaoImp<Content> implements ContentDao
{

	@Override
	public PageDiv<Content> getContentByChannelId(Model model,int pageNo,int pageSize, List<Channel> channels)
			throws SQLException
	{
		//select t.name as channelName,c.* from channel t,articles c where t.parent_id=16 and t.id=c.channel_id;
		//String sql="select t.name as channelName,c.* from "+model.getTableName()+" c left join channel t on t.id=c.channel_id and t.id in(?)";
	   String sql="select t.name channelName,t.path path,c.* from "+model.getTableName()+" c,channel t where t.id in(?) and t.id=c.channel_id order by c.id desc";
		StringBuilder sb=new StringBuilder();
	    for(int i=0;i<channels.size();i++)
	    {
	    	Channel ch=channels.get(i);
            sb.append(ch.getId());
            if(i<channels.size()-1)
            {
            	sb.append(",");
            }
	    }
	    
		return this.getByPage(Content.class, sql, pageNo, pageSize, sb.toString());
	}

	@Override
	public void deleteContent(String tableName, int id) throws SQLException
	{
		String sql="delete from "+tableName+" where id=?";
		this.updateBySql(sql, new Object[]{id});
		
	}

	@Override
	public PageDiv<Content> getContentByChannelId(Model model, int pageNo,
			int pageSize, int channelId) throws SQLException 
	{
		 String sql="select t.name channelName,t.path path,c.* from "+model.getTableName()+" c,channel t where t.id=c.channel_id and t.id=? order by c.id desc";
		return this.getByPage(Content.class, sql, pageNo, pageSize, new Object[]{channelId});
	}

	@Override
	public int getTotalCountbychannelId(Model model,int channelId) throws SQLException {
		 String sql="select count(*) from "+model.getTableName()+" where channel_id=?";
		return this.getTotalCount(sql, new Object[]{channelId});
	}

}
