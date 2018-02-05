<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="input" type="java.lang.String" required="true" description="输入框"%>
<%@ attribute name="type" type="java.lang.String" required="true" description="image、flash、media、file"%>
<%@ attribute name="selectMultiple" type="java.lang.Boolean" required="false" description="是否允许多选"%>
<%@ attribute name="readonly" type="java.lang.Boolean" required="false" description="是否查看模式"%>
<%@ attribute name="maxWidth" type="java.lang.String" required="false" description="最大宽度"%>
<%@ attribute name="maxHeight" type="java.lang.String" required="false" description="最大高度"%>
<link rel="stylesheet" href="${ctxStatic}/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctxStatic}/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/plugins/code/prettify.js"></script>
<ol id="${input}Preview"></ol>
<c:if test="${!readonly}">
	<a href="javascript:" id="button${input}" class="btn">${selectMultiple?'添加':'选择'}</a>
	&nbsp;<a href="javascript:" id="delbutton${input}" class="btn">清除</a>
</c:if>
<script>
function initKindUpload(){
	KindEditor.ready(function(K) {
		var editor1 = K.editor({
			cssPath : '${ctxStatic}/kindeditor/plugins/code/prettify.css',
			uploadJson : '${ctx}/kindeditor/fileUpload?dir=${type}',
			fileManagerJson : '${ctx}/kindeditor/fileManager',
			allowFileManager : true,
		});
		K('#button${input}').click(function() {
			editor1.loadPlugin('image', function() {
				editor1.plugin.imageDialog({
					imageUrl : K('#${input}').val(),
					clickFn : function(url, title, width, height, border, align) {
						//<c:if test="${selectMultiple}">
						$("#${input}").val($("#${input}").val()+($("#${input}").val(url)==""?url:"|"+url));//</c:if><c:if test="${!selectMultiple}">
						$("#${input}").val(url);//</c:if>
						editor1.hideDialog();
						${input}Preview();
					}
				});
			});
		});
		K('#delbutton${input}').click(function() {
			$("#${input}").val("");
			${input}Preview();
		});
	});
}

$(document).ready(function() {
	initKindUpload();
});
function ${input}Del(obj){
	var url = $(obj).prev().attr("url");
	$("#${input}").val($("#${input}").val().replace("|"+url,"","").replace(url+"|","","").replace(url,"",""));
	${input}Preview();
}
function ${input}Preview(){
	var li, urls = $("#${input}").val().split("|");
	$("#${input}Preview").children().remove();
	for (var i=0; i<urls.length; i++){
		if (urls[i]!=""){//<c:if test="${type eq 'thumb' || type eq 'image'}">
			li = "<li><img src=\""+urls[i]+"\" url=\""+urls[i]+"\" style=\"max-width:${empty maxWidth ? 200 : maxWidth}px;max-height:${empty maxHeight ? 200 : maxHeight}px;_height:${empty maxHeight ? 200 : maxHeight}px;border:0;padding:3px;\">";//</c:if><c:if test="${type ne 'thumb' && type ne 'image'}">
			li = "<li><a href=\""+urls[i]+"\" url=\""+urls[i]+"\" target=\"_blank\">"+decodeURIComponent(urls[i].substring(urls[i].lastIndexOf("/")+1))+"</a>";//</c:if>
			li += "&nbsp;&nbsp;<c:if test="${!readonly}"><a href=\"javascript:\" onclick=\"${input}Del(this);\">×</a></c:if></li>";
			$("#${input}Preview").append(li);
		}
	}
	if ($("#${input}Preview").text() == ""){
		$("#${input}Preview").html("<li style='list-style:none;padding-top:5px;'>无</li>");
	}
}
${input}Preview();
</script>