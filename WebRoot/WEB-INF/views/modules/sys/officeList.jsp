<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>机构管理</title>
	<meta name="decorator" content="adminlte"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "${not empty office.id ? office.id : '0'}";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_office_type'))}, row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/office/list?id=${office.id}&parentIds=${office.parentIds}">机构列表</a></li>
		<shiro:hasPermission name="sys:office:edit"><li><a href="${ctx}/sys/office/form?parent.id=${office.id}">机构添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-bordered table-striped table-hover dataTable no-footer">
		<thead><tr><th>&nbsp;&nbsp;&nbsp;&nbsp;机构名称</th><th class="text-center">机构编码</th><th class="text-center">机构类型</th><th class="text-center">备注</th><shiro:hasPermission name="sys:office:edit"><th class="text-center">操作</th></shiro:hasPermission></tr></thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			
			<td><a href="${ctx}/sys/office/form?id={{row.id}}">{{row.name}}</a></td>
			<td class="text-center">{{row.code}}</td>
			<td class="text-center">{{dict.type}}</td>
			<td class="text-center">{{row.remarks}}</td>
			<shiro:hasPermission name="sys:office:edit"><td class="text-center">
				<a href="${ctx}/sys/office/form?id={{row.id}}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
				<a href="${ctx}/sys/office/delete?id={{row.id}}" onclick="return confirmx('要删除该机构及所有子机构项吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
				<a href="${ctx}/sys/office/form?parent.id={{row.id}}" class="btn btn-info btn-sm"><i class="fa fa-plus">&nbsp;添加下级机构</i></a> 
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>