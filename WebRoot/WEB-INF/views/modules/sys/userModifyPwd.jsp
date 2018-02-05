<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>修改密码</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#oldPassword").focus();
			$("#inputForm").validate({
				rules: {
				},
				messages: {
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
		<li><a href="${ctx}/sys/user/info">个人信息</a></li>
		<li class="active"><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/modifyPwd" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="form-group" style="padding-top: 10px">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>旧密码:</label>
					<div class="col-sm-4 controls">
						<input id="oldPassword" name="oldPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>新密码:</label>
					<div class="col-sm-4 controls">
						<input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>确认新密码:</label>
					<div class="col-sm-4 controls">
						<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="50" minlength="3" class="form-control required" equalTo="#newPassword"/>
					</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/></div>
			</form:form>
			</div>
		</div>
      </div>
    </section>
</body>
</html>