package com.thinkgem.jeesite.modules.face.web.conmachine;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.face.dao.conmachine.FaceControllerDao;
import com.thinkgem.jeesite.modules.face.entity.conmachine.FaceController;
import com.thinkgem.jeesite.modules.face.service.conmachine.FaceControllerService;
import com.thinkgem.jeesite.modules.sys.dao.conmachine.SysConmachineDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.conmachine.SysConmachine;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 人脸控制器分配Controller
 * @author diamond
 * @version 2018-01-02
 */
@Controller
@RequestMapping(value = "${adminPath}/face/conmachine/faceController")
public class FaceControllerController extends BaseController {

	@Autowired
	private FaceControllerService faceControllerService;
	@Autowired
	private SysConmachineDao sysConmachineDao;
	@Autowired
	private FaceControllerDao faceControllerDao;
	
	@ModelAttribute
	public FaceController get(@RequestParam(required=false) String id) {
		FaceController entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = faceControllerService.get(id);
		}
		if (entity == null){
			entity = new FaceController();
		}
		return entity;
	}
	
	@RequiresPermissions("face:conmachine:faceController:view")
	@RequestMapping(value = {"list", ""})
	public String list(FaceController faceController, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FaceController> page = faceControllerService.findPage(new Page<FaceController>(request, response), faceController); 
		
		List<FaceController> faceControllers =  page.getList();
		
		List<Office> offices = UserUtils.getOfficeList();
		List<FaceController> realdata = new ArrayList<>();
		for(int i =0;i<offices.size();i++){
			Office office = offices.get(i);
			System.out.println("-----------------");
			System.err.println("officeid:"+office.getId()+"  "+office.getName());
			for (int j = 0;j<faceControllers.size();j++){
				FaceController sysConmachine = faceControllers.get(j);
				System.err.println(sysConmachine.getOffice().getId());
				System.out.println("-----------------");
				if(office.getId().equals(sysConmachine.getOffice().getId())){
					realdata.add(sysConmachine);
				}
			}
		}
		page.setList(realdata);
		page.setCount(realdata.size());
		model.addAttribute("page", page);
		return "modules/face/conmachine/faceControllerList";
	}

	@RequiresPermissions("face:conmachine:faceController:view")
	@RequestMapping(value = "form")
	public String form(FaceController faceController, Model model) {
		model.addAttribute("faceController", faceController);
		return "modules/face/conmachine/faceControllerForm";
	}

	@RequiresPermissions("face:conmachine:faceController:edit")
	@RequestMapping(value = "save")
	public String save(FaceController faceController, Model model, RedirectAttributes redirectAttributes) {
		System.out.println(faceController.getConmachineId());
		faceController.setConmachineId(faceController.getConmachineId().replace(",", ""));
		if (!beanValidator(model, faceController)){
			return form(faceController, model);
		}
		faceControllerService.save(faceController);
		addMessage(redirectAttributes, "保存分配控制器成功");
		return "redirect:"+Global.getAdminPath()+"/face/conmachine/faceController/?repage";
	}
	
	@RequiresPermissions("face:conmachine:faceController:edit")
	@RequestMapping(value = "delete")
	public String delete(FaceController faceController, RedirectAttributes redirectAttributes) {
		faceControllerService.delete(faceController);
		addMessage(redirectAttributes, "删除分配控制器成功");
		return "redirect:"+Global.getAdminPath()+"/face/conmachine/faceController/?repage";
	}
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData( HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<FaceController> list = faceControllerService.findList(new FaceController());
		List<Office> offices  = UserUtils.getOfficeList();
		List<SysConmachine> sysConmachines = sysConmachineDao.findAllList(new SysConmachine());
		boolean iscontain = false;
		for(int i =0;i<offices.size();i++){
			Office office = offices.get(i);
			for (int j = 0;j<sysConmachines.size();j++){
				SysConmachine sysConmachine = sysConmachines.get(j);
				if(office.getId().equals(sysConmachine.getOffice().getId())){
					for(int k=0;k<list.size();k++){
						FaceController faceController = list.get(k);
						if(faceController.getConmachineId().equals(sysConmachine.getControllerId())){
							iscontain = true;
							break;
						}
					}
					
					if(!iscontain){
						Map<String, Object> map = Maps.newHashMap();
						//map.put("id", sysConmachine.getControllerId());
						//map.put("pId", "");
						//map.put("pIds", "");
						map.put("name", sysConmachine.getControllerId());
						mapList.add(map);
					}
					
				}
			iscontain = false;
			}
		}
		return mapList;
	}
	
	@ResponseBody
	@RequestMapping(value = "AlltreeData")
	public List<Map<String, Object>> AlltreeData(@RequestParam(required=false) String extId, @RequestParam(required=false) String type,
			@RequestParam(required=false) Long grade, @RequestParam(required=false) Boolean isAll, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<FaceController> list = faceControllerService.findList(new FaceController());
		List<Office> offices = UserUtils.getOfficeList();
		
		for (int i=0; i<list.size(); i++){
			FaceController e = list.get(i);
			for(Office office:offices){
				if(office.getId().equals(e.getOffice().getId())){
					Map<String, Object> map = Maps.newHashMap();
					//map.put("id", e.getId());
					//map.put("pId", "");
					//map.put("pIds", "");
					map.put("name", e.getConmachineId());
					mapList.add(map);
				}
				
			}
				
			
		}
		return mapList;
	}

}