package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysSequence;

/**
 * 系统序列DAO接口
 * @author 大胖老师
 * @version 2017-09-23
 */
@MyBatisDao
public interface SysSequenceDao extends CrudDao<SysSequence> {
	
	/**
	 * 获取当前的序列值
	 * @param name
	 * @return
	 */
	public int getCurrSeq(String name);
	
	/**
	 * 获取下一个序列值
	 * @param name
	 * @return
	 */
	public int getNextSeq(String name);
	
}