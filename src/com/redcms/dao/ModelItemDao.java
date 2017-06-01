package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.ModelItem;
import com.redcms.dao.core.BaseDao;

public interface ModelItemDao extends BaseDao<ModelItem>
{
      /**
       * 取模型对应字段
       * @param id
       * @param valid 1为有效 0为无效
       * @return
       * @throws SQLException
       */
	   public List<ModelItem> getByModelId(int id,int valid)throws SQLException;
	   
	   /**
	    * 增加一个模型时，将所有内容字段加入model_item
	    * @param all
	    * @throws SQLException
	    */
	   public void addField(ModelItem []all)throws SQLException;
	   /**
	    * 将有效字段改为无效
	    * @param ids
	    * @throws SQLException
	    */
	   public void deleteField(int[]ids)throws SQLException;
	   /**
	    * 将无效字段改为有效
	    * @param ids
	    * @throws SQLException
	    */
	   public void validField(int[]ids)throws SQLException;
	   /**
	    * 更新字段的内容与默认值
	    * @param mdis
	    * @throws SQLException
	    */
	   public void updateField(ModelItem []mdis)throws SQLException;
	   
	   /**
	    * 根据 modeid删除modeItem中的项目
	    * @param modelId
	    * @throws SQLException
	    */
	   public void deleteItemsByModelId(int modelId)throws SQLException;
}
