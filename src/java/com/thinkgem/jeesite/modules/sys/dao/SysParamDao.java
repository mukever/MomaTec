package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysParam;

/**
 * 系统参数DAO接口
 * @author 大胖老师
 * @version 2017-09-23
 */
@MyBatisDao
public interface SysParamDao extends CrudDao<SysParam> {
	
	/**
	 * 根据参数编号查询参数数据
	 * @param paramCode 参数编号
	 * @return
	 */
	public SysParam getByParamCode(String paramCode);
	
}