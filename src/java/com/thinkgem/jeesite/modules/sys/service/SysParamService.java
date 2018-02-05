package com.thinkgem.jeesite.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.sys.dao.SysParamDao;
import com.thinkgem.jeesite.modules.sys.entity.SysParam;

/**
 * 系统参数Service
 * @author 大胖老师
 * @version 2017-09-23
 */
@Service
@Transactional(readOnly = true)
public class SysParamService extends CrudService<SysParamDao, SysParam> {

	public SysParam get(String id) {
		return super.get(id);
	}
	
	public SysParam getByParamCode(String paramCode) {
		return dao.getByParamCode(paramCode);
	}
	
	public List<SysParam> findList(SysParam sysParam) {
		return super.findList(sysParam);
	}
	
	public Page<SysParam> findPage(Page<SysParam> page, SysParam sysParam) {
		return super.findPage(page, sysParam);
	}
	
	@Transactional(readOnly = false)
	public void save(SysParam sysParam) {
		super.save(sysParam);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysParam sysParam) {
		super.delete(sysParam);
	}
	
}