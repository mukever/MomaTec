package com.thinkgem.jeesite.modules.sys.dao.conmachine;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.sys.entity.conmachine.SysConmachine;

/**
 * 系统人脸控制器DAO接口
 * @author diamond
 * @version 2018-01-02
 */
@MyBatisDao
public interface SysConmachineDao extends CrudDao<SysConmachine> {
	
}