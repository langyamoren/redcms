package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ContentAttachment;
import com.redcms.dao.core.BaseDao;

public interface ContentAttachmentDao extends BaseDao<ContentAttachment>
{
   /**
    * ��������id��ģ��idȡ����
    * @param modelId
    * @param contentId
    * @return
    * @throws SQLException
    */
   public List<ContentAttachment> getAttachmentsByContentAndModel(int modelId,int contentId)throws SQLException;
}
