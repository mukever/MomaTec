<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分配控制器管理</title>
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
		<li><a href="${ctx}/face/conmachine/faceController/">分配控制器列表</a></li>
		<li class="active"><a href="${ctx}/face/conmachine/faceController/form?id=${faceController.id}">分配控制器<shiro:hasPermission name="face:conmachine:faceController:edit">${not empty faceController.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="face:conmachine:faceController:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="faceController" action="${ctx}/face/conmachine/faceController/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>系统控制器编号：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="conmachineId" name="conmachineId" value="${faceController.conmachineId}" labelName="conmachineId" labelValue="${faceController.conmachineId}"
							title="编号" url="/face/conmachine/faceController/treeData" cssClass="form-control required"  notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>归属宿楼：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="office" name="office.id" value="${faceController.office.id}" labelName="office.name" labelValue="${faceController.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" allowClear="true" notAllowSelectParent="true"/>
					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label">加入日期：
					</label>
					<div class="col-sm-4 controls">
						<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate "
							value="<fmt:formatDate value="${faceController.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
					<shiro:hasPermission name="face:conmachine:faceController:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>