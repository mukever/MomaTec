<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>已办任务</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
        	location = '${ctx}/act/task/historic/?pageNo='+n+'&pageSize='+s;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/act/task/todo/">待办任务</a></li>
		<li class="active"><a href="${ctx}/act/task/historic/">已办任务</a></li>
		<li><a href="${ctx}/act/task/process/">新建任务</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header with-border">
	              <h3 class="box-title">已办任务</h3>
	            </div>
				<form:form id="searchForm" modelAttribute="act" action="${ctx}/act/task/historic/" method="get" class="form-horizontal">
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">流程类型：</label>
								<div class="col-sm-8">
									<form:select path="procDefKey" class="form-control select2">
										<form:option value="" label="全部流程"/>
										<form:options items="${fns:getDictList('act_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
				                </div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-6 control-label">创建时间：</label>
								<div class="col-sm-6">
									<input id="beginDate"  name="beginDate"  type="text" readonly="readonly" maxlength="20" class="form-control Wdate" style="width:163px;"
									value="<fmt:formatDate value="${act.beginDate}" pattern="yyyy-MM-dd"/>"
										onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				                </div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-3 control-label">--</label>
								<div class="col-sm-6">
									<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate" style="width:163px;"
										value="<fmt:formatDate value="${act.endDate}" pattern="yyyy-MM-dd"/>"
											onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
				                </div>
							</div>
						</div>
			            <div class="col-md-12 col-md-offset-5">
			            	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
			            </div>						</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th>标题</th>
							<th>当前环节</th><%--
							<th>任务内容</th> --%>
							<th>流程名称</th>
							<th>流程版本</th>
							<th>完成时间</th>
							<th>操作</th>
						</tr>
						<c:forEach items="${page.list}" var="act">
							<c:set var="task" value="${act.histTask}" />
							<c:set var="vars" value="${act.vars}" />
							<c:set var="procDef" value="${act.procDef}" /><%--
							<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
							<c:set var="status" value="${act.status}" />
							<tr>
								<td>
									<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
								</td>
								<td>
									<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a><%--
									<a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">${task.name}</a>
									<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">${task.name}</a> --%>
								</td><%--
								<td>${task.description}</td> --%>
								<td>${procDef.name}</td>
								<td><b title='流程版本号'>V: ${procDef.version}</b></td>
								<td><fmt:formatDate value="${task.endTime}" type="both"/></td>
								<td>
									<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" class="btn btn-info btn-sm">详情</a>
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
