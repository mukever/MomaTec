<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>图标选择</title>
	<meta name="decorator" content="adminlte"/>
    <style type="text/css">
    	.page-header {clear:both;margin:0 20px;padding-top:20px;}
		.the-icons {padding:25px 10px 15px;list-style:none;}
		.the-icons li {float:left;width:22%;line-height:25px;margin:2px 5px;cursor:pointer;}
		.the-icons i {margin:1px 5px;font-size:16px;} .the-icons li:hover {background-color:#efefef;}
        .the-icons li.active {background-color:#0088CC;color:#ffffff;}
    </style>
    <script type="text/javascript">
	    $(document).ready(function(){
	    	$("#icons li").click(function(){
	    		$("#icons li").removeClass("active");
	    		$("#icons li i").removeClass("icon-white");
	    		$(this).addClass("active");
	    		$(this).children("i").addClass("icon-white");
	    		$("#icon").val($(this).text());
	    	});
	    	$("#icons li").each(function(){
	    		if ($(this).text()=="${value}"){
	    			$(this).click();
	    		}
	    	});
	    	$("#icons li").dblclick(function(){
	    		top.$.jBox.getBox().find("button[value='ok']").trigger("click");
	    	});
	    });
	    function callbackdata(){
	    	return $("#icon").val();	
	    }
    </script>
</head>
<body>
<input type="hidden" id="icon" value="${value}" />
<div id="icons">
		
	    <h2 class="page-header"> Adminlte 应用的图标</h2>
	    
	    <ul class="the-icons">
	      <li><i class="fa fa-dashboard"></i> fa-dashboard</li>
	      <li><i class="fa fa-glass"></i> fa-glass</li>
	      <li><i class="fa fa-music"></i> fa-music</li>
	      <li><i class="fa fa-search"></i> fa-search</li>
	      <li><i class="fa fa-envelope-o"></i> fa-envelope-o</li>
	      <li><i class="fa fa-heart"></i> fa-heart</li>
	      <li><i class="fa fa-star"></i> fa-star</li>
	      <li><i class="fa fa-star-o"></i> fa-star-o</li>
	      <li><i class="fa fa-user"></i> fa-user</li>
	      <li><i class="fa fa-film"></i> fa-film</li>
	      <li><i class="fa fa-th-large"></i> fa-th-large</li>
	      <li><i class="fa fa-th"></i> fa-th</li>
	      <li><i class="fa fa-th-list"></i> fa-th-list</li>
	      <li><i class="fa fa-check"></i> fa-check</li>
	      <li><i class="fa fa-remove"></i> fa-remove</li>
	      <li><i class="fa fa-close"></i> fa-close</li>
	      <li><i class="fa fa-times"></i> fa-times</li>
	      <li><i class="fa fa-search-plus"></i> fa-search-plus</li>
	      <li><i class="fa fa-search-minus"></i> fa-search-minus</li>
	      <li><i class="fa fa-power-off"></i> fa-power-off</li>
	      <li><i class="fa fa-signal"></i> fa-signal</li>
	      <li><i class="fa fa-gear"></i> fa-gear</li>
	      <li><i class="fa fa-trash-o"></i> fa-trash-o</li>
	      <li><i class="fa fa-home"></i> fa-home</li>
	      <li><i class="fa fa-file-o"></i> fa-file-o</li>
	      <li><i class="fa fa-clock-o"></i> fa-clock-o</li>
	      <li><i class="fa fa-file-o"></i> fa-file-o</li>
	      <li><i class="fa fa-clock-o"></i> fa-clock-o</li>
	      <li><i class="fa fa-road"></i> fa-road</li>
	      <li><i class="fa fa-download"></i> fa-download</li>
	      <li><i class="fa fa-arrow-circle-o-down"></i> fa-arrow-circle-o-down</li>
	      <li><i class="fa fa-arrow-circle-o-up"></i> fa-arrow-circle-o-up</li>
	      <li><i class="fa fa-inbox"></i> fa-inbox</li>
	      <li><i class="fa fa-play-circle-o"></i> fa-play-circle-o</li>
	      <li><i class="fa fa-rotate-right"></i> fa-rotate-right</li>
	      <li><i class="fa fa-repeat"></i> fa-repeat</li>
	      <li><i class="fa fa-refresh"></i> fa-refresh</li>
	      <li><i class="fa fa-list-alt"></i> fa-list-alt</li>
	      <li><i class="fa fa-lock"></i> fa-lock</li>
	      <li><i class="fa fa-flag"></i> fa-flag</li>
	      <li><i class="fa fa-headphones"></i> fa-headphones</li>
	      <li><i class="fa fa-volume-off"></i> fa-volume-off</li>
	      <li><i class="fa fa-volume-down"></i> fa-volume-down</li>
	      <li><i class="fa fa-volume-up"></i> fa-volume-up</li>
	      <li><i class="fa fa-qrcode"></i> fa-qrcode</li>
	      <li><i class="fa fa-barcode"></i> fa-barcode</li>
	      <li><i class="fa fa-tag"></i> fa-tag</li>
	      <li><i class="fa fa-tags"></i>fa-tags</li>
	      <li><i class="fa fa-book"></i> fa-book</li>
	      <li><i class="fa fa-bookmark"></i> fa-bookmark</li>
	      <li><i class="fa fa-print"></i> fa-print</li>
	      <li><i class="fa fa-camera"></i> fa-camera</li>
	      <li><i class="fa fa-font"></i> fa-font</li>
	      <li><i class="fa fa-bold"></i> fa-bold</li>
	      <li><i class="fa fa-italic"></i> fa-italic</li>
	      <li><i class="fa fa-text-height"></i> fa-text-height</li>
	      <li><i class="fa fa-text-width"></i> fa-text-width</li>
	      <li><i class="fa fa-align-left"></i> fa-align-left</li>
	      <li><i class="fa fa-align-center"></i> fa-align-center</li>
	      <li><i class="fa fa-align-right"></i> fa-align-right</li>
	      <li><i class="fa fa-align-justify"></i> fa-align-justify</li>
	      <li><i class="fa fa-list"></i> fa-list</li>
	      <li><i class="fa fa-dedent"></i> fa-dedent</li>
	      <li><i class="fa fa-outdent"></i> fa-outdent</li>
	      <li><i class="fa fa-indent"></i> fa-indent</li>
	      <li><i class="fa fa-video-camera"></i> fa-video-camera</li>
	      <li><i class="fa fa-photo"></i> fa-photo</li>
	      <li><i class="fa fa-image"></i> fa-image</li>
	      <li><i class="fa fa-picture-o"></i> fa-picture-o</li>
	      <li><i class="fa fa-pencil"></i> fa-pencil</li>
	      <li><i class="fa fa-map-marker"></i> fa-map-marker</li>
	      <li><i class="fa fa-adjust"></i> fa-adjust</li>	      
	      <li><i class="fa fa-tint"></i> fa-tint</li>
	      <li><i class="fa fa-edit"></i> fa-edit</li>
	      <li><i class="fa fa-pencil-square-o"></i> fa-pencil-square-o</li>
	      <li><i class="fa fa-share-square-o"></i> fa-share-square-o</li>
	      <li><i class="fa fa-arrows"></i> fa-arrowss</li>
	      <li><i class="fa fa-step-backward"></i> fa-step-backward</li>
	      <li><i class="fa fa-backward"></i> fa-backward</li>
	      <li><i class="fa fa-play"></i> fa-play</li>
	      <li><i class="fa fa-pause"></i> fa-pause</li>
	      <li><i class="fa fa-stop"></i> fa-stop</li>
	      <li><i class="fa fa-forward"></i> fa-forward</li>
	      <li><i class="fa fa-fast-forward"></i> fa-fast-forward</li>
	      <li><i class="fa fa-step-forward"></i> fa-step-forward</li>
	      <li><i class="fa fa-eject"></i> fa-eject</li>
	      <li><i class="fa fa-chevron-left"></i> fa-chevron-left</li>
	      <li><i class="fa fa-chevron-right"></i> fa-chevron-right</li>
	      <li><i class="fa fa-plus-circle"></i> fa-plus-circle</li>
	      <li><i class="fa fa-minus-circle"></i> fa-minus-circle</li>
	      <li><i class="fa fa-times-circle"></i> fa-times-circle</li>
	      <li><i class="fa fa-times-circle"></i> fa-times-circle</li>
	      <li><i class="fa fa-check-circle"></i> fa-check-circle</li>
	      <li><i class="fa fa-question-circle"></i> fa-question-circle</li>
	      <li><i class="fa fa-info-circle"></i> fa-info-circle</li>
	      <li><i class="fa fa-crosshairs"></i> fa-crosshairs</li>
	      <li><i class="fa fa-times-circle-o"></i> fa-times-circle-o</li>
	      <li><i class="fa fa-check-circle-o"></i> fa-check-circle-o</li>
	      <li><i class="fa fa-ban"></i> fa-ban</li>
	      <li><i class="fa fa-arrow-left"></i> fa-arrow-left</li>
	      <li><i class="fa fa-arrow-right"></i> fa-arrow-right</li>
	      <li><i class="fa fa-arrow-up"></i> fa-arrow-up</li>
	      <li><i class="fa fa-arrow-down"></i> fa-arrow-down</li>
	      <li><i class="fa fa-mail-forward"></i> fa-mail-forward</li>
	      <li><i class="fa fa-expand"></i> fa-expand</li>
	      <li><i class="fa fa-compress"></i> fa-compress</li>
	      <li><i class="fa fa-plus"></i> fa-plus</li>
	      <li><i class="fa fa-minus"></i> fa-minus</li>
	      <li><i class="fa fa-asterisk"></i> fa-asterisk</li>
	      <li><i class="fa fa-exclamation-circle"></i> fa-exclamation-circle</li>
	      <li><i class="fa fa-gift"></i> fa-gift</li>
	      <li><i class="fa fa-leaf"></i> fa-leaf</li>
	      <li><i class="fa fa-fire"></i> fa-fire</li>
	      <li><i class="fa fa-eye"></i> fa-eye</li>
	      <li><i class="fa fa-eye-slash"></i> fa-eye-slash</li>
	      <li><i class="fa fa-warning"></i> fa-warning</li>
	      <li><i class="fa fa-exclamation-triangle"></i> fa-exclamation-triangle</li>
	      <li><i class="fa fa-plane"></i> fa-plane</li>
	      <li><i class="fa fa-calendar"></i> fa-calendar</li>
	      <li><i class="fa fa-random"></i> fa-random</li>
	      <li><i class="fa-comment"></i> fa-comment</li>
	      <li><i class="fa fa-magnet"></i> fa-magnet</li>
	      <li><i class="fa fa-chevron-up"></i> fa-chevron-up</li>
	      <li><i class="fa fa-chevron-down"></i> fa-chevron-down</li>
	      <li><i class="fa fa-retweet"></i> fa-retweet</li>
	      <li><i class="fa fa-shopping-cart"></i> fa-shopping-cart</li>
	      <li><i class="fa fa-folder"></i> fa-folder</li>
	      <li><i class="fa fa-folder-open"></i> fa-folder-open</li>
	      <li><i class="fa fa-arrows-v"></i> fa-arrows-v</li>
	      <li><i class="fa fa-arrows-h"></i> fa-arrows-h</li>
	      <li><i class="fa fa-bar-chart-o"></i> fa-bar-chart-o</li>
	      <li><i class="fa fa-bar-chart"></i> fa-bar-chart</li>
	      <li><i class="fa fa-twitter-square"></i> fa-twitter-square</li>
	      <li><i class="fa fa-facebook-square"></i> fa-facebook-square</li>
	      <li><i class="fa fa-camera-retro"></i> fa-camera-retro</li>
	      <li><i class="fa fa-key"></i> fa-key</li>
	      <li><i class="fa fa-gears"></i> fa-gears</li>
	      <li><i class="fa fa-cogs"></i> fa-cogs</li>
	      <li><i class="fa fa-comments"></i> fa-comments</li>
	      <li><i class="fa fa-thumbs-o-up"></i> fa-thumbs-o-up</li>
	      <li><i class="fa fa-thumbs-o-down"></i> fa-thumbs-o-down</li>
	      <li><i class="fa fa-star-half"></i> fa-star-half</li>
	      <li><i class="fa fa-heart-o"></i> fa-heart-o</li>
	      <li><i class="fa fa-sign-out"></i> fa-sign-out</li>
	      <li><i class="fa fa-linkedin-square"></i> fa-linkedin-square</li>
	      <li><i class="fa fa-thumb-tack"></i> fa-thumb-tack</li>
	      <li><i class="fa fa-external-link"></i> fa-external-link</li>
	      <li><i class="fa fa-sign-in"></i> fa-sign-in</li>
	      <li><i class="fa fa-trophy"></i> fa-trophy</li>
	      <li><i class="fa fa-github-square"></i> fa-github-square</li>
	      <li><i class="fa fa-upload"></i> fa-upload</li>
	      <li><i class="fa fa-lemon-o"></i> fa-lemon-o</li>
	      <li><i class="fa fa-phone"></i> fa-phone</li>
	      <li><i class="fa fa-square-o"></i> fa-square-o</li>
	      <li><i class="fa fa-bookmark-o"></i> fa-bookmark-o</li>
	      <li><i class="fa fa-phone-square"></i> fa-phone-square</li>
	      <li><i class="fa fa-twitter"></i> fa-twitter</li>
	      <li><i class="fa fa-facebook-f"></i> fa-facebook-f</li>
	      <li><i class="fa fa-facebook"></i> fa-facebook</li>
	      <li><i class="fa fa-github"></i> fa-github</li>
	      <li><i class="fa fa-unlock"></i> fa-unlock</li>
	      <li><i class="fa fa-credit-card"></i> fa-credit-card</li>
	      <li><i class="fa fa-feed"></i> fa-feed</li>
	      <li><i class="fa fa-rss"></i> fa-rss</li>
	      <li><i class="fa fa-hdd-o"></i> fa-hdd-o</li>
	      <li><i class="fa fa-bullhorn"></i> fa-bullhorn</li>
	      <li><i class="fa fa-bell"></i> fa-bell</li>
	      <li><i class="fa fa-certificate"></i> fa-certificate</li>
	      <li><i class="fa fa-hand-o-right"></i> fa-hand-o-right</li>
	      <li><i class="fa fa-hand-o-left"></i> fa-hand-o-left</li>
	      <li><i class="fa fa-hand-o-up"></i> fa-hand-o-up</li>
	      <li><i class="fa fa-hand-o-down"></i> fa-hand-o-down</li>
	      <li><i class="fa fa-arrow-circle-left"></i> fa-arrow-circle-left</li>
	      <li><i class="fa fa-arrow-circle-right"></i> fa-arrow-circle-right</li>
	      <li><i class="fa fa-arrow-circle-up"></i> fa-arrow-circle-up</li>
	      <li><i class="fa fa-arrow-circle-down"></i> fa-arrow-circle-down</li>
	      <li><i class="fa fa-globe"></i> fa-globe</li>
	      <li><i class="fa fa-wrench"></i> fa-wrench</li>
		</ul>
	<br/><br/>
</div>
</body>