<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统序列管理</title>
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
		<li class="active"><a href="${ctx}/sys/sysSequence/">系统序列列表</a></li>
		<shiro:hasPermission name="sys:sysSequence:edit"><li><a href="${ctx}/sys/sysSequence/form">系统序列添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="sysSequence" action="${ctx}/sys/sysSequence/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">序列名称：</label>
								<div class="col-sm-8">
									<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th class="text-center">序列名称</th>
							<th class="text-center">当前序列值</th>
							<th class="text-center">自增值</th>
							<shiro:hasPermission name="sys:sysSequence:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="sysSequence">
						<tr>
							<td class="text-center"><a href="${ctx}/sys/sysSequence/form?id=${sysSequence.id}">
								${sysSequence.name}
							</a></td>
							<td class="text-center">
								${sysSequence.currentValue}
							</td>
							<td class="text-center">
								${sysSequence.increment}
							</td>
							<shiro:hasPermission name="sys:sysSequence:edit"><td>
			    				<a href="${ctx}/sys/sysSequence/form?id=${sysSequence.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/sys/sysSequence/delete?id=${sysSequence.id}" onclick="return confirmx('确认要删除该系统序列吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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