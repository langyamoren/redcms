package com.redcms.dao;

import java.sql.SQLException;

import com.redcms.beans.ContentTxt;
import com.redcms.dao.core.BaseDao;

public interface ContentTxtDao extends BaseDao<ContentTxt>
{
	/**
	 * 根据 contetn_id来查出 Content_txt的一条记录
	 * @param tableName
	 * @param contentId
	 * @return
	 * @throws SQLException
	 */
    public ContentTxt getContentTxtByContentId(String tableName,int contentId)throws SQLException;
    /**
     * 删除content_txt通过contentID
     * @param tableName
     * @param contentId
     * @throws SQLException
     */
    public void deleteByContentId(String tableName,int contentId)throws SQLException;
}
