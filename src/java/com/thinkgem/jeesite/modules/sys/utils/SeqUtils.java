package com.thinkgem.jeesite.modules.sys.utils;

import com.thinkgem.jeesite.common.utils.SpringContextHolder;
import com.thinkgem.jeesite.modules.sys.dao.SysSequenceDao;

/**
 * 获取自增序列
 * @author 大胖老师
 *
 */
public class SeqUtils {

	private static SysSequenceDao sysSequenceDao = SpringContextHolder.getBean(SysSequenceDao.class);
	
	public static int getCurrSeq(String name){
		return sysSequenceDao.getCurrSeq(name);
	}
	
	public static int getNextSeq(String name){
		return sysSequenceDao.getNextSeq(name);
	}
}
