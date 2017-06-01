package com.redcms.dao.imp;

import java.sql.SQLException;
import java.util.List;
import com.redcms.beans.ModelItem;
import com.redcms.dao.ModelItemDao;
import com.redcms.dao.core.BaseDaoImp;

public class ModelItemDaoImp extends BaseDaoImp<ModelItem> implements
		ModelItemDao
{

	@Override
	public List<ModelItem> getByModelId(int id,int valid) throws SQLException
	{
		return this.getAll(ModelItem.class, "select * from model_item where model_id=? and valid=?", new Object[]{id,valid});
	}

	@Override
	public void addField(ModelItem[] all) throws SQLException
	{
		String sql="insert into model_item(model_id,name,label,def_value) values(?,?,?,?)";
		Object[][] params=new Object[all.length][];
		
		for(int i=0;i<all.length;i++)
		{
			ModelItem mi=all[i];
			params[i]=new Object[]{mi.getModelId(),mi.getName(),mi.getLabel(),mi.getDefValue()};
		}
		this.executeBatch(sql,params);
		
	}

	@Override
	public void deleteField(int[] ids) throws SQLException
	{
		String sql="update model_item set valid=0 where id=?";
		Object [][] params=new Object[ids.length][];
		for(int i=0;i<ids.length;i++)
		{
			params[i]=new Object[]{ids[i]};
		}
		this.executeBatch(sql, params);
		
	}
	@Override
	public void validField(int[] ids) throws SQLException 
	{
		String sql="update model_item set valid=1 where id=?";
		Object [][] params=new Object[ids.length][];
		for(int i=0;i<ids.length;i++)
		{
			params[i]=new Object[]{ids[i]};
		}
		this.executeBatch(sql, params);
		
	}

	@Override
	public void updateField(ModelItem[] mdis) throws SQLException 
	{
		String sql="update model_item set label=?,def_value=? where id=?";
		Object[][] params=new Object[mdis.length][3];
		for(int i=0;i<mdis.length;i++)
		{
			params[i][0]=mdis[i].getLabel();
			params[i][1]=mdis[i].getDefValue();
			params[i][2]=mdis[i].getId();
		}
		
		this.executeBatch(sql,params);
		
	}
	
	@Override
	public void deleteItemsByModelId(int modelId) throws SQLException {
		String sql="delete from model_item where model_id=?";
		this.updateBySql(sql, modelId);
		
	}




}
