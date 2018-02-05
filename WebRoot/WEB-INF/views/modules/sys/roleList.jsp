]<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>角色管理</title>
	<meta name="decorator" content="adminlte"/>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/role/">角色列表</a></li>
		<shiro:hasPermission name="sys:role:edit"><li><a href="${ctx}/sys/role/form">角色添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
		<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">角色名称</th><th class="text-center">英文名称</th><th class="text-center">归属机构</th><th class="text-center">数据范围</th><shiro:hasPermission name="sys:role:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${list}" var="role">
					<tr>
						<td class="text-center"><a href="form?id=${role.id}">${role.name}</a></td>
						<td class="text-center"><a href="form?id=${role.id}">${role.enname}</a></td>
						<td class="text-center">${role.office.name}</td>
						<td class="text-center">${fns:getDictLabel(role.dataScope, 'sys_data_scope', '无')}</td>
						<shiro:hasPermission name="sys:role:edit"><td class="text-center">
							<a href="${ctx}/sys/role/assign?id=${role.id}" class="btn btn-info btn-sm"><i class="fa fa-plus">&nbsp;分配</i></a>
							<c:if test="${(role.sysData eq fns:getDictValue('是', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('是', 'yes_no', '1'))}">
								<a href="${ctx}/sys/role/form?id=${role.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							</c:if>
							<a href="${ctx}/sys/role/delete?id=${role.id}" onclick="return confirmx('确认要删除该角色吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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