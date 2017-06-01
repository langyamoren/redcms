package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ModelItem;
import com.redcms.dao.core.BaseDao;

public interface ModelItemDao extends BaseDao<ModelItem>
{
      /**
       * ȡģ�Ͷ�Ӧ�ֶ�
       * @param id
       * @param valid 1Ϊ��Ч 0Ϊ��Ч
       * @return
       * @throws SQLException
       */
	   public List<ModelItem> getByModelId(int id,int valid)throws SQLException;
	   
	   /**
	    * ����һ��ģ��ʱ�������������ֶμ���model_item
	    * @param all
	    * @throws SQLException
	    */
	   public void addField(ModelItem []all)throws SQLException;
	   /**
	    * ����Ч�ֶθ�Ϊ��Ч
	    * @param ids
	    * @throws SQLException
	    */
	   public void deleteField(int[]ids)throws SQLException;
	   /**
	    * ����Ч�ֶθ�Ϊ��Ч
	    * @param ids
	    * @throws SQLException
	    */
	   public void validField(int[]ids)throws SQLException;
	   /**
	    * �����ֶε�������Ĭ��ֵ
	    * @param mdis
	    * @throws SQLException
	    */
	   public void updateField(ModelItem []mdis)throws SQLException;
	   
	   /**
	    * ���� modeidɾ��modeItem�е���Ŀ
	    * @param modelId
	    * @throws SQLException
	    */
	   public void deleteItemsByModelId(int modelId)throws SQLException;
}
