package com.thinkgem.jeesite.modules.sys.task;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.thinkgem.jeesite.modules.sys.entity.SysScheduleJob;
import com.thinkgem.jeesite.modules.sys.utils.ScheduleUtils;

/**
 * 禁止并发执行多个相同定义的JobDetail
 * @author 大胖老师
 *
 */
@DisallowConcurrentExecution
public class QuartzJobFactoryDisallowConcurrentExecution implements Job {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		SysScheduleJob scheduleJob = (SysScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		ScheduleUtils.invokMethod(scheduleJob);

	}
}