package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.dao.core.BaseDao;

public interface ChannelDao extends BaseDao<Channel>
{
	/**
	 * ���������Ŀ
	 * @return
	 * @throws SQLException
	 */
   public List<Channel> getAllChannel()throws SQLException;
   /**
    * �õ�һ����Ŀ
    * @return
    * @throws SQLException
    */
   public List<Channel> getParentChannel()throws SQLException;
   /**
    * �õ�����Ŀ
    * @param parentId
    * @return
    * @throws SQLException
    */
   public List<Channel> getSubChannel(Integer parentId)throws SQLException;
   /**
    * �õ�����Ŀ
    * @param parentId
    * @return
    * @throws SQLException
    */
   public List<Channel> getSubChannel(Integer parentId,int top)throws SQLException;
/*   *//**
    * �õ�����Ŀ
    * @param channelId
    * @return
    * @throws SQLException
    *//*
   public Channel getFartherChannel(Integer channelId)throws SQLException;
   
   */
   public boolean hasSubChannel(Integer channelId)throws SQLException;
}
