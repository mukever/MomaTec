/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.SysScheduleJob;

/**
 * 定时任务DAO接口
 * @author 大胖老师
 * @version 2016-11-24
 */
@MyBatisDao
public interface SysScheduleJobDao extends CrudDao<SysScheduleJob> {
	
}