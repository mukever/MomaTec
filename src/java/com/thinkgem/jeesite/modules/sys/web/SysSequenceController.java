package com.thinkgem.jeesite.modules.sys.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.entity.SysSequence;
import com.thinkgem.jeesite.modules.sys.service.SysSequenceService;

/**
 * 系统序列Controller
 * @author 大胖老师
 * @version 2017-09-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysSequence")
public class SysSequenceController extends BaseController {

	@Autowired
	private SysSequenceService sysSequenceService;
	
	@ModelAttribute
	public SysSequence get(@RequestParam(required=false) String id) {
		SysSequence entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysSequenceService.get(id);
		}
		if (entity == null){
			entity = new SysSequence();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysSequence:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysSequence sysSequence, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysSequence> page = sysSequenceService.findPage(new Page<SysSequence>(request, response), sysSequence); 
		model.addAttribute("page", page);
		return "modules/sys/sysSequenceList";
	}

	@RequiresPermissions("sys:sysSequence:view")
	@RequestMapping(value = "form")
	public String form(SysSequence sysSequence, Model model) {
		model.addAttribute("sysSequence", sysSequence);
		return "modules/sys/sysSequenceForm";
	}

	@RequiresPermissions("sys:sysSequence:edit")
	@RequestMapping(value = "save")
	public String save(SysSequence sysSequence, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysSequence)){
			return form(sysSequence, model);
		}
		sysSequenceService.save(sysSequence);
		addMessage(redirectAttributes, "保存系统序列成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysSequence/?repage";
	}
	
	@RequiresPermissions("sys:sysSequence:edit")
	@RequestMapping(value = "delete")
	public String delete(SysSequence sysSequence, RedirectAttributes redirectAttributes) {
		sysSequenceService.delete(sysSequence);
		addMessage(redirectAttributes, "删除系统序列成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysSequence/?repage";
	}

}