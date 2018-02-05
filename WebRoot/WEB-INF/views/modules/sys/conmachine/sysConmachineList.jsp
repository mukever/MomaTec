<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>控制器信息管理</title>
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
		<li class="active"><a href="${ctx}/sys/conmachine/sysConmachine/">控制器信息列表</a></li>
		<shiro:hasPermission name="sys:conmachine:sysConmachine:edit"><li><a href="${ctx}/sys/conmachine/sysConmachine/form">控制器信息添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="sysConmachine" action="${ctx}/sys/conmachine/sysConmachine/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">控制器编号：</label>
								<div class="col-sm-8">
									<form:input path="controllerId" htmlEscape="false" maxlength="64" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">归属机构：</label>
								<div class="col-sm-8">
									<sys:treeselect id="office" name="office.id" value="${sysConmachine.office.id}" labelName="office.name" labelValue="${sysConmachine.office.name}"
										title="部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
	
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th class="text-center">控制器编号</th>
							<th class="text-center">归属机构</th>
							<th class="text-center">加入日期</th>
							<th class="text-center">更新时间</th>
							<th class="text-center">备注信息</th>
							<shiro:hasPermission name="sys:conmachine:sysConmachine:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="sysConmachine">
						<tr>
							<td class="text-center"><a href="${ctx}/sys/conmachine/sysConmachine/form?id=${sysConmachine.id}">
								${sysConmachine.controllerId}
							</a></td>
							<td class="text-center">
								${sysConmachine.office.name}
							</td>
							<td class="text-center">
								<fmt:formatDate value="${sysConmachine.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="text-center">
								<fmt:formatDate value="${sysConmachine.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="text-center">
								${sysConmachine.remarks}
							</td>
							<shiro:hasPermission name="sys:conmachine:sysConmachine:edit"><td>
			    				<a href="${ctx}/sys/conmachine/sysConmachine/form?id=${sysConmachine.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/sys/conmachine/sysConmachine/delete?id=${sysConmachine.id}" onclick="return confirmx('确认要删除该控制器信息吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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