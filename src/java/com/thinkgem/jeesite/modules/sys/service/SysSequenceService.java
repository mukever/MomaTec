package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.SysSequenceDao;
import com.thinkgem.jeesite.modules.sys.entity.SysSequence;

/**
 * 系统序列Service
 * @author 大胖老师
 * @version 2017-09-23
 */
@Service
@Transactional(readOnly = true)
public class SysSequenceService extends CrudService<SysSequenceDao, SysSequence> {

	public SysSequence get(String id) {
		return super.get(id);
	}
	
	public int getCurrSeq(String name) {
		return dao.getCurrSeq(name);
	}
	
	public int getNextSeq(String name) {
		return dao.getNextSeq(name);
	}
	
	public List<SysSequence> findList(SysSequence sysSequence) {
		return super.findList(sysSequence);
	}
	
	public Page<SysSequence> findPage(Page<SysSequence> page, SysSequence sysSequence) {
		return super.findPage(page, sysSequence);
	}
	
	@Transactional(readOnly = false)
	public void save(SysSequence sysSequence) {
		super.save(sysSequence);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysSequence sysSequence) {
		super.delete(sysSequence);
	}
	
}