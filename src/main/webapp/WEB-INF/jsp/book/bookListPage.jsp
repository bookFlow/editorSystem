<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书查看</title>
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="row clearfix">
<!--放置查询条件 -->
<div class="col-md-12 column">
<form class="form-inline" role="form">
<div class="form-group">
<!--书名input属性不全 -->
<input id="bookname" placeholder="书名" class="form-control">
</div>
<!--发布者名字input属性不全 -->
<div class="form-group">
<input id="sellername" placeholder="发布者名字" class="form-control">
</div>
<div class="form-group">
<!--发布者idinput属性不全 -->
<input id="sellerid" class="form-control"  placeholder="卖家id">
</div>
<!--页数input属性不全-->
<div class="form-group">
<input id="pagenumber" class="form-control"  placeholder="页数">
</div>
<button id="qBtn" type="button" class="btn btn-default">查询</button>
</form>
</div>
</div>
</div>
<div class="row clearfix">
<!--放置table-->
<div class="col-md-12 column">
<table class="table table-striped">
<caption>图书列表</caption>
<thead>
<tr>
<th>编号</th>
<th>书id</th>
<th>书名</th>
<th>发布者名字</th>
<th>时间</th>
<th>操作</th>
</tr>
</thead>
<!--表的主体 -->
<tbody>
</tbody>
</table>
</div>
</div>
</body>
<script>
$("#qBtn").click(function(){
	//查询成功
	if(
	($("#bookname").val()!=null&&
	$("#bookname").val()!="")
	||
	(
	 $("#sellername").val()!=null&&
	 $("#sellername").val()!=""
	)||
	(
	  $("#sellerid").val()!=null&&
	  $("#sellerid").val()!=""
	)
	||
	(
	  $("#pagenumber").val()!=null&&
	)
	)
	{
		//若页数为空默认为查询第一页
		if($("#pagenumber").val()!=null&&
				  $("#pagenumber").val()!="")
			{
			 
			}
		
	}
	//不成功
	else
	{
		swal("提示","请输入查询条件","warning");
	}
	
});

</script>
</html>