<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>生成方案管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gen/genScheme/">生成方案列表</a></li>
		<shiro:hasPermission name="gen:genScheme:edit"><li><a href="${ctx}/gen/genScheme/form">生成方案添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">	
				<div class="form-group">
					<label  class="col-sm-2 control-label">方案名称 ：</label>
					<div class="col-sm-4 controls">
					<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
					</div>
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				</div>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">方案名称</th><th class="text-center">生成模块</th><th class="text-center">模块名</th><th class="text-center">功能名</th><th class="text-center">功能作者</th><shiro:hasPermission name="gen:genScheme:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${page.list}" var="genScheme">
					<tr>
						<td class="text-center"><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">${genScheme.name}</a></td>
						<td class="text-center">${genScheme.packageName}</td>
						<td class="text-center">${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
						<td class="text-center">${genScheme.functionName}</td>
						<td class="text-center">${genScheme.functionAuthor}</td>
						<shiro:hasPermission name="gen:genScheme:edit"><td class="text-center">
		    				<a href="${ctx}/gen/genScheme/form?id=${genScheme.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							<a href="${ctx}/gen/genScheme/delete?id=${genScheme.id}" onclick="return confirmx('确认要删除该生成方案吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
						</td></shiro:hasPermission>
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
