<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统参数管理</title>
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
		<li><a href="${ctx}/sys/sysParam/">系统参数列表</a></li>
		<li class="active"><a href="${ctx}/sys/sysParam/form?id=${sysParam.id}">系统参数<shiro:hasPermission name="sys:sysParam:edit">${not empty sysParam.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:sysParam:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="sysParam" action="${ctx}/sys/sysParam/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">属性编号：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramCode" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">属性名：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramName" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">属性值：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramValue" htmlEscape="false" maxlength="200" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">扩展属性1：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramAttr1" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">扩展属性2：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramAttr2" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">扩展属性3：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="paramAttr3" htmlEscape="false" maxlength="200" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">备注：
					</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="sys:sysParam:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>