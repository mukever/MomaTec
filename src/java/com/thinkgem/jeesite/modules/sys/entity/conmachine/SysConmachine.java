package com.thinkgem.jeesite.modules.sys.entity.conmachine;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 系统人脸控制器Entity
 * @author diamond
 * @version 2018-01-02
 */
public class SysConmachine extends DataEntity<SysConmachine> {
	
	private static final long serialVersionUID = 1L;
	private String controllerId;		// 控制器编号
	private Office office;		// 归属机构
	private Date inDate;		// 加入日期
	
	public SysConmachine() {
		super();
	}

	public SysConmachine(String id){
		super(id);
	}

	@Length(min=1, max=64, message="控制器编号长度必须介于 1 和 64 之间")
	public String getControllerId() {
		return controllerId;
	}

	public void setControllerId(String controllerId) {
		this.controllerId = controllerId;
	}
	
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	
}