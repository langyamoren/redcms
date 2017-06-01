package com.redcms.dao;

import java.sql.SQLException;

import com.redcms.beans.ContentTxt;
import com.redcms.dao.core.BaseDao;

public interface ContentTxtDao extends BaseDao<ContentTxt>
{
	/**
	 * ���� contetn_id����� Content_txt��һ����¼
	 * @param tableName
	 * @param contentId
	 * @return
	 * @throws SQLException
	 */
    public ContentTxt getContentTxtByContentId(String tableName,int contentId)throws SQLException;
    /**
     * ɾ��content_txtͨ��contentID
     * @param tableName
     * @param contentId
     * @throws SQLException
     */
    public void deleteByContentId(String tableName,int contentId)throws SQLException;
}
