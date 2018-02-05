<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
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
		<li class="active"><a href="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}">通知列表</a></li>
		<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><li><a href="${ctx}/oa/oaNotify/form">通知添加</a></li></shiro:hasPermission></c:if>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header with-border">
	              <h3 class="box-title">通知列表</h3>
	            </div>
	<form:form id="searchForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/${oaNotify.self?'self':''}" method="post" class="form-horizontal">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<div class="box-body">
			<div class="col-md-4">
				<div class="form-group">
					<label  class="col-sm-4 control-label">标题：</label>
					<div class="col-sm-8">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control"/>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label  class="col-sm-4 control-label">类型：</label>
					<div class="col-sm-8">
						<form:select path="type" class="form-control">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">					
					<div class="col-sm-8">
			        	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
			<tr>
				<th class="text-center">标题</th>
				<th class="text-center">类型</th>
				<th class="text-center">状态</th>
				<th class="text-center">查阅状态</th>
				<th class="text-center">更新时间</th>
				<c:if test="${!oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><th class="text-center">操作</th></shiro:hasPermission></c:if>
			</tr>
		<c:forEach items="${page.list}" var="oaNotify">
			<tr>
				<td class="text-center"><a href="${ctx}/oa/oaNotify/${requestScope.oaNotify.self?'view':'form'}?id=${oaNotify.id}">
					${fns:abbr(oaNotify.title,50)}
				</a></td>
				<td class="text-center">
					${fns:getDictLabel(oaNotify.type, 'oa_notify_type', '')}
				</td>
				<td class="text-center">
					${fns:getDictLabel(oaNotify.status, 'oa_notify_status', '')}
				</td>
				<td class="text-center">
					<c:if test="${requestScope.oaNotify.self}">
						${fns:getDictLabel(oaNotify.readFlag, 'oa_notify_read', '')}
					</c:if>
					<c:if test="${!requestScope.oaNotify.self}">
						${oaNotify.readNum} / ${oaNotify.readNum + oaNotify.unReadNum}
					</c:if>
				</td>
				<td class="text-center">
					<fmt:formatDate value="${oaNotify.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<c:if test="${!requestScope.oaNotify.self}"><shiro:hasPermission name="oa:oaNotify:edit"><td class="text-center">
    				<a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
					<a href="${ctx}/oa/oaNotify/delete?id=${oaNotify.id}" onclick="return confirmx('确认要删除该通知吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
				</td></shiro:hasPermission></c:if>
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