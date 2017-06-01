package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ContentAttachment;
import com.redcms.dao.ContentAttachmentDao;
import com.redcms.dao.core.BaseDaoImp;

public class ContentAttachmentDaoImp extends BaseDaoImp<ContentAttachment>
		implements ContentAttachmentDao
{

	@Override
	public List<ContentAttachment> getAttachmentsByContentAndModel(int modelId,
			int contentId) throws SQLException {
		String sql="select * from content_attachment where content_id=? and model_id=?";
		return this.getAll(ContentAttachment.class, sql, new Object[]{contentId,modelId});
	}

}
