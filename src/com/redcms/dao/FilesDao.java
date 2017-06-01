package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Files;
import com.redcms.dao.core.BaseDao;
import com.redcms.page.PageDiv;

public interface FilesDao extends BaseDao<Files>
{
    public List<Files> getFilesByChannel(Integer channelId)throws SQLException;
    public void updateFilesBychannel(Integer channelId)throws SQLException;
    /**
     * ����ģ����Ŀ��������ɾ����Դ
     * @param modelId
     * @param channelId
     * @param contentId
     * @throws SQLException
     */
    public void deleteFilesByModeContentChannel(int modelId,int channelId,int contentId)throws SQLException;
    /**
     * �õ�һƪ���¶�Ӧ����Դ
     * @param modelId
     * @param channelId
     * @param contentId
     * @return
     * @throws SQLException
     */
    public List<Files> FilesByModeContentChannel(int modelId,int channelId,int contentId)throws SQLException;
    /**
     * �ҳ������벻���õ���Դ
     * @param pageNo
     * @param pageSize
     * @param valid  0Ϊû��ʹ�õģ�����ɾ����1Ϊ��ʹ�õ�
     * @return
     * @throws SQLException
     */
    
    public PageDiv<Files> findFilesByValid(int pageNo,int pageSize,int valid)throws SQLException;
}
