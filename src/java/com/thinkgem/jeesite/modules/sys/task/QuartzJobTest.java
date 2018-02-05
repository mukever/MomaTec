package com.thinkgem.jeesite.modules.sys.task;

import com.thinkgem.jeesite.modules.sys.entity.SysScheduleJob;

public class QuartzJobTest {
	
	public void testJob(SysScheduleJob sysScheduleJob){
		System.out.println("系统参数："+sysScheduleJob.getParam());
		System.out.println("定时任务测试执行");
	}

}
