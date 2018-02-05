<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="replace" type="java.lang.String" required="true" description="需要替换的textarea编号"%>
<%@ attribute name="uploadPath" type="java.lang.String" required="false" description="文件上传路径，路径后自动添加年份。若不指定，则编辑器不可上传文件"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="编辑器高度"%>
<link rel="stylesheet" href="${ctxStatic}/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${ctxStatic}/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${ctxStatic}/kindeditor/plugins/code/prettify.js"></script>
<script>
function initKindEditor(editor){
	KindEditor.ready(function(K) {
		var editor1 = K.create('#'+editor+'', {
			cssPath : '${ctxStatic}/kindeditor/plugins/code/prettify.css',
			uploadJson : '${ctx}/kindeditor/fileUpload',
			fileManagerJson : '${ctx}/kindeditor/fileManager',
			allowFileManager : true
		});
	});	
}
$(document).ready(function() {
	initKindEditor("${replace}");
});
</script>