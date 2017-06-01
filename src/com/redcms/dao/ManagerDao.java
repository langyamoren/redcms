package com.redcms.dao;

import java.sql.SQLException;
import java.util.List;

import com.redcms.beans.Manager;
import com.redcms.dao.core.BaseDao;

public interface ManagerDao extends BaseDao<Manager>
{
	/**
	 * ��֤��½
	 * @param email
	 * @param password
	 * @return
	 * @throws SQLException
	 */
     public Manager checkLogin(String email,String password)throws SQLException;
     /**
      * �õ����еĹ���Ա
      * @return
      * @throws SQLException
      */
     public List<Manager> getAllManager()throws SQLException;
}
