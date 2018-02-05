<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>业务表管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gen/genTable/">业务表列表</a></li>
		<shiro:hasPermission name="gen:genTable:edit"><li><a href="${ctx}/gen/genTable/form">业务表添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="genTable" action="${ctx}/gen/genTable/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
					<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">表名：</label>
							<div class="col-sm-8">
								<form:input path="nameLike" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">说明：</label>
							<div class="col-sm-8">
								<form:input path="comments" htmlEscape="false" maxlength="50" class="form-control"/>							
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">父表表名：</label>
							<div class="col-sm-8">
								<form:input path="parentTable" htmlEscape="false" maxlength="50" class="form-control"/>
							</div>
						</div>
					</div>
					<div class="col-md-12 col-md-offset-5">
		            	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
		            </div>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="sort-column name text-center">表名</th><th class="text-center">说明</th>
				<th class="sort-column class_name text-center">类名</th><th class="sort-column parent_table text-center">父表</th>
				<shiro:hasPermission name="gen:genTable:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${page.list}" var="genTable">
					<tr>
						<td class="text-center"><a href="${ctx}/gen/genTable/form?id=${genTable.id}">${genTable.name}</a></td>
						<td class="text-center">${genTable.comments}</td>
						<td class="text-center">${genTable.className}</td>
						<td title="点击查询子表" class="text-center"><a href="javascript:" onclick="$('#parentTable').val('${genTable.parentTable}');$('#searchForm').submit();">${genTable.parentTable}</a></td>
						<shiro:hasPermission name="gen:genTable:edit"><td class="text-center">
		    				<a href="${ctx}/gen/genTable/form?id=${genTable.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							<a href="${ctx}/gen/genTable/delete?id=${genTable.id}" onclick="return confirmx('确认要删除该业务表吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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
