package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Channel;
import com.redcms.beans.Content;
import com.redcms.beans.Model;
import com.redcms.dao.core.BaseDao;
import com.redcms.page.PageDiv;

public interface ContentDao extends BaseDao<Content>
{
	/**
	 * ͨ��ģ�ͺ���Ŀid����Content
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @param channels
	 * @return
	 * @throws SQLException
	 */
    public PageDiv<Content> getContentByChannelId(Model model,int pageNo,int pageSize,List<Channel> channels)throws SQLException;
    public PageDiv<Content> getContentByChannelId(Model model,int pageNo,int pageSize,int channelId)throws SQLException;
    public int getTotalCountbychannelId(Model model,int channelId)throws SQLException;
    /**
     * ɾ������
     * @param tableName
     * @param id
     */
    public void deleteContent(String tableName,int id)throws SQLException;
    
}
