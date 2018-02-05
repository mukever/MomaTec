<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>定时任务管理</title>
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
		<li><a href="${ctx}/sys/sysScheduleJob/">定时任务列表</a></li>
		<li class="active"><a href="${ctx}/sys/sysScheduleJob/form?id=${sysScheduleJob.id}">定时任务<shiro:hasPermission name="sys:sysScheduleJob:edit">${not empty sysScheduleJob.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="sys:sysScheduleJob:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="sysScheduleJob" action="${ctx}/sys/sysScheduleJob/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<div class="box-body">	
				<div class="form-group">
					<label class="col-sm-3 control-label">任务名称：</label>
					<div class="col-sm-4 controls">
						<form:input path="jobName" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">任务分组：</label>
					<div class="col-sm-4 controls">
						<form:input path="jobGroup" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">任务状态：</label>
					<div class="col-sm-4 controls">
						<form:select path="jobStatus" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('task_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">cron表达式：</label>
					<div class="col-sm-4 controls">
						<form:input path="cronExpression" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">描述：</label>
					<div class="col-sm-4 controls">
						<form:input path="description" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">执行class类：</label>
					<div class="col-sm-4 controls">
						<form:input path="beanClass" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">是否异步执行：</label>
					<div class="col-sm-4 controls">
						<form:select path="isConcurrent" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">spring_id：</label>
					<div class="col-sm-4 controls">
						<form:input path="springId" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">方法名称：</label>
					<div class="col-sm-4 controls">
						<form:input path="methodName" htmlEscape="false" maxlength="255" class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label">备注信息：</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
				</div>
				</div>
				<div class="box-footer">
					<label class="col-sm-3 control-label"></label>
					<shiro:hasPermission name="sys:sysScheduleJob:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
	        </div>
		</div>
      </div>
    </section>
</body>
</html>