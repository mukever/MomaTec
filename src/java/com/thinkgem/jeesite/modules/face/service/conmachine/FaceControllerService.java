package com.thinkgem.jeesite.modules.face.service.conmachine;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.face.dao.conmachine.FaceControllerDao;
import com.thinkgem.jeesite.modules.face.entity.conmachine.FaceController;

/**
 * 人脸控制器分配Service
 * @author diamond
 * @version 2018-01-02
 */
@Service
@Transactional(readOnly = true)
public class FaceControllerService extends CrudService<FaceControllerDao, FaceController> {

	public FaceController get(String id) {
		return super.get(id);
	}
	
	public List<FaceController> findList(FaceController faceController) {
		return super.findList(faceController);
	}
	
	public Page<FaceController> findPage(Page<FaceController> page, FaceController faceController) {
		return super.findPage(page, faceController);
	}
	
	@Transactional(readOnly = false)
	public void save(FaceController faceController) {
		super.save(faceController);
	}
	
	@Transactional(readOnly = false)
	public void delete(FaceController faceController) {
		super.delete(faceController);
	}
	
}