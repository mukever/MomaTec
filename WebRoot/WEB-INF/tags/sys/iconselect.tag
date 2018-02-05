<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="输入框值"%>
<i id="${id}Icon" class="fa ${not empty value?value:' hide'}"></i>&nbsp;
<label id="${id}IconLabel">${not empty value?value:'无'}</label>&nbsp;
<input id="${id}" name="${name}" type="hidden" value="${value}"/>
<a id="${id}Button" href="javascript:" class="btn btn-success btn-sm"class="btn btn-success btn-sm">选择</a>&nbsp;&nbsp;
<script type="text/javascript">
	$("#${id}Button").click(function(){
		layer.open({
			  type: 2,
			  title: "选择图标",
			  shadeClose: true,
			  shade: 0.3,
			  area: ['98%', '80%'],
			  content: "${ctx}/tag/iconselect?value="+$("#${id}").val(),
			  btn: ['确定', '关闭'],
			  yes: function(index, layero){
              	var layFrame = window[layero.find('iframe')[0]['name']];
            	icon = layFrame.callbackdata();
            	$("#${id}Icon").attr("class", "fa "+icon);
                $("#${id}IconLabel").text(icon);
                $("#${id}").val(icon);
                layer.close(index);
			  },
			  btn2: function(index, layero){
				  layer.close(index);
			  }
		});
	});
</script>
