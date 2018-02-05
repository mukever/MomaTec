<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/onlineUser">在线用户列表</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/onlineUser" method="post" class="form-horizontal ">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
				<div class="box-body">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-sm-6 control-label">归属公司：</label>
							<div class="col-sm-6">
								<sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
									title="公司" url="/sys/office/treeData?type=1" cssClass="form-control" allowClear="true"/>
			                </div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-sm-6 control-label">登录名：</label>
							<div class="col-sm-6">
								<form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control"/>
			                </div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-sm-6 control-label">归属部门：</label>
							<div class="col-sm-6">
								<sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
									title="部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
			                </div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="col-sm-6 control-label">姓&nbsp;&nbsp;&nbsp;名：</label>
							<div class="col-sm-6">
								<form:input path="name" htmlEscape="false" maxlength="50" class="form-control"/>
			                </div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-sm-offset-5">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" onclick="return page();"/>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">归属公司</th><th class="text-center">归属部门</th><th class="sort-column login_name text-center">登录名</th><th class="sort-column name text-center">姓名</th><th class="text-center">电话</th><th class="text-center">手机</th><%--<th>角色</th> --%><shiro:hasPermission name="sys:user:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${users}" var="user">
					<tr>
						<td class="text-center">${user.company.name}</td>
						<td class="text-center">${user.office.name}</td>
						<td class="text-center"><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
						<td class="text-center">${user.name}</td>
						<td class="text-center">${user.phone}</td>
						<td class="text-center">${user.mobile}</td><%--
						<td>${user.roleNames}</td> --%>
						<shiro:hasPermission name="sys:user:edit"><td class="text-center">
		    				<a href="${ctx}/sys/user/loginOut?id=${user.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;强制下线</i></span></a>
						</td></shiro:hasPermission>
					</tr>
				</c:forEach>
			</table>				 
				</div>
			</div>
		</div>
	</section>
</body>
</html>