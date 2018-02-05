<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#no").focus();
			$("#inputForm").validate({
				rules: {
					loginName: {remote: "${ctx}/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('${user.loginName}')}
				},
				messages: {
					loginName: {remote: "用户登录名已存在"},
					confirmNewPassword: {equalTo: "输入与上面相同的密码"}
				},
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/user/list">用户列表</a></li>
		<li class="active"><a href="${ctx}/sys/user/form?id=${user.id}">用户
		<shiro:hasPermission name="sys:user:edit">${not empty user.id?'修改':'添加'}</shiro:hasPermission>
		<shiro:lacksPermission name="sys:user:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl; padding: 0px">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/save" method="post" class="form-horizontal">
						<form:hidden path="id" />
						<sys:message content="${message}" />
						<div class="box-body">
						<div class="form-group">
							<label  class="col-sm-2 control-label">头像:</label>
							<div class="col-sm-4 controls">
								<form:hidden id="nameImage" path="photo" htmlEscape="false"
									maxlength="255" class="input-xlarge" />
								<sys:ckfinder input="nameImage" type="images"
									uploadPath="/photo" selectMultiple="false" maxWidth="100"
									maxHeight="100" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">归属公司:</label>
							<div class="col-sm-4 controls">
								<sys:treeselect id="company" name="company.id"
									value="${user.company.id}" labelName="company.name"
									labelValue="${user.company.name}" title="公司"
									url="/sys/office/treeData?type=1" cssClass="form-control required" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">归属部门:</label>
							<div class="col-sm-4 controls">
								<sys:treeselect id="office" name="office.id"
									value="${user.office.id}" labelName="office.name"
									labelValue="${user.office.name}" title="部门"
									url="/sys/office/treeData?type=2" cssClass="form-control required"
									notAllowSelectParent="false" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font></span>工号:</label>
							<div class="col-sm-4 controls">
								<form:input path="no" htmlEscape="false" maxlength="50"
									class="form-control required" />
								
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font></span>姓名:</label>
							<div class="col-sm-4 controls">
								<form:input path="name" htmlEscape="false" maxlength="50"
									class="form-control required" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font></span>登录名:</label>
							<div class="col-sm-4 controls">
								<input id="oldLoginName" name="oldLoginName" type="hidden"
									value="${user.loginName}">
								<form:input path="loginName" htmlEscape="false" maxlength="50"
									class="form-control required userName" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">
							<c:if test="${empty user.id}">
								<span class="help-inline"><font color="red">*</font> </span>
							</c:if>
							密码:</label>
							<div class="col-sm-4 controls">
								<input id="newPassword" name="newPassword" type="password"
									value="" maxlength="50" minlength="3"
									class="form-control ${empty user.id?'required':''}" />
								<c:if test="${not empty user.id}">
									<span class="help-inline">若不修改密码，请留空。</span>
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">
							<c:if test="${empty user.id}">
								<span class="help-inline"><font color="red">*</font> </span>
							</c:if>
							确认密码:</label>
							<div class="col-sm-4 controls">
								<input id="confirmNewPassword" name="confirmNewPassword"
									type="password" value="" maxlength="50" minlength="3"
									equalTo="#newPassword" class="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">邮箱:</label>
							<div class="col-sm-4 controls">
								<form:input path="email" htmlEscape="false" maxlength="100"
									class="form-control email" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">电话:</label>
							<div class="col-sm-4 controls">
								<form:input path="phone" htmlEscape="false" maxlength="100" cssClass="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">手机:</label>
							<div class="col-sm-4 controls">
								<form:input path="mobile" htmlEscape="false" maxlength="100" cssClass="form-control"/>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font></span>是否允许登录:</label>
							<div class="col-sm-4 controls">
								<form:select path="loginFlag" cssClass="form-control">
									<form:options items="${fns:getDictList('yes_no')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
									“是”代表此账号允许登录，“否”则表示此账号不允许登录</span>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">用户类型:</label>
							<div class="col-sm-4 controls">
								<form:select path="userType" class="form-control">
									<form:option value="" label="请选择" />
									<form:options items="${fns:getDictList('sys_user_type')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>用户角色:</label>
							<div class="col-sm-4 controls">
								<form:checkboxes path="roleIdList" items="${allRoles}"
									itemLabel="name" itemValue="id" htmlEscape="false"
									class="required" />
							</div>
						</div>
						<div class="form-group">
							<label  class="col-sm-2 control-label">备注:</label>
							<div class="col-sm-4 controls">
								<form:textarea path="remarks" htmlEscape="false" rows="3"
									maxlength="200" class="form-control" />
							</div>
						</div>
						<c:if test="${not empty user.id}">
							<div class="form-group">
								<label  class="col-sm-2 control-label">创建时间:</label>
								<div class="col-sm-4 controls">
									<label class="lbl control-label"><fmt:formatDate
											value="${user.createDate}" type="both" dateStyle="full" /></label>
								</div>
							</div>
							<div class="form-group">
								<label  class="col-sm-2 control-label">最后登陆:</label>
								<div class="col-sm-4 controls ">
									<label class="lbl control-label">IP:
										${user.loginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate
											value="${user.loginDate}" type="both" dateStyle="full" />
									</label>
								</div>
							</div>
						</c:if>
						</div>
						<div class="box-footer">
							<label class="col-sm-3 control-label"></label>
							<shiro:hasPermission name="sys:user:edit">
								<input id="btnSubmit" class="btn btn-primary" type="submit"
									value="保 存" />&nbsp;</shiro:hasPermission>
								<input id="btnCancel" class="btn" type="button" value="返 回"
									onclick="history.go(-1)" />
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>