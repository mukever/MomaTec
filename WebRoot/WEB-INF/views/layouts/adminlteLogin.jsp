<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title><sitemesh:title/> - Powered By JeeAdminlte</title>
	<%@ page contentType="text/html;charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="大胖老师"/>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Expires" content="0">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">


<script src="${ctxStatic}/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-validation/1.11.0/jquery.validate.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/jeesite.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/common/jeesite.js" type="text/javascript"></script>
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>


<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/dist/css/font-awesome.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/iCheck/square/blue.css">

<!-- Bootstrap 3.3.6 -->
<script src="${ctxStatic}/adminlte/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${ctxStatic}/adminlte/plugins/iCheck/icheck.min.js"></script>		
	<sitemesh:head/>
</head>
<body class="hold-transition login-page" style="background: url(${ctxStatic}/images/loginbg3.png)  center center;width: 100%;height: 585px;overflow: hidden;position: absolute;    background-color: #1c77ac;">
<sitemesh:body/>
	<script type="text/javascript">//<!-- 无框架时，左上角显示菜单图标按钮。
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			$("body").prepend("<i id=\"btnMenu\" class=\"icon-th-list\" style=\"cursor:pointer;float:right;margin:10px;\"></i><div id=\"menuContent\"></div>");
			$("#btnMenu").click(function(){
				top.$.jBox('get:${ctx}/sys/menu/treeselect;JSESSIONID=<shiro:principal property="sessionid"/>', {title:'选择菜单', buttons:{'关闭':true}, width:300, height: 350, top:10});
				//if ($("#menuContent").html()==""){$.get("${ctx}/sys/menu/treeselect", function(data){$("#menuContent").html(data);});}else{$("#menuContent").toggle(100);}
			});
		}//-->
	</script>
</body>
</html>