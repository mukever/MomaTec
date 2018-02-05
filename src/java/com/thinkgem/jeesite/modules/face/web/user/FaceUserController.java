package com.thinkgem.jeesite.modules.face.web.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.face.dao.user.FaceUserDao;
import com.thinkgem.jeesite.modules.face.entity.user.FaceUser;
import com.thinkgem.jeesite.modules.face.service.user.FaceUserService;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 人脸用户Controller
 * @author diamond
 * @version 2018-01-03
 */
@Controller
@RequestMapping(value = "${adminPath}/face/user/faceUser")
public class FaceUserController extends BaseController {

	@Autowired
	private FaceUserService faceUserService;
	@Autowired
	private FaceUserDao faceUserDao;
	@ModelAttribute
	public FaceUser get(@RequestParam(required=false) String id) {
		FaceUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = faceUserService.get(id);
		}
		if (entity == null){
			entity = new FaceUser();
		}
		return entity;
	}
	
	@RequiresPermissions("face:user:faceUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(FaceUser faceUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FaceUser> page = faceUserService.findPage(new Page<FaceUser>(request, response), faceUser); 
		List<FaceUser> faceUsers =  page.getList();
		
		List<Office> offices = UserUtils.getOfficeList();
		List<FaceUser> realdata = new ArrayList<>();
		for(int i =0;i<offices.size();i++){
			Office office = offices.get(i);
			for (int j = 0;j<faceUsers.size();j++){
				FaceUser faceuser = faceUsers.get(j);
				if(office.getId().equals(faceuser.getOffice().getId())){
					realdata.add(faceuser);
				}
			}
		}
		page.setList(realdata);
		page.setCount(realdata.size());
		model.addAttribute("page", page);
		return "modules/face/user/faceUserList";
	}

	@RequiresPermissions("face:user:faceUser:view")
	@RequestMapping(value = "form")
	public String form(FaceUser faceUser, Model model) {
		model.addAttribute("faceUser", faceUser);
		return "modules/face/user/faceUserForm";
	}

	@RequiresPermissions("face:user:faceUser:edit")
	@RequestMapping(value = "save")
	public String save(FaceUser faceUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, faceUser)){
			return form(faceUser, model);
		}
		System.out.println(faceUser.getPhoto());
		
		faceUserService.save(faceUser);
		addMessage(redirectAttributes, "保存用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/?repage";
	}
	
	@RequiresPermissions("face:user:faceUser:edit")
	@RequestMapping(value = "delete")
	public String delete(FaceUser faceUser, RedirectAttributes redirectAttributes) {
		faceUserService.delete(faceUser);
		addMessage(redirectAttributes, "删除用户信息成功");
		return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/?repage";
	}

	/**
	 * 导出用户数据
	 * @param user
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("face:user:faceUser:view")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String export(FaceUser faceUser, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "用户数据"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<FaceUser> page = faceUserService.findPage(new Page<FaceUser>(request, response,-1), faceUser); 
    		List<FaceUser> faceUsers =  page.getList();
    		
    		List<Office> offices = UserUtils.getOfficeList();
    		List<FaceUser> realdata = new ArrayList<>();
    		for(int i =0;i<offices.size();i++){
    			Office office = offices.get(i);
    			for (int j = 0;j<faceUsers.size();j++){
    				FaceUser faceuser = faceUsers.get(j);
    				if(office.getId().equals(faceuser.getOffice().getId())){
    					realdata.add(faceuser);
    				}
    			}
    		}
    		new ExportExcel("用户数据", FaceUser.class).setDataList(realdata).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出用户失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/list?repage";
    }

	/**
	 * 下载导入用户数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("face:user:faceUser:view")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
			List<Office> offices = UserUtils.getOfficeList();
			int i =0; 
			boolean ok = false;
			for(;i<offices.size();i++){
				if(offices.get(i).getType().equals("2")){
					ok = true;
					break;
				}
			}
            String fileName = "用户数据导入模板.xlsx";
    		List<FaceUser> list = Lists.newArrayList(); 
    		FaceUser tempfaceuser = new FaceUser();
    		tempfaceuser.setUserid("41152219940604****");
    		if(ok){
    			tempfaceuser.setOffice(offices.get(i));
    		}
    		
    		tempfaceuser.setPhone("****");
    		tempfaceuser.setMail("****");
    		tempfaceuser.setAddress("*****");
    		tempfaceuser.setName("陈**");
    		tempfaceuser.setSex("男");
    		list.add(tempfaceuser);
    		new ExportExcel("用户数据(请勿修改excel文档格式！否则导入失败！)", FaceUser.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/list?repage";
    }


	/**
	 * 导入用户数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("face:user:faceUser:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<FaceUser> list = ei.getDataList(FaceUser.class);
			for (FaceUser user : list){
				try{
					//user.setDelFlag("0");
					if (faceUserDao.getByUserId(user) == null){
						BeanValidators.validateWithException(validator, user);
						faceUserService.save(user);
						successNum++;
					}else{
						failureMsg.append("<br/>该用户身份证信息 "+user.getName()+" 已存在; ");
						failureNum++;
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>该用户身份证信息 "+user.getName()+" 导入失败：");
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>该用户身份证信息 "+user.getName()+" 导入失败："+ex.getMessage());
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条用户，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条用户"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入用户失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/face/user/faceUser/list?repage";
    }
	
}