<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#value").focus();
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
		<li><a href="${ctx}/sys/dict/">字典列表</a></li>
		<li class="active"><a href="${ctx}/sys/dict/form?id=${dict.id}">字典<shiro:hasPermission name="sys:dict:edit">${not empty dict.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:dict:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="dict" action="${ctx}/sys/dict/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="box-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">键值:</label>
					<div class="col-sm-4 controls">
						<form:input path="value" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">标签:</label>
					<div class="col-sm-4 controls">
						<form:input path="label" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">类型:</label>
					<div class="col-sm-4 controls">
						<form:input path="type" htmlEscape="false" maxlength="50" class="form-control required abc"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">描述:</label>
					<div class="col-sm-4 controls">
						<form:input path="description" htmlEscape="false" maxlength="50" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">排序:</label>
					<div class="col-sm-4 controls">
						<form:input path="sort" htmlEscape="false" maxlength="11" class="form-control required digits"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">备注:</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="sys:dict:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
			</div>
		</div>
     </div>
   </section>
</body>
</html>