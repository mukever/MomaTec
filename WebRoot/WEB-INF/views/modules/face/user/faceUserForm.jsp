<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
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
		<li><a href="${ctx}/face/user/faceUser/">用户信息列表</a></li>
		<li class="active"><a href="${ctx}/face/user/faceUser/form?id=${faceUser.id}">用户信息<shiro:hasPermission name="face:user:faceUser:edit">${not empty faceUser.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="face:user:faceUser:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="faceUser" action="${ctx}/face/user/faceUser/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">用户图片：
					</label>
					<div class="controls">
						<form:hidden id="nameImage" path="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>
						<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>身份证号：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="userid" htmlEscape="false" maxlength="64" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">工号/学号：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="noId" htmlEscape="false" maxlength="64" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>归属宿楼：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="office" name="office.id" value="${faceUser.office.id}" labelName="office.name" labelValue="${faceUser.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">用户手机号：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="phone" htmlEscape="false" maxlength="64" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">用户邮箱：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="mail" htmlEscape="false" maxlength="64" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">用户住址：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="address" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>用户姓名：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
				</div>
				
				<div class="form-group">
					<label  class="col-sm-2 control-label">特征是否更新：
					</label>
					<div class="col-sm-4 controls">
						<form:select path="isnew" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">用户性别：
					</label>
					<div class="col-sm-4 controls">
						<form:select path="sex" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">加入日期：
					</label>
					<div class="col-sm-4 controls">
						<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate "
							value="<fmt:formatDate value="${faceUser.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">备注信息：
					</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="face:user:faceUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>