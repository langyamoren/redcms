package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ContentAttachment;
import com.redcms.dao.core.BaseDao;

public interface ContentAttachmentDao extends BaseDao<ContentAttachment>
{
   /**
    * 根据内容id和模型id取附件
    * @param modelId
    * @param contentId
    * @return
    * @throws SQLException
    */
   public List<ContentAttachment> getAttachmentsByContentAndModel(int modelId,int contentId)throws SQLException;
}
