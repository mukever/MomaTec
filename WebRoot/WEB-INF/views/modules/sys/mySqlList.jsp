<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>数据库手工备案管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnRest").click(function (event){
				$("#searchForm")[0].reset();
			});
			$("#inputForm3").validate({
				submitHandler: function(form){
					jBox.tip("正在提交，请等候...", 'loading');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/mySql">数据库手工备案管理</a></li>
	</ul>
	<form:form id="inputForm3" modelAttribute="zcCircleInfo" action="${ctx}/sys/mySql/save" method="get" class="breadcrumb form-search">
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="手工备份"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<tr>
				<th>备份路径</th>
				<th>下载</th>
			</tr>
		<c:forEach items="${backFileList}" var="mysqllist">
			<tr>
				<td>
					<a href="${ctx}/sys/mySql/downBackUp?filename=${mysqllist}">${mysqllist}</a>
				</td>
				<td>
					<a href="${ctx}/sys/mySql/downBackUp?filename=${mysqllist}">下载</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>