<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
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
		<li class="active"><a href="${ctx}/sys/dict/">字典列表</a></li>
		<shiro:hasPermission name="sys:dict:edit"><li><a href="${ctx}/sys/dict/form?sort=10">字典添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">类型：</label>
						<div class="col-sm-8">
							<form:select id="type" path="type" class="form-control"><form:option value="" label=""/><form:options items="${typeList}" htmlEscape="false"/></form:select>
		                </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">描述 ：</label>
						<div class="col-sm-8">
							<form:input path="description" htmlEscape="false" maxlength="50" class="form-control"/>
		                </div>
					</div>
				</div>
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">键值</th><th class="text-center">标签</th><th class="text-center">类型</th>
				<th  class="text-center">描述</th><th class="text-center">排序</th><shiro:hasPermission name="sys:dict:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${page.list}" var="dict">
					<tr>
						<td class="text-center">${dict.value}</td>
						<td class="text-center"><a href="${ctx}/sys/dict/form?id=${dict.id}">${dict.label}</a></td>
						<td class="text-center"><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a></td>
						<td class="text-center">${dict.description}</td>
						<td class="text-center">${dict.sort}</td>
						<shiro:hasPermission name="sys:dict:edit"><td class="text-center">
		    				<a href="${ctx}/sys/dict/form?id=${dict.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							<a href="${ctx}/sys/dict/delete?id=${dict.id}&type=${dict.type}" onclick="return confirmx('确认要删除该字典吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
		    				<a href="<c:url value='${fns:getAdminPath()}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}'><c:param name='description' value='${dict.description}' /></c:url> " class="btn btn-info btn-sm"><i class="fa fa-plus">&nbsp;添加键值</i></a>
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