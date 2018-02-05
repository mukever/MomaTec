<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
  <title>${fns:getConfig('productName')}</title>
  <meta name="decorator" content="adminlteIndex"/>
  <style>
  	.navbar-default .navbar-nav>li>a{
  		color: #f4f4f4;
  		cursor: pointer;
  	}
  	nav>.active>a:hover {
	    color: #555;
	    background-color: #2fa4e7;
	}
  </style>
<script>
$(document).ready(function() {
	//导航栏主菜单切换
	$("li#firstMenu").click(function(){
		$("li#firstMenu").removeClass("active");
		$(this).addClass("active");
		$.get("${ctx}/sys/menu/tree?menuId="+$(this).attr('data-id'), function(data){
			if (data.indexOf("id=\"loginForm\"") != -1){
				alert('未登录或登录超时。请重新登录，谢谢！');
				location = "${ctx}";
				return false;
			}
			$("#leftMenu").html();
			$("#leftMenu").html(data);
			$("#menuFrame").attr("src",$("#menuUrl").attr("href")).ready();
		});
	});
	//左侧子菜单样式切换
	$("li#menuUrl").click(function(){
		$("li#menuUrl").removeClass("active");
		$(this).addClass("active");
	});
});
function menuClick(obj){
	$("li#menuUrl").removeClass("active");
	$(obj).addClass("active");
}
</script>
</head>
<body class="sidebar-mini ajax-template skin-blue fixed">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="${ctx}" class="logo">
      <span class="logo-mini"><b>${fns:getConfig('productName')}</b></span>
      <span class="logo-lg"><b>${fns:getConfig('productName')}</b></span>
    </a>
    
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
    </a>
    
    <nav class="nav navbar-default" style="background-color:#367fa9;">
	   <div class="navbar-header">
		    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> 
		     <span class="icon-bar"></span> 
		     <span class="icon-bar"></span> 
		     <span class="icon-bar"></span> 
		    </button>
		    <button class="navbar-toggle">
		      <a href="#"  data-toggle="offcanvas" role="button">
		        <i class="fa fa-gears"></i>
		      </a>
		    </button>
	   </div>

		<div class="collapse navbar-collapse">
		    <ul class="nav navbar-nav">
		    	<c:set var="firstMenu" value="true"/>
				<c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
					<c:if test="${menu.parent.id eq '1'&&menu.isShow eq '1'}">
						<c:if test="${empty menuId}">
							<c:set var="menuId" value="${menu.id}"/>
						</c:if>
						<li class="li-border ${ menu.id eq menuId ? ' active' : ''}" id="firstMenu" data-id="${menu.id}">
						<a class="mystyle-color" style="font-size: 14px;">
						<i class="fa ${menu.icon}"></i>&nbsp;${menu.name}</a>
						</li>
					</c:if>
				</c:forEach>
		    </ul>
    
	       <div class="navbar-custom-menu pull-right">
	          <ul class="nav navbar-nav">
	          <li class="dropdown user user-menu">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	              <c:if test="${not empty fns:getUser().photo}">
	              <img src="${fns:getUser().photo}"  class="user-image" alt="User Image">
	              </c:if>
	              <span class="hidden-xs">${fns:getUser().name}&nbsp&nbsp&nbsp&nbsp</span>
	            </a>
	            <ul class="dropdown-menu">
	                   <li><a class="menuItem" href="${ctx}/sys/user/info" target="menuFrame"><i class="fa fa-user"></i>个人信息</a></li>
	                   <li><a href="${ctx}/sys/user/modifyPwd" target="menuFrame"><i class="fa fa-trash-o"></i>修改密码</a></li>
	                   <li><a href="${ctx}/oa/oaNotify/self" target="menuFrame"><i class="fa fa-paint-brush"></i>我的通知</a></li>
	                   <li><a href="javascript:cookie('tabmode','${tabmode eq '1' ? '0' : '1'}');location=location.href"><i class="fa fa-inbox"></i>${tabmode eq '1' ? '关闭' : '开启'}页签模式</a></li>
	                   <li class="divider"></li>
	                   <li><a href="${ctx}/logout" ><i class="ace-icon fa fa-power-off"></i>退出登录</a></li>
	            </ul>
	          </li>
	        </ul>
	      </div>
	  </div>
    </nav>
  </header>
  
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <c:if test="${not empty fns:getUser().photo}">
	        <div class="pull-left image">
	          <img src="${fns:getUser().photo}" class="img-circle" alt="User Image">
	        </div>
	        <div class="pull-left info">
	          <p>${fns:getUser().name}</p>
	        </div>
        </c:if>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <div id="leftMenu">
      <ul class="sidebar-menu">
      <c:set var="firstMenu" value="true"/>
      <c:set var="firstMenu3" value="true"/>
      <c:forEach items="${fns:getMenuList()}" var="menu2" varStatus="idxStatus">
      	 <c:if test="${menu2.parent.id eq menuId && menu2.isShow eq '1'}">
      		<li class="${not empty firstMenu && firstMenu ? ' active' : ''} treeview">
	      	  <a href="#">
	            <i class="fa ${menu2.icon}"></i> 
	            <span style="font-size: 14px;">${menu2.name}</span>
	            <span class="pull-right-container">
	              <i class="fa fa-angle-left pull-right"></i>
	            </span>
	           </a>
	           <ul class="treeview-menu">
	           <c:forEach items="${fns:getMenuList()}" var="menu3" varStatus="idxStatus">
	           <c:if test="${not empty firstMenu3 && firstMenu3}">
	           		<c:set var="menuUrl" value="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}"/>
	           </c:if>
	           <c:if test="${menu3.parent.id eq menu2.id&&menu3.isShow eq '1'}">
		            <li id="menuUrl" class="menu ${not empty firstMenu3 && firstMenu3 ? ' active' : ''}">
		            	<a target="menuFrame"  href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}">
		            	&nbsp;&nbsp;<i class="fa ${menu3.icon}"></i>${menu3.name }</a>
		            </li>
		            <c:set var="firstMenu3" value="false"/>
		        </c:if>
	            </c:forEach>
	             </ul>
      		</li>
      		<c:set var="firstMenu" value="false"/>
     	 </c:if>
      </c:forEach>
      </ul>
      </div>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <iframe id="menuFrame" name="menuFrame" src="${menuUrl}" style="overflow:visible;" scrolling="yes" frameborder="no" height="100%" width="100%"></iframe>
    <!-- /.content -->
  </div>

  <div class="control-sidebar-bg"></div>
</div>
<div id="loading" class="loading-panel">
  <div class="box">
    <i class="fa fa-refresh fa-spin"></i>
    <span class="tip">
       正在加载 · · ·    
    </span>
  </div>
</div>
<footer class="main-footer">
   <div class="pull-right hidden-xs">
     <b>Version</b> ${fns:getConfig('version')}
   </div>
   <strong>Copyright &copy; 2017-${fns:getConfig('copyrightYear')}  <a href="http://www.jeesite520.com">${fns:getConfig('productName')}</a></strong>
 </footer>
</body>
</html>