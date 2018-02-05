<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				layer.confirm('确认要导出用户数据吗？', {
					title:"导出数据",btn: ['确定','取消']
					}, function(){
						$("#searchForm").attr("action","${ctx}/sys/user/export");
						$("#searchForm").submit();
					}, function(){

				    });
			});
			$("#btnImport").click(function(){
				layer.open({
					  type: 1,
					  title:"导入数据(导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！)",
					  skin: 'layui-layer-rim', //加上边框
					  area: ['550px', '240px'], //宽高
					  content: $("#importBox").html()
				});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/list">用户列表</a></li>
		<shiro:hasPermission name="sys:user:edit"><li><a href="${ctx}/sys/user/form">用户添加</a></li></shiro:hasPermission>
	</ul>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/sys/user/import/template">下载模板</a>
		</form>
	</div>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/list" method="post" class="form-horizontal ">
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
						<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
						<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">归属公司</th><th class="text-center">归属部门</th><th class="sort-column login_name text-center">登录名</th><th class="sort-column name text-center">姓名</th><th class="text-center">电话</th><th class="text-center">手机</th><%--<th>角色</th> --%><shiro:hasPermission name="sys:user:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>
				<c:forEach items="${page.list}" var="user">
					<tr>
						<td class="text-center">${user.company.name}</td>
						<td class="text-center">${user.office.name}</td>
						<td class="text-center"><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
						<td class="text-center">${user.name}</td>
						<td class="text-center">${user.phone}</td>
						<td class="text-center">${user.mobile}</td><%--
						<td>${user.roleNames}</td> --%>
						<shiro:hasPermission name="sys:user:edit"><td class="text-center">
		    				<a href="${ctx}/sys/user/form?id=${user.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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