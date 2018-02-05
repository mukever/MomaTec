<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统序列管理</title>
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
		<li><a href="${ctx}/sys/sysSequence/">系统序列列表</a></li>
		<li class="active"><a href="${ctx}/sys/sysSequence/form?id=${sysSequence.id}">系统序列<shiro:hasPermission name="sys:sysSequence:edit">${not empty sysSequence.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:sysSequence:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="sysSequence" action="${ctx}/sys/sysSequence/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>序列名称：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="name" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>当前序列值：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="currentValue" htmlEscape="false" maxlength="11" class="form-control required digits"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>自增值：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="increment" htmlEscape="false" maxlength="11" class="form-control required digits"/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="sys:sysSequence:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>