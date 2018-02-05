package com.thinkgem.jeesite.modules.sys.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.modules.sys.dao.UserDao;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.MySqlUtils;


@Service
@Transactional(readOnly = true)
public class MySqlService extends CrudService<UserDao, User>{
	
	transient private static Logger logger = LoggerFactory.getLogger(MySqlService.class);
	
	/**
	 * 每晚12点数据库自动备份
	 * @Scheduled(cron="0 0 0 * * ?")
	 */
	@Transactional(readOnly = false)
	public void mySqlBackUp() {
		logger.debug("数据库开始系统备份");
		String binPath = Global.getConfig("jdbc.binpath");
		String userName =  Global.getConfig("jdbc.username");
		String pwd =  Global.getConfig("jdbc.password");
		String backuppath =  Global.getConfig("jdbc.backuppath");
		String dbname =  Global.getConfig("jdbc.dbname");
		String backname=backuppath+"\\"+DateUtils.getDate()+"-0-0-0.sql";
		File srcFile = new File(backname);
		if (!srcFile.exists()) {
			MySqlUtils bak = new MySqlUtils(binPath, userName, pwd);
			bak.backup(backname, dbname);
		}
	}
	
	@Transactional(readOnly = false)
	public String userMySqlBackUp() {
		logger.debug("数据库开始手工备份");
		String binPath = Global.getConfig("jdbc.binpath");
		String userName =  Global.getConfig("jdbc.username");
		String pwd =  Global.getConfig("jdbc.password");
		String backuppath =  Global.getConfig("jdbc.backuppath");
		String dbname =  Global.getConfig("jdbc.dbname");
		String backname=backuppath+"\\"+DateUtils.getDateTime().replace(" ", "-").replace(":", "-")+".sql";
		logger.debug("备份文件名:"+backname);
		File srcFile = new File(backname);
		if (!srcFile.exists()) {
			logger.debug("开始执行备份命令");
			MySqlUtils bak = new MySqlUtils(binPath, userName, pwd);
			bak.backup(backname, dbname);
		}
		return backname;
	}
	
	@Transactional(readOnly = false)
	public List<String> findMySqlBackUp() {
		List<String> backFileList=new ArrayList<String>();
		List<String> newbackFileList=new ArrayList<String>();
		String backuppath =  Global.getConfig("jdbc.backuppath");
		File file =new File(backuppath);    
		//如果文件夹不存在则创建    
		if(!file .exists()  && !file .isDirectory()){       
		    file .mkdir();    
		}
		getAllFileName(backuppath, backFileList);
		for (int i = 0; i < backFileList.size(); i++) {
			newbackFileList.add(backFileList.get(backFileList.size()-i-1));
		}
		return newbackFileList;
	}
	
    public void getAllFileName(String path,List<String> fileName)
    {
        File file = new File(path);
        File [] files = file.listFiles();
        String [] names = file.list();
        if(names != null)
        fileName.addAll(Arrays.asList(names));
        for(File a:files)
        {
            if(a.isDirectory())
            {
                getAllFileName(a.getAbsolutePath(),fileName);
            }
        }
    }

}
