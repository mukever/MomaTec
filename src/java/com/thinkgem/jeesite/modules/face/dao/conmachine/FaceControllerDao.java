package com.thinkgem.jeesite.modules.face.dao.conmachine;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.face.entity.conmachine.FaceController;

/**
 * 人脸控制器分配DAO接口
 * @author diamond
 * @version 2018-01-02
 */
@MyBatisDao
public interface FaceControllerDao extends CrudDao<FaceController> {
	
}