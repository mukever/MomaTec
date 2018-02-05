package com.thinkgem.jeesite.modules.sys.web.conmachine;

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
import com.thinkgem.jeesite.modules.sys.entity.conmachine.SysConmachine;
import com.thinkgem.jeesite.modules.sys.service.conmachine.SysConmachineService;

/**
 * 系统人脸控制器Controller
 * @author diamond
 * @version 2018-01-02
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/conmachine/sysConmachine")
public class SysConmachineController extends BaseController {

	@Autowired
	private SysConmachineService sysConmachineService;
	
	@ModelAttribute
	public SysConmachine get(@RequestParam(required=false) String id) {
		SysConmachine entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysConmachineService.get(id);
		}
		if (entity == null){
			entity = new SysConmachine();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:conmachine:sysConmachine:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysConmachine sysConmachine, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysConmachine> page = sysConmachineService.findPage(new Page<SysConmachine>(request, response), sysConmachine); 
		model.addAttribute("page", page);
		return "modules/sys/conmachine/sysConmachineList";
	}

	@RequiresPermissions("sys:conmachine:sysConmachine:view")
	@RequestMapping(value = "form")
	public String form(SysConmachine sysConmachine, Model model) {
		model.addAttribute("sysConmachine", sysConmachine);
		return "modules/sys/conmachine/sysConmachineForm";
	}

	@RequiresPermissions("sys:conmachine:sysConmachine:edit")
	@RequestMapping(value = "save")
	public String save(SysConmachine sysConmachine, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysConmachine)){
			return form(sysConmachine, model);
		}
		sysConmachineService.save(sysConmachine);
		addMessage(redirectAttributes, "保存控制器信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/conmachine/sysConmachine/?repage";
	}
	
	@RequiresPermissions("sys:conmachine:sysConmachine:edit")
	@RequestMapping(value = "delete")
	public String delete(SysConmachine sysConmachine, RedirectAttributes redirectAttributes) {
		sysConmachineService.delete(sysConmachine);
		addMessage(redirectAttributes, "删除控制器信息成功");
		return "redirect:"+Global.getAdminPath()+"/sys/conmachine/sysConmachine/?repage";
	}
	
	

}