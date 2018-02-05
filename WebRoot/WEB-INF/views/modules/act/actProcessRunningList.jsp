<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运行中的流程</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
		});
		function page(n,s){
        	location = '${ctx}/act/process/running/?pageNo='+n+'&pageSize='+s;
        }
		function updateCategory(id, category){
			$.jBox($("#categoryBox").html(), {title:"设置分类", buttons:{"关闭":true}, submit: function(){}});
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
		}
	</script>
	<script type="text/template" id="categoryBox">
		<form id="categoryForm" action="${ctx}/act/process/updateCategory" method="post" enctype="multipart/form-data"
			style="text-align:center;" class="form-search" onsubmit="loading('正在设置，请稍等...');"><br/>
			<input id="categoryBoxId" type="hidden" name="procDefId" value="" />
			<select id="categoryBoxCategory" name="category">
				<c:forEach items="${fns:getDictList('act_category')}" var="dict">
					<option value="${dict.value}">${dict.label}</option>
				</c:forEach>
			</select>
			<br/><br/>　　
			<input id="categorySubmit" class="btn btn-primary" type="submit" value="   保    存   "/>　　
		</form>
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/act/process/">流程管理</a></li>
		<li><a href="${ctx}/act/process/deploy/">部署流程</a></li>
		<li class="active"><a href="${ctx}/act/process/running/">运行中的流程</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form id="searchForm" action="${ctx}/act/process/running/" method="post" class="form-horizontal">
				<div class="box-body">
				<div class="col-md-5">
					<div class="form-group">
						<label class="col-sm-4 control-label">流程实例ID：</label>
						<div class="col-sm-8">
							<input type="text" id="procInsId" name="procInsId" value="${procInsId}" class="form-control"/>
		                </div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="form-group">
						<label class="col-sm-4 control-label">流程定义Key：</label>
						<div class="col-sm-8">
							<input type="text" id="procDefKey" name="procDefKey" value="${procDefKey}" class="form-control"/>
		                </div>
					</div>
				</div>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				</div>
			</form>
			<sys:message content="${message}"/>
			<table class="table table-bordered table-striped table-hover dataTable no-footer">
					<tr>
						<th class="text-center">执行ID</th>
						<th class="text-center">流程实例ID</th>
						<th class="text-center">流程定义ID</th>
						<th class="text-center">当前环节</th>
						<th class="text-center">是否挂起</th>
						<th class="text-center">操作</th>
					</tr>
					<c:forEach items="${page.list}" var="procIns">
						<tr>
							<td class="text-center">${procIns.id}</td>
							<td class="text-center">${procIns.processInstanceId}</td>
							<td class="text-center">${procIns.processDefinitionId}</td>
							<td class="text-center">${procIns.activityId}</td>
							<td class="text-center">${procIns.suspended}</td>
							<td class="text-center">
								<shiro:hasPermission name="act:process:edit">
									<a href="${ctx}/act/process/deleteProcIns?procInsId=${procIns.processInstanceId}&reason=" onclick="return promptx('删除流程','删除原因',this.href);" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除流程</i></a>
								</shiro:hasPermission>&nbsp;
							</td>
						</tr>
					</c:forEach>
			</table>
					 	${page}					 
				</div>
			</div>
		</div>
	</section>
</body>
</html>
