package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.dao.core.BaseDao;

public interface ChannelDao extends BaseDao<Channel>
{
	/**
	 * 获得所有栏目
	 * @return
	 * @throws SQLException
	 */
   public List<Channel> getAllChannel()throws SQLException;
   /**
    * 得到一级栏目
    * @return
    * @throws SQLException
    */
   public List<Channel> getParentChannel()throws SQLException;
   /**
    * 得到子栏目
    * @param parentId
    * @return
    * @throws SQLException
    */
   public List<Channel> getSubChannel(Integer parentId)throws SQLException;
   /**
    * 得到子栏目
    * @param parentId
    * @return
    * @throws SQLException
    */
   public List<Channel> getSubChannel(Integer parentId,int top)throws SQLException;
/*   *//**
    * 得到父栏目
    * @param channelId
    * @return
    * @throws SQLException
    *//*
   public Channel getFartherChannel(Integer channelId)throws SQLException;
   
   */
   public boolean hasSubChannel(Integer channelId)throws SQLException;
}
