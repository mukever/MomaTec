<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>发起任务</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
		});
		function page(n,s){
        	location = '${ctx}/act/task/process/?pageNo='+n+'&pageSize='+s;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/act/task/todo/">待办任务</a></li>
		<li><a href="${ctx}/act/task/historic/">已办任务</a></li>
		<li class="active"><a href="${ctx}/act/task/process/">新建任务</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form id="searchForm" action="${ctx}/act/task/process/" method="post" class="form-horizontal">
				<div class="box-body">
				<div class="col-md-8">
					<div class="form-group">
						<label class="col-sm-4 control-label">全部分类：</label>
						<div class="col-sm-4">
							<select id="category" name="category" class="form-control">
								<option value="">全部分类</option>
								<c:forEach items="${fns:getDictList('act_category')}" var="dict">
									<option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-4">
			            	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
			            </div>
					</div>
				</div>
				</div>
			</form>
			<sys:message content="${message}"/>
			<table class="table table-bordered table-striped table-hover dataTable no-footer">
					<tr>
						<th class="text-center">流程分类</th>
						<th class="text-center">流程标识</th>
						<th class="text-center">流程名称</th>
						<th class="text-center">流程图</th>
						<th class="text-center">流程版本</th>
						<th class="text-center">更新时间</th>
						<th class="text-center">操作</th>
					</tr>
					<c:forEach items="${page.list}" var="object">
						<c:set var="process" value="${object[0]}" />
						<c:set var="deployment" value="${object[1]}" />
						<tr>
							<td class="text-center">${fns:getDictLabel(process.category,'act_category','无分类')}</td>
							<td class="text-center"><a href="${ctx}/act/task/form?procDefId=${process.id}">${process.key}</a></td>
							<td class="text-center">${process.name}</td>
							<td class="text-center"><a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${process.id}">${process.diagramResourceName}</a><%--
								<a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=image">${process.diagramResourceName}</a>--%></td>
							<td class="text-center"><b title='流程版本号'>V: ${process.version}</b></td>
							<td class="text-center"><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="text-center">
								<a href="${ctx}/act/task/form?procDefId=${process.id}" class="btn btn-info btn-sm">启动流程</a>
							</td>
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
