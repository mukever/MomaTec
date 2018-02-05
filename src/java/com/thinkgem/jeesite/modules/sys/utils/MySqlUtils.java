package com.thinkgem.jeesite.modules.sys.utils;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.thinkgem.jeesite.common.config.Global;
/**
 * MySQL数据库的备份与恢复 缺陷：可能会被杀毒软件拦截
 * 
 * @author xxx
 * @version xxx
 */
public class MySqlUtils {
	
	transient private static Logger logger = LoggerFactory.getLogger(MySqlUtils.class);
	
	/** MySQL安装目录的Bin目录的绝对路径 */
	private String mysqlBinPath;
	/** 访问MySQL数据库的用户名 */
	private String username;
	/** 访问MySQL数据库的密码 */
	private String password;
	public String getMysqlBinPath() {
		return mysqlBinPath;
	}
	public void setMysqlBinPath(String mysqlBinPath) {
		this.mysqlBinPath = mysqlBinPath;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public MySqlUtils(String mysqlBinPath, String username, String password) {
		if (!mysqlBinPath.endsWith(File.separator)) {
			mysqlBinPath = mysqlBinPath + File.separator;
		}
		this.mysqlBinPath = mysqlBinPath;
		this.username = username;
		this.password = password;
	}
	
	public MySqlUtils(){
		this.mysqlBinPath = Global.getConfig("jdbc.binpath");
		this.username =  Global.getConfig("jdbc.username");
		this.password =  Global.getConfig("jdbc.password");
	}
	/**
	 * 备份数据库
	 * 
	 * @param output
	 *            输出流
	 * @param dbname
	 *            要备份的数据库名
	 */
	public void backup(OutputStream output, String dbname) {
		String command = "cmd /c " + mysqlBinPath + "mysqldump -u" + username
				+ " -p" + password + " --set-charset=utf8 " + dbname;
		logger.debug(command);
		PrintWriter p = null;
		BufferedReader reader = null;
		try {
			p = new PrintWriter(new OutputStreamWriter(output, "utf8"));
			Process process = Runtime.getRuntime().exec(command);
			InputStreamReader inputStreamReader = new InputStreamReader(process
					.getInputStream(), "utf8");
			reader = new BufferedReader(inputStreamReader);
			String line = null;
			while ((line = reader.readLine()) != null) {
				p.println(line);
			}
			p.flush();
		} catch (UnsupportedEncodingException e) {
			logger.debug(e.getMessage());
		} catch (IOException e) {
			logger.debug(e.getMessage());
		} finally {
			try {
				if (reader != null) {
					reader.close();
				}
				if (p != null) {
					p.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 备份数据库，如果指定路径的文件不存在会自动生成
	 * 
	 * @param dest
	 *            备份文件的路径
	 * @param dbname
	 *            要备份的数据库
	 */
	public void backup(String dest, String dbname) {
		try {
			OutputStream out = new FileOutputStream(dest);
			backup(out, dbname);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 恢复数据库
	 * 
	 * @param input
	 *            输入流
	 * @param dbname
	 *            数据库名
	 */
	public void restore(InputStream input, String dbname) {
		String command = "cmd /c " + mysqlBinPath + "mysql -u" + username
				+ " -p" + password + " " + dbname;
		try {
			Process process = Runtime.getRuntime().exec(command);
			OutputStream out = process.getOutputStream();
			String line = null;
			String outStr = null;
			StringBuffer sb = new StringBuffer("");
			BufferedReader br = new BufferedReader(new InputStreamReader(input,
					"utf8"));
			while ((line = br.readLine()) != null) {
				sb.append(line + "/r/n");
			}
			outStr = sb.toString();
			OutputStreamWriter writer = new OutputStreamWriter(out, "utf8");
			writer.write(outStr);
			writer.flush();
			out.close();
			br.close();
			writer.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 恢复数据库
	 * 
	 * @param dest
	 *            备份文件的路径
	 * @param dbname
	 *            数据库名
	 */
	public void restore(String dest, String dbname) {
		try {
			InputStream input = new FileInputStream(dest);
			restore(input, dbname);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		String binPath = Global.getConfig("jdbc.binpath");
		String userName =  Global.getConfig("jdbc.username");
		String pwd =  Global.getConfig("jdbc.password");
		MySqlUtils bak = new MySqlUtils(binPath, userName, pwd);
		bak.backup("c:/ttt.sql", "zibenzhongchou");
//                bak.restore("c:/ttt.sql", "ttt");
	
	}

}
