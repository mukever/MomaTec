package com.thinkgem.jeesite.modules.face.entity.conmachine;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 人脸控制器分配Entity
 * @author diamond
 * @version 2018-01-02
 */
public class FaceController extends DataEntity<FaceController> {
	
	private static final long serialVersionUID = 1L;
	private String conmachineId;		// 系统控制器编号
	private Office office;		// 归属宿楼
	private Date inDate;		// 加入日期
	
	
	public FaceController() {
		super();
	}

	public FaceController(String id){
		super(id);
	}

	@Length(min=1, max=64, message="系统控制器编号长度必须介于 1 和 64 之间")
	public String getConmachineId() {
		return conmachineId;
	}

	public void setConmachineId(String conmachineId) {
		this.conmachineId = conmachineId;
	}
	
	@NotNull(message="归属宿楼不能为空")
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