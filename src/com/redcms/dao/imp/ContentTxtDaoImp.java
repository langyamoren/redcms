package com.redcms.dao.imp;

import java.sql.SQLException;

import com.redcms.beans.ContentTxt;
import com.redcms.dao.ContentTxtDao;
import com.redcms.dao.core.BaseDaoImp;

public class ContentTxtDaoImp extends BaseDaoImp<ContentTxt> implements ContentTxtDao
{
	@Override
	public ContentTxt getContentTxtByContentId(String tableName,int contentId)
			throws SQLException 
	{
		String sql="select * from "+tableName+"_txt where content_id="+contentId+" limit 1";
		return this.getByUniq(ContentTxt.class, sql, new Object[]{});
	}

	@Override
	public void deleteByContentId(String tableName, int contentId)
			throws SQLException {
		String sql="delete from "+tableName+"_txt where content_id=?";
		this.updateBySql(sql, new Object[]{contentId});
		
	}

}
