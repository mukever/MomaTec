<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统参数管理</title>
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
		<li class="active"><a href="${ctx}/sys/sysParam/">系统参数列表</a></li>
		<shiro:hasPermission name="sys:sysParam:edit"><li><a href="${ctx}/sys/sysParam/form">系统参数添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="sysParam" action="${ctx}/sys/sysParam/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">属性编号：</label>
								<div class="col-sm-8">
									<form:input path="paramCode" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">属性名：</label>
								<div class="col-sm-8">
									<form:input path="paramName" htmlEscape="false" maxlength="200" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th class="text-center">属性编号</th>
							<th class="text-center">属性名</th>
							<th class="text-center">属性值</th>
							<th class="text-center">扩展属性1</th>
							<th class="text-center">扩展属性2</th>
							<th class="text-center">扩展属性3</th>
							<shiro:hasPermission name="sys:sysParam:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="sysParam">
						<tr>
							<td class="text-center"><a href="${ctx}/sys/sysParam/form?id=${sysParam.id}">
								${sysParam.paramCode}
							</a></td>
							<td class="text-center">
								${sysParam.paramName}
							</td>
							<td class="text-center">
								${sysParam.paramValue}
							</td>
							<td class="text-center">
								${sysParam.paramAttr1}
							</td>
							<td class="text-center">
								${sysParam.paramAttr2}
							</td>
							<td class="text-center">
								${sysParam.paramAttr3}
							</td>
							<shiro:hasPermission name="sys:sysParam:edit"><td>
			    				<a href="${ctx}/sys/sysParam/form?id=${sysParam.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/sys/sysParam/delete?id=${sysParam.id}" onclick="return confirmx('确认要删除该系统参数吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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