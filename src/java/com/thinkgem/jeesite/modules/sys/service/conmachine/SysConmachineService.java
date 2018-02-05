package com.thinkgem.jeesite.modules.sys.service.conmachine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.conmachine.SysConmachineDao;
import com.thinkgem.jeesite.modules.sys.entity.conmachine.SysConmachine;

/**
 * 系统人脸控制器Service
 * @author diamond
 * @version 2018-01-02
 */
@Service
@Transactional(readOnly = true)
public class SysConmachineService extends CrudService<SysConmachineDao, SysConmachine> {

	@Autowired
	SysConmachineDao sysConmachineDao;
	public SysConmachine get(String id) {
		return super.get(id);
	}
	
	public List<SysConmachine> findList(SysConmachine sysConmachine) {
		return super.findList(sysConmachine);
	}
	
	public Page<SysConmachine> findPage(Page<SysConmachine> page, SysConmachine sysConmachine) {
		return super.findPage(page, sysConmachine);
	}
	
	@Transactional(readOnly = false)
	public void save(SysConmachine sysConmachine) {
		super.save(sysConmachine);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysConmachine sysConmachine) {
		super.delete(sysConmachine);
	}
	
	
}