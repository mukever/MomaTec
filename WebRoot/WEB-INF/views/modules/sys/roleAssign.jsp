<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分配角色</title>
	<meta name="decorator" content="adminlte"/>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/role/">角色列表</a></li>
		<li class="active"><a href="${ctx}/sys/role/assign?id=${role.id}"><shiro:hasPermission name="sys:role:edit">角色分配</shiro:hasPermission><shiro:lacksPermission name="sys:role:edit">人员列表</shiro:lacksPermission></a></li>
	</ul>
	<div class="container-fluid breadcrumb">
		<div class="row-fluid span12">
			<span class="span4">角色名称: <b>${role.name}</b></span>
			<span class="span4">归属机构: ${role.office.name}</span>
			<span class="span4">英文名称: ${role.enname}</span>
		</div>
		<div class="row-fluid span8">
			<span class="span4">角色类型: ${role.roleType}</span>
			<c:set var="dictvalue" value="${role.dataScope}" scope="page" />
			<span class="span4">数据范围: ${fns:getDictLabel(dictvalue, 'sys_data_scope', '')}</span>
		</div>
	</div>
	<sys:message content="${message}"/>
	<div class="breadcrumb">
		<form id="assignRoleForm" action="${ctx}/sys/role/assignrole" method="post" class="hide">
			<input type="hidden" name="id" value="${role.id}"/>
			<input id="idsArr" type="hidden" name="idsArr" value=""/>
		</form>
		<input id="assignButton" class="btn btn-primary" type="submit" value="分配角色"/>
		<script type="text/javascript">
			$("#assignButton").click(function(){
				layer.open({
					  type: 2,
					  title: "分配角色",
					  shadeClose: true,
					  shade: 0.3,
					  area: ["810px", "420px"],
					  content: "${ctx}/sys/role/usertorole?id=${role.id}",
					  btn: ['确定', '关闭'],
					  yes: function(index, layero){
							var pre_ids = window[layero.find('iframe')[0]['name']].pre_ids;
							var ids = window[layero.find('iframe')[0]['name']].ids;
							// 删除''的元素
							if(ids[0]==''){
								ids.shift();
								pre_ids.shift();
							}
							if(pre_ids.sort().toString() == ids.sort().toString()){
								layer.alert("未给角色【${role.name}】分配新成员！");
								return false;
							};
					    	var idsArr = "";
					    	for (var i = 0; i<ids.length; i++) {
					    		idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
					    	}
					    	$('#idsArr').val(idsArr);
					    	$('#assignRoleForm').submit();
					  },
					  btn2: function(index, layero){
						  layer.close(index);
					  }
				});
			});
		</script>
	</div>
	<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
		<tr><th>归属公司</th><th>归属部门</th><th>登录名</th><th>姓名</th><th>电话</th><th>手机</th><shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr>
		<c:forEach items="${userList}" var="user">
			<tr>
				<td>${user.company.name}</td>
				<td>${user.office.name}</td>
				<td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.phone}</td>
				<td>${user.mobile}</td>
				<shiro:hasPermission name="sys:role:edit"><td>
					<a href="${ctx}/sys/role/outrole?userId=${user.id}&roleId=${role.id}" 
						onclick="return confirmx('确认要将用户<b>[${user.name}]</b>从<b>[${role.name}]</b>角色中移除吗？', this.href)">移除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
