<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
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
        <li id="menuUrl" onclick="menuClick(this)" class="menu ${not empty firstMenu3 && firstMenu3 ? ' active' : ''}" href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}" menuText="${menu3.name }">
        	<a target="menuFrame"  href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}" >
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