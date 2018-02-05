package com.thinkgem.jeesite.modules.sys.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 系统参数Entity
 * @author 大胖老师
 * @version 2017-09-23
 */
public class SysParam extends DataEntity<SysParam> {
	
	private static final long serialVersionUID = 1L;
	private String paramCode;		// 属性编号
	private String paramName;		// 属性名
	private String paramValue;		// 属性值
	private String paramAttr1;		// 扩展属性1
	private String paramAttr2;		// 扩展属性2
	private String paramAttr3;		// 扩展属性3
	
	public SysParam() {
		super();
	}

	public SysParam(String id){
		super(id);
	}

	@Length(min=0, max=100, message="属性编号长度必须介于 0 和 100 之间")
	public String getParamCode() {
		return paramCode;
	}

	public void setParamCode(String paramCode) {
		this.paramCode = paramCode;
	}
	
	@Length(min=0, max=200, message="属性名长度必须介于 0 和 200 之间")
	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
	
	@Length(min=0, max=200, message="属性值长度必须介于 0 和 200 之间")
	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	
	@Length(min=0, max=200, message="扩展属性1长度必须介于 0 和 200 之间")
	public String getParamAttr1() {
		return paramAttr1;
	}

	public void setParamAttr1(String paramAttr1) {
		this.paramAttr1 = paramAttr1;
	}
	
	@Length(min=0, max=200, message="扩展属性2长度必须介于 0 和 200 之间")
	public String getParamAttr2() {
		return paramAttr2;
	}

	public void setParamAttr2(String paramAttr2) {
		this.paramAttr2 = paramAttr2;
	}
	
	@Length(min=0, max=200, message="扩展属性3长度必须介于 0 和 200 之间")
	public String getParamAttr3() {
		return paramAttr3;
	}

	public void setParamAttr3(String paramAttr3) {
		this.paramAttr3 = paramAttr3;
	}
	
}