<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>流程管理</title>
	<meta name="decorator" content="adminlte"/>
	<style type="text/css">
		#adminlteBody{
			width: 1500px;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
		});
		function page(n,s){
        	location = '${ctx}/act/process/?pageNo='+n+'&pageSize='+s;
        }
		function updateCategory(id, category){
			$.jBox($("#categoryBox").html(), {title:"设置分类", buttons:{"关闭":true}, submit: function(){}});
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
		}
	</script>
	<script type="text/template" id="categoryBox">
		<form id="categoryForm" action="${ctx}/act/process/updateCategory" method="post" enctype="multipart/form-data"
			class="form-horizontal" style="text-align:center;" class="form-search" onsubmit="loading('正在设置，请稍等...');"><br/>
			<input id="categoryBoxId" type="hidden" name="procDefId" value="" />
			<select id="categoryBoxCategory" name="category" class="form-control select2">
				<option value="">无分类</option>
				<c:forEach items="${fns:getDictList('act_category')}" var="dict">
					<option value="${dict.value}">${dict.label}</option>
				</c:forEach>
			</select>
			<br/><br/>　　
			<input id="categorySubmit" class="btn btn-primary" type="submit" value="   保    存   "/>　　
		</form>
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/act/process/">流程管理</a></li>
		<li><a href="${ctx}/act/process/deploy/">部署流程</a></li>
		<li><a href="${ctx}/act/process/running/">运行中的流程</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form id="searchForm" action="${ctx}/act/process/" method="post" class="form-horizontal">
				<div class="box-body">
				<div class="col-md-4">
					<div class="form-group">
						<div class="col-sm-8">
							<select id="category" name="category" class="form-control select2">
								<option value="">全部分类</option>
								<c:forEach items="${fns:getDictList('act_category')}" var="dict">
									<option value="${dict.value}" ${dict.value==category?'selected':''}>${dict.label}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				</div>
			</form>
			<sys:message content="${message}"/>
			<table class="table table-bordered table-striped table-hover dataTable no-footer">
					<tr>
						<th class="text-center">流程分类</th>
						<th class="text-center">流程ID</th>
						<th class="text-center">流程标识</th>
						<th class="text-center">流程名称</th>
						<th class="text-center">流程版本</th>
						<th class="text-center">部署时间</th>
						<th class="text-center">流程XML</th>
						<th class="text-center">流程图片</th>
						<th class="text-center">操作</th>
					</tr>
					<c:forEach items="${page.list}" var="object">
						<c:set var="process" value="${object[0]}" />
						<c:set var="deployment" value="${object[1]}" />
						<tr>
							<td class="text-center"><a href="javascript:updateCategory('${process.id}', '${process.category}')" title="设置分类">${fns:getDictLabel(process.category,'act_category','无分类')}</a></td>
							<td class="text-center">${process.id}</td>
							<td class="text-center">${process.key}</td>
							<td class="text-center">${process.name}</td>
							<td class="text-center"><b title='流程版本号'>V: ${process.version}</b></td>
							<td class="text-center"><fmt:formatDate value="${deployment.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="text-center"><a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=xml">${process.resourceName}</a></td>
							<td class="text-center"><a target="_blank" href="${ctx}/act/process/resource/read?procDefId=${process.id}&resType=image">${process.diagramResourceName}</a></td>
							<td class="text-center">
								<c:if test="${process.suspended}">
									<a href="${ctx}/act/process/update/active?procDefId=${process.id}" onclick="return confirmx('确认要激活吗？', this.href)" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;激活</i></span></a>
								</c:if>
								<c:if test="${!process.suspended}">
									<a href="${ctx}/act/process/update/suspend?procDefId=${process.id}" onclick="return confirmx('确认挂起除吗？', this.href)" class="btn btn-warning btn-sm">挂起</a>
								</c:if>
								<a href='${ctx}/act/process/delete?deploymentId=${process.deploymentId}' onclick="return confirmx('确认要删除该流程吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
		                        <a href='${ctx}/act/process/convert/toModel?procDefId=${process.id}' onclick="return confirmx('确认要转换为模型吗？', this.href)" class="btn btn-info btn-sm">转换为模型</a>
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
