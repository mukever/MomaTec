package com.thinkgem.jeesite.modules.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.service.SystemService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 前台用户登录拦截器
 * @author www.inxedu.com
 */
public class IntercepterFrontLogin extends BaseService implements HandlerInterceptor {
	
	private SystemService systemService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		//判断是否前台已经登录
		String username=(String) UserUtils.getSession().getAttribute("username");
		if(StringUtils.isNotEmpty(username)){
			return true;
		}
		//判断后台是否已经登录，如果前后台账号不通用，需要修改
		if (UserUtils.getSubject().isAuthenticated()){
			return true;
		}
		//如果都没有登录，则获取账号密码进行校验
		username=request.getParameter("username");
		String password=request.getParameter("password");
 		if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
			response.sendRedirect(request.getContextPath()+Global.getAdminPath());//跳转登录页面
			return false;
		}
 		User user = getSystemService().getUserByLoginName(username);
		if(user==null){
			response.sendRedirect(request.getContextPath()+Global.getAdminPath());//跳转登录页面
			return false;
		}
		//验证密码
		boolean isSucess = SystemService.validatePassword(password, user.getPassword());
		if(isSucess==false){
			response.sendRedirect(request.getContextPath()+Global.getAdminPath());//跳转登录页面
			return false;
		}
		//存入登录用户信息
		UserUtils.getSession().setAttribute("username", username);
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	/**
	 * 获取系统业务对象
	 */
	public SystemService getSystemService() {
		if (systemService == null){
			systemService = SpringContextHolder.getBean(SystemService.class);
		}
		return systemService;
	}



}
