<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>审批管理</title>
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
		<li class="active"><a href="${ctx}/oa/testAudit/">审批列表</a></li>
		<shiro:hasPermission name="oa:testAudit:edit"><li><a href="${ctx}/oa/testAudit/form">审批申请流程</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="testAudit" action="${ctx}/oa/testAudit/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
					<div class="col-md-4">
						<div class="form-group">
							<label  class="col-sm-4 control-label">姓名：</label>
							<div class="col-sm-8">
								<sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control"
										 allowClear="true" notAllowSelectParent="true"/>
							</div>
						</div>	
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<div class="col-sm-4">
				            	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
				            </div>
						</div>	
					</div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
					<tr><th class="text-center">姓名</th><th class="text-center">部门</th>
					<th class="text-center">岗位职级</th><th class="text-center">调整原因</th>
					<th class="text-center">申请时间</th><shiro:hasPermission name="oa:testAudit:edit"><th class="text-center">操作</th></shiro:hasPermission></tr>					<c:forEach items="${page.list}" var="testAudit">
						<tr>
							<td class="text-center"><a href="${ctx}/oa/testAudit/form?id=${testAudit.id}">${testAudit.user.name}</a></td>
							<td class="text-center">${testAudit.office.name}</td>
							<td class="text-center">${testAudit.post}</td>
							<td class="text-center">${testAudit.content}</td>
							<td class="text-center"><fmt:formatDate value="${testAudit.createDate}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<shiro:hasPermission name="oa:testAudit:edit"><td class="text-center">
			    				<a href="${ctx}/oa/testAudit/form?id=${testAudit.id}" class="btn btn-success btn-sm">详情</a>
								<a href="${ctx}/oa/testAudit/delete?id=${testAudit.id}" onclick="return confirmx('确认要删除该审批吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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
