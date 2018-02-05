package com.thinkgem.jeesite.modules.face.service.user;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.face.entity.user.FaceUser;
import com.thinkgem.jeesite.modules.face.dao.user.FaceUserDao;

/**
 * 人脸用户Service
 * @author diamond
 * @version 2018-01-03
 */
@Service
@Transactional(readOnly = true)
public class FaceUserService extends CrudService<FaceUserDao, FaceUser> {

	public FaceUser get(String id) {
		return super.get(id);
	}
	
	public List<FaceUser> findList(FaceUser faceUser) {
		return super.findList(faceUser);
	}
	
	public Page<FaceUser> findPage(Page<FaceUser> page, FaceUser faceUser) {
		return super.findPage(page, faceUser);
	}
	
	@Transactional(readOnly = false)
	public void save(FaceUser faceUser) {
		super.save(faceUser);
	}
	
	@Transactional(readOnly = false)
	public void delete(FaceUser faceUser) {
		super.delete(faceUser);
	}
	
}