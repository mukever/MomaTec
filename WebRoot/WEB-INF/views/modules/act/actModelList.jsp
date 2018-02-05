<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>模型管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function(){
			top.$.jBox.tip.mess = null;
		});
		function page(n,s){
        	location = '${ctx}/act/model/?pageNo='+n+'&pageSize='+s;
        }
		function updateCategory(id, category){
			$.jBox($("#categoryBox").html(), {title:"设置分类", buttons:{"关闭":true}, submit: function(){}});
			$("#categoryBoxId").val(id);
			$("#categoryBoxCategory").val(category);
		}
	</script>
	<script type="text/template" id="categoryBox">
		<form id="categoryForm" action="${ctx}/act/model/updateCategory" method="post" enctype="multipart/form-data"
			style="text-align:center;" class="form-search" onsubmit="loading('正在分类，请稍等...');"><br/>
			<input id="categoryBoxId" type="hidden" name="id" value="" />
			<select id="categoryBoxCategory" name="category">
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
		<li class="active"><a href="${ctx}/act/model/">模型管理</a></li>
		<li><a href="${ctx}/act/model/create">新建模型</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form id="searchForm" action="${ctx}/act/model/" method="post" class="form-horizontal">
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
						<th class="text-center">模型ID</th>
						<th class="text-center">模型标识</th>
						<th class="text-center">模型名称</th>
						<th class="text-center">版本号</th>
						<th class="text-center">创建时间</th>
						<th class="text-center">最后更新时间</th>
						<th class="text-center">操作</th>
					</tr>
					<c:forEach items="${page.list}" var="model">
						<tr>
							<td class="text-center"><a href="javascript:updateCategory('${model.id}', '${model.category}')" title="设置分类">${fns:getDictLabel(model.category,'act_category','无分类')}</a></td>
							<td class="text-center">${model.id}</td>
							<td class="text-center">${model.key}</td>
							<td class="text-center">${model.name}</td>
							<td class="text-center"><b title='流程版本号'>V: ${model.version}</b></td>
							<td class="text-center"><fmt:formatDate value="${model.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="text-center"><fmt:formatDate value="${model.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							<td class="text-center">
								<a href="${pageContext.request.contextPath}/act/process-editor/modeler.jsp?modelId=${model.id}" target="_blank" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;编辑</i></span></a>
								<a href="${ctx}/act/model/deploy?id=${model.id}" onclick="return confirmx('确认要部署该模型吗？', this.href)" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;部署</i></span></a>
								<a href="${ctx}/act/model/export?id=${model.id}" target="_blank" class="btn btn-info btn-sm">导出</a>
			                    <a href="${ctx}/act/model/delete?id=${model.id}" onclick="return confirmx('确认要删除该模型吗？', this.href)" class="btn btn-warning btn-sm" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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
