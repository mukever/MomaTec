<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>日志管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" action="${ctx}/sys/log/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">操作菜单：</label>
						<div class="col-sm-8">
							<input id="title" name="title" type="text" maxlength="50" class="form-control" value="${log.title}"/>
		                </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">用户ID：</label>
						<div class="col-sm-8">
							<input id="createBy.id" name="createBy.id" type="text" maxlength="50" class="form-control" value="${log.createBy.id}"/>
		                </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">URI：</label>
						<div class="col-sm-8">
							<input id="requestUri" name="requestUri" type="text" maxlength="50" class="form-control" value="${log.requestUri}"/>
		                </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">日期范围：</label>
						<div class="col-sm-8">
							<input id="beginDate" name="beginDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate"
								value="<fmt:formatDate value="${log.beginDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
		                </div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label class="col-sm-4 control-label">--------</label>
						<div class="col-sm-8">
							<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate"
								value="<fmt:formatDate value="${log.endDate}" pattern="yyyy-MM-dd"/>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
		                </div>
					</div>
				</div>

				<div style="margin-top:8px;">
					<label for="exception"><input id="exception" name="exception" type="checkbox"${log.exception eq '1'?' checked':''} value="1"/>只查询异常信息</label>
					&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
				</div>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<tr><th class="text-center">操作菜单</th><th class="text-center">操作用户</th>
				<th class="text-center">所在公司</th><th class="text-center">所在部门</th><th class="text-center">URI</th>
				<th class="text-center">提交方式</th><th class="text-center">操作者IP</th><th class="text-center">操作时间</th>
				<%request.setAttribute("strEnter", "\n");request.setAttribute("strTab", "\t");%>
				<c:forEach items="${page.list}" var="log">
					<tr>
						<td class="text-center">${log.title}</td>
						<td class="text-center">${log.createBy.name}</td>
						<td class="text-center">${log.createBy.company.name}</td>
						<td class="text-center">${log.createBy.office.name}</td>
						<td class="text-center"><strong>${log.requestUri}</strong></td>
						<td class="text-center">${log.method}</td>
						<td class="text-center">${log.remoteAddr}</td>
						<td class="text-center"><fmt:formatDate value="${log.createDate}" type="both"/></td>
					</tr>
					<c:if test="${not empty log.exception}"><tr>
						<td colspan="8" style="word-wrap:break-word;word-break:break-all;">
		<%-- 					用户代理: ${log.userAgent}<br/> --%>
		<%-- 					提交参数: ${fns:escapeHtml(log.params)} <br/> --%>
							异常信息: <br/>
							${fn:replace(fn:replace(fns:escapeHtml(log.exception), strEnter, '<br/>'), strTab, '&nbsp; &nbsp; ')}</td>
					</tr></c:if>
				</c:forEach>
			</table>
					${page}					 
				</div>
			</div>
		</div>
	</section>
</body>
</html>