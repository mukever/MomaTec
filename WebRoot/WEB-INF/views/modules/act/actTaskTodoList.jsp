<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>待办任务</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		/**
		 * 签收任务
		 */
		function claim(taskId) {
			$.get('${ctx}/act/task/claim' ,{taskId: taskId}, function(data) {
				if (data == 'true'){
		        	top.$.jBox.tip('签收完成');
		            location = '${ctx}/act/task/todo/';
				}else{
		        	top.$.jBox.tip('签收失败');
				}
		    });
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/act/task/todo/">待办任务</a></li>
		<li><a href="${ctx}/act/task/historic/">已办任务</a></li>
		<li><a href="${ctx}/act/task/process/">新建任务</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header with-border">
	              <h3 class="box-title">代办任务</h3>
	            </div>
				<form:form id="searchForm" modelAttribute="act" action="${ctx}/act/task/todo/" method="get" class="form-horizontal">
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
			            </div>					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
							<th class="text-center">标题</th>
							<th class="text-center">当前环节</th><%--
							<th class="text-center">任务内容</th> --%>
							<th class="text-center">流程名称</th>
							<th class="text-center">流程版本</th>
							<th class="text-center">创建时间</th>
							<th class="text-center">操作</th>
						</tr>
						<c:forEach items="${list}" var="act">
							<c:set var="task" value="${act.task}" />
							<c:set var="vars" value="${act.vars}" />
							<c:set var="procDef" value="${act.procDef}" /><%--
							<c:set var="procExecUrl" value="${act.procExecUrl}" /> --%>
							<c:set var="status" value="${act.status}" />
							<tr>
								<td class="text-center">
									<c:if test="${empty task.assignee}">
										<a href="javascript:claim('${task.id}');" title="签收任务">${fns:abbr(not empty act.vars.map.title ? act.vars.map.title : task.id, 60)}</a>
									</c:if>
									<c:if test="${not empty task.assignee}">
										<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}">${fns:abbr(not empty vars.map.title ? vars.map.title : task.id, 60)}</a>
									</c:if>
								</td>
								<td class="text-center">
									<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}">${task.name}</a>
								</td><%--
								<td class="text-center">${task.description}</td> --%>
								<td class="text-center">${procDef.name}</td>
								<td class="text-center"><b title='流程版本号'>V: ${procDef.version}</b></td>
								<td class="text-center"><fmt:formatDate value="${task.createTime}" type="both"/></td>
								<td class="text-center">
									<c:if test="${empty task.assignee}">
										<a href="javascript:claim('${task.id}');" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;签收任务</i></span></a>
									</c:if>
									<c:if test="${not empty task.assignee}"><%--
										<a href="${ctx}${procExecUrl}/exec/${task.taskDefinitionKey}?procInsId=${task.processInstanceId}&act.taskId=${task.id}">办理</a> --%>
										<a href="${ctx}/act/task/form?taskId=${task.id}&taskName=${fns:urlEncode(task.name)}&taskDefKey=${task.taskDefinitionKey}&procInsId=${task.processInstanceId}&procDefId=${task.processDefinitionId}&status=${status}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;任务办理</i></span></a>
									</c:if>
									<shiro:hasPermission name="act:process:edit">
										<c:if test="${empty task.executionId}">
											<a href="${ctx}/act/task/deleteTask?taskId=${task.id}&reason=" onclick="return promptx('删除任务','删除原因',this.href);" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除任务</i></a>
										</c:if>
									</shiro:hasPermission>
									<a target="_blank" href="${pageContext.request.contextPath}/act/diagram-viewer?processDefinitionId=${task.processDefinitionId}&processInstanceId=${task.processInstanceId}" class="btn btn-info btn-sm">跟踪</a><%-- 
									<a target="_blank" href="${ctx}/act/task/trace/photo/${task.processDefinitionId}/${task.executionId}">跟踪2</a> 
									<a target="_blank" href="${ctx}/act/task/trace/info/${task.processInstanceId}">跟踪信息</a> --%>
								</td>
							</tr>
						</c:forEach>
				</table>
			</div>
		</div>
	</div>
</section>
</body>
</html>
