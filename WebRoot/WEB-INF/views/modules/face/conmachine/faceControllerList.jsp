<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分配控制器管理</title>
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
		<li class="active"><a href="${ctx}/face/conmachine/faceController/">分配列表</a></li>
		<shiro:hasPermission name="face:conmachine:faceController:edit"><li><a href="${ctx}/face/conmachine/faceController/form">分配控制器</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="faceController" action="${ctx}/face/conmachine/faceController/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">归属宿楼：</label>
								<div class="col-sm-8">
									<sys:treeselect id="office" name="office.id" value="${faceController.office.id}" labelName="office.name" labelValue="${faceController.office.name}"
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
							<th class="text-center">系统控制器编号</th>
							<th class="text-center">归属宿楼</th>
							<th class="text-center">更新时间</th>
							<th class="text-center">备注信息</th>
							<shiro:hasPermission name="face:conmachine:faceController:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="faceController">
						<tr>
							<td class="text-center"><a href="${ctx}/face/conmachine/faceController/form?id=${faceController.id}">
								${faceController.conmachineId}
							</a></td>
							<td class="text-center">
								${faceController.office.name}
							</td>
							<td class="text-center">
								<fmt:formatDate value="${faceController.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="text-center">
								${faceController.remarks}
							</td>
							<shiro:hasPermission name="face:conmachine:faceController:edit"><td>
								<a href="${ctx}/face/conmachine/faceController/delete?id=${faceController.id}" onclick="return confirmx('确认要删除该分配控制器吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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