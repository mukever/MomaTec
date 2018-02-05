package com.thinkgem.jeesite.modules.face.dao.user;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.face.entity.user.FaceUser;

/**
 * 人脸用户DAO接口
 * @author diamond
 * @version 2018-01-03
 */
@MyBatisDao
public interface FaceUserDao extends CrudDao<FaceUser> {
	/**
	 * 根据登录名称查询用户
	 * @param loginName
	 * @return
	 */
	public FaceUser getByUserId(FaceUser user);
}