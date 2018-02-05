package com.thinkgem.jeesite.modules.sys.entity;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 系统序列Entity
 * @author 大胖老师
 * @version 2017-09-23
 */
public class SysSequence extends DataEntity<SysSequence> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 序列名称
	private Integer currentValue;		// 当前序列值
	private Integer increment;		// 自增值
	
	public SysSequence() {
		super();
	}

	public SysSequence(String id){
		super(id);
	}

	@Length(min=1, max=50, message="序列名称长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@NotNull(message="当前序列值不能为空")
	public Integer getCurrentValue() {
		return currentValue;
	}

	public void setCurrentValue(Integer currentValue) {
		this.currentValue = currentValue;
	}
	
	@NotNull(message="自增值不能为空")
	public Integer getIncrement() {
		return increment;
	}

	public void setIncrement(Integer increment) {
		this.increment = increment;
	}
	
}