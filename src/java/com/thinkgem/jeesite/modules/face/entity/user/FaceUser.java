package com.thinkgem.jeesite.modules.face.entity.user;

import org.hibernate.validator.constraints.Length;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 人脸用户Entity
 * @author diamond
 * @version 2018-01-03
 */
public class FaceUser extends DataEntity<FaceUser> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 身份证号
	private String noId;		// 工号/学号
	private Office office;		// 归属宿楼
	private String phone;		// 用户手机号
	private String mail;		// 用户邮箱
	private String address;		// 用户住址
	private String name;		// 用户姓名
	private String photo;		// 用户图片
	private String feature;		// 用户特征
	private String isnew;		// 特征是否更新
	private String sex;		// 用户性别
	private Date inDate;		// 加入日期
	
	public FaceUser() {
		super();
	}

	public FaceUser(String id){
		super(id);
	}

	
	@Length(min=0, max=64, message="工号/学号长度必须介于 0 和 64 之间")
	public String getNoId() {
		return noId;
	}

	public void setNoId(String noId) {
		this.noId = noId;
	}
	
	@Length(min=0, max=500, message="用户图片长度必须介于 0 和 500 之间")
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	@ExcelField(title="身份证号码", align=0, sort=1)
	@Length(min=1, max=64, message="身份证号长度必须介于 1 和 64 之间")
	public String getUserid() {
		return userId;
	}

	public void setUserid(String userid) {
		this.userId = userid;
	}
	
	@ExcelField(title="归宿宿楼", align=2, sort=20)
	@NotNull(message="归属宿楼不能为空")
	public Office getOffice() {
		return office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}
	@ExcelField(title="手机号码", align=2, sort=25)
	@Length(min=0, max=64, message="用户手机号长度必须介于 0 和 64 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@ExcelField(title="邮箱", align=2, sort=30)
	@Length(min=0, max=64, message="用户邮箱长度必须介于 0 和 64 之间")
	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	@ExcelField(title="家庭住址", align=2, sort=35)
	@Length(min=0, max=200, message="用户住址长度必须介于 0 和 200 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	@ExcelField(title="用户姓名", align=2, sort=50)
	@Length(min=1, max=100, message="用户姓名长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}
	
	@Length(min=0, max=1, message="特征是否更新长度必须介于 0 和 1 之间")
	public String getIsnew() {
		return isnew;
	}

	public void setIsnew(String isnew) {
		this.isnew = isnew;
	}
	
	@ExcelField(title="性别", align=2, sort=55,dictType="sex")
	@Length(min=0, max=1, message="用户性别长度必须介于 0 和 1 之间")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	
	
}