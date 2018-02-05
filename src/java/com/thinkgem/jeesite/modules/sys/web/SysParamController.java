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
import com.thinkgem.jeesite.modules.sys.entity.SysParam;
import com.thinkgem.jeesite.modules.sys.service.SysParamService;

/**
 * 系统参数Controller
 * @author 大胖老师
 * @version 2017-09-23
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysParam")
public class SysParamController extends BaseController {

	@Autowired
	private SysParamService sysParamService;
	
	@ModelAttribute
	public SysParam get(@RequestParam(required=false) String id) {
		SysParam entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysParamService.get(id);
		}
		if (entity == null){
			entity = new SysParam();
		}
		return entity;
	}
	
	@RequiresPermissions("sys:sysParam:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysParam sysParam, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysParam> page = sysParamService.findPage(new Page<SysParam>(request, response), sysParam); 
		model.addAttribute("page", page);
		return "modules/sys/sysParamList";
	}

	@RequiresPermissions("sys:sysParam:view")
	@RequestMapping(value = "form")
	public String form(SysParam sysParam, Model model) {
		model.addAttribute("sysParam", sysParam);
		return "modules/sys/sysParamForm";
	}

	@RequiresPermissions("sys:sysParam:edit")
	@RequestMapping(value = "save")
	public String save(SysParam sysParam, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysParam)){
			return form(sysParam, model);
		}
		//新增时检查系统参数是否已存在
		if(sysParam.getIsNewRecord()){
			SysParam param=sysParamService.getByParamCode(sysParam.getParamCode());
			if(param!=null){
				model.addAttribute("message", "该系统参数已存在，请勿重复添加!");
				return form(sysParam, model);
			}
		}
		sysParamService.save(sysParam);
		addMessage(redirectAttributes, "保存系统参数成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysParam/?repage";
	}
	
	@RequiresPermissions("sys:sysParam:edit")
	@RequestMapping(value = "delete")
	public String delete(SysParam sysParam, RedirectAttributes redirectAttributes) {
		sysParamService.delete(sysParam);
		addMessage(redirectAttributes, "删除系统参数成功");
		return "redirect:"+Global.getAdminPath()+"/sys/sysParam/?repage";
	}

}