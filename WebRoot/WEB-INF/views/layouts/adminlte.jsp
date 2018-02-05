<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html style="overflow-x:auto;overflow-y:auto;">
<head>
	<title><sitemesh:title/> - Powered By JeeAdminlte</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="diamond"/>
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
<!-- Ionicons -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/dist/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="${ctxStatic}/adminlte/dist/css/skins/_all-skins.min.css">
<!-- daterange picker -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/timepicker/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/select2/select2.min.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/iCheck/flat/blue.css">

<!-- fullCalendar 2.2.5-->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/fullcalendar/fullcalendar.print.css" media="print">

<!-- Ion Slider -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/ionslider/ion.rangeSlider.css">
<!-- ion slider Nice -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/ionslider/ion.rangeSlider.skinNice.css">
<!-- bootstrap slider -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/bootstrap-slider/slider.css">

<!-- Morris chart -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="${ctxStatic}/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!--[if lt IE 9]>
<script src="${ctxStatic}/adminlte/plugins/html5shiv.min.js"></script>
<script src="${ctxStatic}/adminlte/plugins/respond.min.js"></script>
<![endif]-->

<!-- Bootstrap 3.3.6 -->
<script src="${ctxStatic}/adminlte/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="${ctxStatic}/adminlte/plugins/iCheck/icheck.min.js"></script>

<script src="${ctxStatic}/adminlte/plugins/fastclick/fastclick.js"></script>
<!-- Slimscroll -->
<script src="${ctxStatic}/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE App -->
<script src="${ctxStatic}/adminlte/dist/js/app.js"></script>   
<!-- jQuery UI 1.11.4 -->
<script src="${ctxStatic}/adminlte/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Morris.js charts -->
<script src="${ctxStatic}/adminlte/plugins/raphael/raphael.min.js"></script>
<script src="${ctxStatic}/adminlte/plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="${ctxStatic}/adminlte/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${ctxStatic}/adminlte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${ctxStatic}/adminlte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${ctxStatic}/adminlte/plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="${ctxStatic}/adminlte/plugins/moment/moment.min.js"></script>
<script src="${ctxStatic}/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${ctxStatic}/adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${ctxStatic}/adminlte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- SlimScroll 1.3.0 -->
<script src="${ctxStatic}/adminlte/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="${ctxStatic}/adminlte/plugins/chartjs/Chart.min.js"></script>
<!-- FLOT CHARTS -->
<script src="${ctxStatic}/adminlte/plugins/flot/jquery.flot.min.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="${ctxStatic}/adminlte/plugins/flot/jquery.flot.resize.min.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="${ctxStatic}/adminlte/plugins/flot/jquery.flot.pie.min.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="${ctxStatic}/adminlte/plugins/flot/jquery.flot.categories.min.js"></script>
<!-- Select2 -->
<script src="${ctxStatic}/adminlte/plugins/select2/select2.full.min.js"></script>
<!-- InputMask -->
<script src="${ctxStatic}/adminlte/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${ctxStatic}/adminlte/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${ctxStatic}/adminlte/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="${ctxStatic}/adminlte/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="${ctxStatic}/adminlte/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- bootstrap color picker -->
<script src="${ctxStatic}/adminlte/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="${ctxStatic}/adminlte/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- Ion Slider -->
<script src="${ctxStatic}/adminlte/plugins/ionslider/ion.rangeSlider.min.js"></script>
<!-- Bootstrap slider -->
<script src="${ctxStatic}/adminlte/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<!-- DataTables -->
<script src="${ctxStatic}/adminlte/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${ctxStatic}/adminlte/plugins/datatables/dataTables.bootstrap.min.js"></script>	
<script src="${ctxStatic}/layer/layer.js"></script>		
	<sitemesh:head/>
</head>
<body class="sidebar-mini ajax-template skin-blue" id="adminlteBody">
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