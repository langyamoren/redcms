package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.dao.ChannelDao;
import com.redcms.dao.core.BaseDaoImp;

public class ChannelDaoImp extends BaseDaoImp<Channel> implements ChannelDao
{

	@Override
	public List<Channel> getAllChannel() throws SQLException
	{
		List<Channel> all=new ArrayList<Channel>();
		
		List<Channel> parent=this.getParentChannel();
		if(null!=parent&&parent.size()>0)
		{
			for(Channel parc:parent)
			{
				all.add(parc);
				List<Channel> subs=this.getSubChannel(parc.getId());
				if(null!=subs&&subs.size()>0)
				{
					for(Channel subc:subs)
					{
						all.add(subc);
					}
				}
				
			}
		}

		return all;
	}

	@Override
	public List<Channel> getParentChannel() throws SQLException
	{
		return this.getAll(Channel.class, "select * from channel where parent_id is null or parent_id=0 order by orderlist", new Object[]{});
	}

	@Override
	public List<Channel> getSubChannel(Integer parentId) throws SQLException
	{
		
		return this.getAll(Channel.class, "select * from channel where parent_id=? order by orderlist", new Object[]{parentId});
	}
	@Override
	public List<Channel> getSubChannel(Integer parentId, int top)
			throws SQLException 
			{
		return this.getAll(Channel.class, "select * from channel where parent_id=? order by orderlist limit ?", new Object[]{parentId,top});
	}
	@Override
	public boolean hasSubChannel(Integer channelId) throws SQLException 
	{
		boolean re=false;
		String sql="select count(*) from channel where parent_id=?";
		if(this.getTotalCount(sql, new Object[]{channelId})>0)re=true;
		return re;
	}

	

/*	@Override
	public Channel getFartherChannel(Integer channelId) throws SQLException 
	{
		String sql="select * from channel where id="+channelId;
		return null;
	}*/

}
