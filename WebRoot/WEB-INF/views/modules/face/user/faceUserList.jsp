<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户信息管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btnExport").click(function(){
			layer.confirm('确认要导出用户数据吗？', {
				title:"导出数据",btn: ['确定','取消']
				}, function(){
					$("#searchForm").attr("action","${ctx}/face/user/faceUser/export");
					$("#searchForm").submit();
				}, function(){

			    });
		});
		$("#btnImport").click(function(){
			layer.open({
				  type: 1,
				  title:"导入数据(导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！)",
				  skin: 'layui-layer-rim', //加上边框
				  area: ['550px', '240px'], //宽高
				  content: $("#importBox").html()
			});
		});
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
		<li class="active"><a href="${ctx}/face/user/faceUser/">用户信息列表</a></li>
		<shiro:hasPermission name="face:user:faceUser:edit"><li><a href="${ctx}/face/user/faceUser/form">用户信息添加</a></li></shiro:hasPermission>
	</ul>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/face/user/faceUser/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/face/user/faceUser/import/template">下载模板</a>
		</form>
	</div>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="faceUser" action="${ctx}/face/user/faceUser/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">身份证号：</label>
								<div class="col-sm-8">
									<form:input path="userid" htmlEscape="false" maxlength="64" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">工号/学号：</label>
								<div class="col-sm-8">
									<form:input path="noId" htmlEscape="false" maxlength="64" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">归属宿楼：</label>
								<div class="col-sm-8">
									<sys:treeselect id="office" name="office.id" value="${faceUser.office.id}" labelName="office.name" labelValue="${faceUser.office.name}"
										title="部门" url="/sys/office/treeData?type=2" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
	
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户手机号：</label>
								<div class="col-sm-8">
									<form:input path="phone" htmlEscape="false" maxlength="64" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户邮箱：</label>
								<div class="col-sm-8">
									<form:input path="mail" htmlEscape="false" maxlength="64" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户住址：</label>
								<div class="col-sm-8">
									<form:input path="address" htmlEscape="false" maxlength="200" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户姓名：</label>
								<div class="col-sm-8">
									<form:input path="name" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">用户性别：</label>
								<div class="col-sm-8">
									<form:select path="sex" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
						<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
						<input id="btnImport" class="btn btn-primary" type="button" value="导入"/>
						</div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
						<tr>
						    <th class="text-center">用户图片</th>
							<th class="text-center">身份证号</th>
							<th class="text-center">工号/学号</th>
							<th class="text-center">用户姓名</th>
							<th class="text-center">归属宿楼</th>
							<th class="text-center">用户手机号</th>
							<th class="text-center">用户邮箱</th>
							<th class="text-center">用户住址</th>
							<th class="text-center">用户性别</th>
							<th class="text-center">备注信息</th>
							<shiro:hasPermission name="face:user:faceUser:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					<c:forEach items="${page.list}" var="faceUser">
						<tr>
							<td class="text-center">
								<c:if test="${not empty faceUser.photo}">
				              		<img src="${faceUser.photo}" class="user-image" alt="User Image" height="50" width="50">
				              	</c:if>
							</td>
							<td class="text-center"><a href="${ctx}/face/user/faceUser/form?id=${faceUser.id}">
								${faceUser.userid}
							</a></td>
							<td class="text-center">
								${faceUser.noId}
							</td>
							<td class="text-center">
								${faceUser.name}
							</td>
							<td class="text-center">
								${faceUser.office.name}
							</td>
							<td class="text-center">
								${faceUser.phone}
							</td>
							<td class="text-center">
								${faceUser.mail}
							</td>
							<td class="text-center">
								${faceUser.address}
							</td>
							<td class="text-center">
								${fns:getDictLabel(faceUser.sex, 'sex', '')}
							</td>
							
							<td class="text-center">
								${faceUser.remarks}
							</td>
							<shiro:hasPermission name="face:user:faceUser:edit"><td>
			    				<a href="${ctx}/face/user/faceUser/form?id=${faceUser.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/face/user/faceUser/delete?id=${faceUser.id}" onclick="return confirmx('确认要删除该用户信息吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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