<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>定时任务管理</title>
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
		function changeJobStatus(jobId, cmd) {
			showWaitMsg();
			$.ajax({
				type : "POST",
				async : false,
				dataType : "JSON",
				cache : false,
				url : "${ctx}/sys/sysScheduleJob/changeJobStatus",
				data : {
					jobId : jobId,
					cmd : cmd
				},
				success : function(data) {
					hideWaitMsg();
					if (data.flag) {

						location.reload();
					} else {
						alert(data.msg);
					}

				}//end-callback
			});//end-ajax
		}
		function showWaitMsg(msg) {
			if (msg) {

			} else {
				msg = '正在处理，请稍候...';
			}
			var panelContainer = $("body");
			$("<div id='msg-background' class='datagrid-mask' style=\"display:block;z-index:10006;\"></div>").appendTo(panelContainer);
			var msgDiv = $("<div id='msg-board' class='datagrid-mask-msg' style=\"display:block;z-index:10007;left:50%\"></div>").html(msg).appendTo(
					panelContainer);
			msgDiv.css("marginLeft", -msgDiv.outerWidth() / 2);
		}
		function hideWaitMsg() {
			$('.datagrid-mask').remove();
			$('.datagrid-mask-msg').remove();
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/sysScheduleJob/">定时任务列表</a></li>
		<shiro:hasPermission name="sys:sysScheduleJob:edit"><li><a href="${ctx}/sys/sysScheduleJob/form">定时任务添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="sysScheduleJob" action="${ctx}/sys/sysScheduleJob/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">任务名称：</label>
							<div class="col-sm-8">
								<form:input path="jobName" htmlEscape="false" maxlength="255" class="form-control"/>
			                </div>
						</div>
					</div>
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-striped table-bordered table-condensed">
					<tr>
						<th>任务名称</th>
						<th>任务分组</th>
						<th>任务状态</th>
						<th>cron表达式</th>
						<th>描述</th>
						<th>是否同步</th>
						<th>更新时间</th>
						<th>备注信息</th>
						<shiro:hasPermission name="sys:sysScheduleJob:edit"><th>操作</th></shiro:hasPermission>
					</tr>
				<c:forEach items="${page.list}" var="sysScheduleJob">
					<tr>
						<td><a href="${ctx}/sys/sysScheduleJob/form?id=${sysScheduleJob.id}">
							${sysScheduleJob.jobName}
						</a></td>
						<td>
							${sysScheduleJob.jobGroup}
						</td>
						<td>
							${fns:getDictLabel(sysScheduleJob.jobStatus, 'task_state', '')}
						</td>
						<td>
							${sysScheduleJob.cronExpression}
						</td>
						<td>
							${sysScheduleJob.description}
						</td>
						<td>
							${fns:getDictLabel(sysScheduleJob.isConcurrent, 'yes_no', '')}
						</td>
						<td>
							<fmt:formatDate value="${sysScheduleJob.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td>
							${sysScheduleJob.remarks}
						</td>
						<shiro:hasPermission name="sys:sysScheduleJob:edit"><td>
		    				<a href="${ctx}/sys/sysScheduleJob/form?id=${sysScheduleJob.id}" class="btn btn-success btn-sm"><i class="fa fa-pencil">&nbsp;修改</i></a>
							<a href="${ctx}/sys/sysScheduleJob/delete?id=${sysScheduleJob.id}" onclick="return confirmx('确认要删除该定时任务吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
							<c:if test="${sysScheduleJob.jobStatus =='0' }">
								<a href="javascript:;" onclick="changeJobStatus('${sysScheduleJob.id}','start')" class="btn btn-success btn-sm"><i class="fa fa-pencil">&nbsp;启用</i></a>
							</c:if>
							<c:if test="${sysScheduleJob.jobStatus =='1' }">
								<a href="javascript:;" onclick="changeJobStatus('${sysScheduleJob.id}','stop')" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;停止</i></a>&nbsp;
							</c:if>
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