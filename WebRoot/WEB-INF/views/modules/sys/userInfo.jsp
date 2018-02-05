<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>个人信息</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
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
		<li class="active"><a href="${ctx}/sys/user/info">个人信息</a></li>
		<li><a href="${ctx}/sys/user/modifyPwd">修改密码</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">个人信息</h3>
            </div>

  		<form:form id="inputForm" modelAttribute="user" action="${ctx}/sys/user/info" method="post" class="form-horizontal">
              <div class="box-body">
              	<div class="control-group">
					<label class="col-sm-2 control-label">头像:</label>
					<div class="controls">
						<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">归属公司:</label>
					 <div class="col-sm-10">
				    <form:input path="company.name" htmlEscape="false" maxlength="50" class="form-control required" readonly="true"/>
				    </div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">归属部门:</label>
					<div class="col-sm-10">
				    <form:input path="office.name" htmlEscape="false" maxlength="50" class="form-control required" readonly="true"/>
				</div>
				</div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">姓名:</label>
                  <div class="col-sm-10">
                  <form:input path="name" htmlEscape="false" maxlength="50" class="form-control required" readonly="true"/>
                	</div>
                 </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">邮箱:</label>
                  <div class="col-sm-10">
                  <form:input path="email" htmlEscape="false" maxlength="50" class="form-control required" />
                	</div>
                 </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">电话:</label>
                  <div class="col-sm-10">
                  <form:input path="phone" htmlEscape="false" maxlength="50" class="form-control required" />
                </div>
                 </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">手机:</label>
                  <div class="col-sm-10">
                  <form:input path="mobile" htmlEscape="false" maxlength="50" class="form-control required" />
              	  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">备注:</label>
                  <div class="col-sm-10">
                  <form:input path="remarks" htmlEscape="false" maxlength="200" class="form-control required" />
               	  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">用户角色:</label>
                  <div class="col-sm-10">
                  <form:input path="roleNames"  htmlEscape="false" maxlength="50" class="form-control required" readonly="true"/>
                </div>
                </div>
                <div class="form-group">
                  <label  class="col-sm-2 control-label">用户类型:</label>
                  <div class="col-sm-10">
				  	<label class="lbl control-label">${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</label>               
                  </div>
                </div>
               <div class="form-group">
                  <label  class="col-sm-2 control-label">上次登录:</label>
                  <div class="col-sm-10">
				  <label class="lbl control-label">IP: ${user.oldLoginIp}&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${user.oldLoginDate}" type="both" dateStyle="full"/></label>               
				  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class=" box-footer">
              	<label class="col-sm-4 control-label"></label>
                <button type="submit" class=" btn btn-primary">保存</button>
              </div>
        </form:form>
          </div>
        </div>
      </div>
    </section>
</body>
</html>