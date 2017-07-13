<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书详情</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
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
 </head>
<body>
<body class="gray-bg">
 <br>
<br>
<!--返回按钮 -->
<span><button type="button" class="btn btn-primary">返回</button></span>&nbsp&nbsp<button type="button" class="opButton btn btn-danger" id="${book.getBookId()}">删除</button> 
<!--放置一个table显示图书详情 --> 
 <table class="table table-condensed" width="800" height="200" >
 <caption>图书详情</caption>
 <tbody>
 <tr>
 <td >
 <div>
        <img src="b005e2bd9c8c937ce972663f55875618.jpg" height="300" width="400" id="image">
    </div>
 </td>
 <td>
 <div>
 <p class="text-left"><span class="label label-info"><font size="3">图书id:${book.getBookId()}</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="3">图书名:${book.getBookName()}</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="3">发布者:${book.getUserName()}</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="3">用户id:${book.getUserId()}</font></span><span></span></p>
 </div>
 <br>
 <div>
 <p class="text-left"><span class="label label-info"><font size="2">图书所在地:${book.getpName()}</font></span><span></span></p>
 </div>
 <br>
 </td>
 <td>
 <div>
 <p class="text-left"><span class="label label-info"><font size="3">作者:${book.getProductor()}</font></span><span></span></p>
  </div>
  <br>
 <div>
   <p class="text-left"><span class="label label-info"><font size="3">出版社:${book.getCompany()}</font></span><span></span></p>
 </div>
 <br>
 <div>
   <p class="text-left"><span class="label label-info"><font size="3">价格:${book.getPrice()}</font></span><span></span></p>
 </div>
 <br>
 <div>
 <h><font size="2">图书简介</font></h>
 <p class="lead">${book.getDes()}</p>
 </div>
 </td>
 </tr>
 </tbody>
 </table>
 <span class="label label-info"><font size="3">图书地点:</font></span>
 <br>
 <br>
 <div>
 <img  src="http://api.map.baidu.com/staticimage/v2?ak=9PTMLNnePTt6uK4aX2Qa2o1PRnoz42OG&center=${book.getX()},${book.getY()}&width=400&height=300&zoom=18&markers=${book.getX()},${book.getY()}">
 </div>
 </body>
 <script>
$(".btn-primary").click(function(){
	location.href="${pageContext.request.contextPath}/book/showBookList";
});
$(".opButton").click(function(){
	var thisButton=$(this);
	swal({
		  title: "提示",
		  text: "是否确定删除，此操作不可恢复",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "是，删除",
		  cancelButtonText: "取消",
		  closeOnConfirm: false ,
		  closeOnCancel: true
		},
		function(isConfirm){
			if(isConfirm){
			var bookId=thisButton.attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/book/deleteBook?bid="+bookId,
				type:"GET",
				dataType:"json",
				success:function(data){
					if(data.result == "true" || data.result == true){
						//删除成功
						swal("提示", data.des, "success");
						location.href="/book/showBookList?"+
						"bname="+""+"&"+
						"uid="+""+"&"+
						"uname="+""+"&"+
						"pageNum="+"1";	
					}else {
						//删除失败
						swal("提示", data.des, "error");
					}
				},
				error:function(data){
					//删除失败
					swal("提示", data.des, "error");
				}
			});
			}else {
				
			}
		});
});
 </script>
</html>