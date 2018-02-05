/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.sys.web;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.sys.service.MySqlService;


/**
 * 管理员数据库管理
 * @author 大胖老师
 * @version 2016-04-06
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/mySql")
public class MySqlController extends BaseController {

	@Autowired
	private MySqlService mySqlService;
	
	@RequiresPermissions("sys:mySql:view")
	@RequestMapping(value = {"list", ""})
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<String> backFileList=mySqlService.findMySqlBackUp();
		model.addAttribute("backFileList", backFileList);
		return "modules/sys/mySqlList";
	}

	@RequiresPermissions("sys:mySql:edit")
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
		mySqlService.userMySqlBackUp();
		addMessage(redirectAttributes, "手工备份成功");
		return "redirect:"+Global.getAdminPath()+"/sys/mySql/list";
	}
	
	/**
	 * 下载数据库备份
	 * @param response
	 * @param redirectAttributes
	 * @return
	 * @throws Exception 
	 */
	@RequiresPermissions("sys:mySql:view")
	@RequestMapping(value = "downBackUp")
    public String downBackUp(String filename,HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
	    String backuppath =  Global.getConfig("jdbc.backuppath")+"\\"+filename;
		response.reset();
        response.setContentType("application/octet-stream; charset=utf-8");
        response.setHeader("Content-Disposition", "attachment; filename="+backuppath);
        //读取文件  
        InputStream in = new FileInputStream(backuppath);  
        OutputStream out = response.getOutputStream();  
        //写文件  
        int b;  
        while((b=in.read())!= -1)  
        {  
            out.write(b);  
        }           
        in.close();  
        out.close();
		return null;
	}

}