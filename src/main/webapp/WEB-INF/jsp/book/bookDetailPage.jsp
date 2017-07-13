<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书详情</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert2.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert2.min.js"></script>
    <style type="text/css">
        .blur {
            filter: url(blur.svg#blur); /* FireFox, Chrome, Opera */
            -webkit-filter: blur(10px); /* Chrome, Opera */
            -moz-filter: blur(10px);
            -ms-filter: blur(10px);
            filter: blur(10px);
            filter: progid:DXImageTransform.Microsoft.Blur(PixelRadius=10, MakeShadow=false); /* IE6~IE9 */
        }
    </style>
    <style>
    <!--图片放大css-->
   * {
	margin:0;
	padding:0;
}
.box {
	width:350px;
	height:262px;
	margin:10px;
	border:1px solid #ccc;
	position:relative;
}
.big {
	width:400px;
	height:400px;
	position:absolute;
	top:0;
	left:360px;
	border:1px solid #ccc;
	overflow:hidden;
	display:none;
}
.mask {
	width:175px;
	height:175px;
	background:rgba(255,255,0,0.4);
	position:absolute;
	top:0;
	left:0;
	cursor:move;
	display:none;
}
.small {
	position:relative;
}
.box img {
	vertical-align:top;
}
#bigBox img {
	position:absolute;}
 </style>
 </head>
<body>
<body class="gray-bg">
 <br>
<br>
<!--返回按钮 -->
<span><button type="button" class="btn btn-primary">返回</button></span>&nbsp&nbsp<span><button type="button" class="opButton btn btn-danger">删除</button></span> 
<!--放置一个table显示图书详情 --> 
 <table class="table table-condensed" width="800" height="200" >
 <caption>图书详情</caption>
 <tbody>
 <tr>
 <td width="400">
 <div class="box" id="box">
    <div id="smallBox" class="small ">
        <img src="http://www.jq22.com/demo/jQueryMagnifier201702271056/images/2.png"  width="350">
        <div id="mask" class="mask"></div>
    </div>
    <div id="bigBox" class="big">
        <img src="http://www.jq22.com/demo/jQueryMagnifier201702271056/images/2.png" alt="" id="bigPic">
    </div>
    </div>
 </td>
 <td>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">图书id:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">图书名:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">发布者:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">用户id:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">图书所在地:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">交易状态:</font></span><span></span></p>
 </div>
 </td>
 <td>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">作者:</font></span><span></span></p>
  </div>
  <br>
 <div>
   <p class="text-left"><span class="label label-info"><font size="2">出版社:</font></span><span></span></p>
 </div>
 <br>
 <div>
   <p class="text-left"><span class="label label-info"><font size="2">价格:</font></span><span></span></p>
 </div>
 <br>
 <div>
 <h><font size="2">图书简介</font></h>
 <p class="lead"></p>
 </div>
 </td>
 </tr>
 </tbody>
 </table>
 <span class="label label-info"><font size="2">图书地点:</font></span>
 <br>
 <br>
 <div>
 <img  src="http://api.map.baidu.com/staticimage/v2?ak=9PTMLNnePTt6uK4aX2Qa2o1PRnoz42OG&center=105.726744,34.590363&width=400&height=300&zoom=18&markers=105.726744,34.590363">
 </div>
 </body>
 <script>
 var smallBox = document.getElementById('smallBox');
 var mask = document.getElementById('mask');
 var bigBox = document.getElementById('bigBox');
 var box = document.getElementById('box')
 var bigPic = document.getElementById('bigPic')
 //鼠标经过小盒子，显示大盒子
 smallBox.onmouseover = function() {
     bigBox.style.display = "block";
     mask.style.display = "block";

 }

 smallBox.onmouseout = function() {
     bigBox.style.display = "none";
     mask.style.display = "none";
 }
 smallBox.onmousemove = function(event) {
     //遮罩跟随鼠标
     var event = event || widow.event;
     var pageX = event.pageX || event.clientX + document.documentElement.scrollLeft;
     var pageY = event.pageY || event.clientY + document.documentElement.scrollTop;
     //计算mask的位置
     // var boxX = ;
     // var boxY =  ;
     var targetX = pageX - box.offsetLeft - mask.offsetWidth / 2;
     var targetY = pageY - box.offsetLeft - mask.offsetHeight / 2;
     //限制mask移动范围
     if (targetX < 0) {
         targetX = 0;
     }
    
     if (targetY < 0) {
         targetY = 0;
     }
     if (targetX > smallBox.offsetWidth - mask.offsetWidth) {
         targetX = smallBox.offsetWidth - mask.offsetWidth;
     }

     if (targetY > smallBox.offsetHeight - mask.offsetHeight) {
         targetY = smallBox.offsetHeight - mask.offsetHeight;
     }
     
     mask.style.left = targetX + "px";
     mask.style.top = targetY + "px";
     
     var bigToMove = bigPic.offsetWidth - bigBox.offsetWidth;
     var maskToMove = smallBox.offsetWidth - mask.offsetWidth;
     var rate = bigToMove / maskToMove;
     bigPic.style.left = -rate * targetX + "px";
     bigPic.style.top = -rate * targetY + "px";
     }
 </script>
</html>