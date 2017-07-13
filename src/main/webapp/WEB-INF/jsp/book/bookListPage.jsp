<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<input id="bookname" placeholder="书名" type="text" class="form-control" index="${bname}">
</div>
<!--发布者名字input属性不全 -->
<div class="form-group">
<input id="sellername" placeholder="发布者名字" type="text"  class="form-control" index="${uname}">
</div>
<div class="form-group">
<!--发布者idinput属性不全 -->
<input id="sellerid" class="form-control" type="text" placeholder="人员编号" index="${uid}">
</div>
<button id="qBtn" type="button" class="btn btn-default" page="${pageNum}">查询</button>
</form>
</div>
</div>
<div class="row clearfix">
<!--放置table-->
<div class="col-md-12 column">
<table class="table table-striped">
<caption>图书列表</caption>
<thead>
<tr>
<th>书编号</th>
<th>人编号</th>
<th>书名</th>
<th>发布者名字</th>
<th>发布时间</th>
<th>操作</th>
</tr>
</thead>
<!--表的主体 -->
<tbody>
<!--  -->
<c:forEach
var="book"
items="${list}"
begin="${start}"
end="${end}"
>
<tr>
<td>${book.getBookId()}</td>
<td>${book.getUserId()}</td>
<td>${book.getBookName()}</td>
<td>${book.getUserName()}</td>
<td>${book.getDate()}</td>
<td><button type="button" class="btn btn-info" id="${book.getBookId()}">详情</button>&nbsp<button class="opButton btn btn-danger" id="${book.getBookId()}">删除</button></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
<div class="row clearfix">
        	<div class="col-md-12 column">
        		<!-- 这一行放置分页选项,如果是第一页，则前向箭头不能用 -->
        		 <%@ include file="/WEB-INF/jsp/common/pageCommon.jsp" %>
        	</div>
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
	)
	{
		//现在可以查询
		location.href="${pageContext.request.contextPath}/book/showBookList?"+
				"bname="+$("#bookname").val()+"&"+
				"uid="+$("#sellerid").val()+"&"+
				"uname="+$("#sellername").val()+"&"+
				"pageNum="+$("#pagenumber").val();		
	}
	//不成功
	else
	{
		swal("提示","请输入查询条件","warning");
	}
	
});
//翻页
function createFromSubmit(url,bname,sname,sid,pageNum){
	    	// 取得要提交的参数  
	        // 取得要提交页面的URL  
	        var action = url;  
	        // 创建Form  
	        var form = $('<form></form>');  
	        // 设置属性  
	        form.attr('action', action);  
	        form.attr('method', 'post');  
	        // form的target属性决定form在哪个页面提交  
	        // _self -> 当前页面 _blank -> 新页面  
	        form.attr('target', '_self');  
	        // 创建Input  
	        var bnameEle = $('<input type="text" name="bname" />');  
	        bnameEle.attr('value', bname);  
	        //
	        var snameEle = $('<input type="text" name="sname" />');  
	        snameEle.attr('value', sname);
	        //
	        var sidEle = $('<input type="text" name="bname" />');  
	        sidEle.attr('value', bname);
	        // 
	        var pageEle = $('<input type="text" name="pageNum" />');  
	        pageEle.attr('value', pageNum);  
	        // 附加到Form  
	        form.append(nameEle);  
	        form.append(passportEle); 
	        form.append(pageEle); 
	        form.appendTo("body");
	        // 提交表单  
	        form.submit();  
	        // 注意return false取消链接的默认动作  
	        return false;  
	    	
	    	
	}

$(".firstPage").click(function(){
	//向前翻页
	var nowPageNum= parseInt($(".nowPage").eq(0).attr("index"));
	//var name=$("#nameInput").attr("index");
	//var passport=$("#ppInput").attr("index");
	var bname=$("#bookname").attr("index");
	var uid=$("#sellerid").attr("index");
	var uname=$("#sellername").attr("index");
	if(nowPageNum<=1){
		return false;
	}else {
		//到上一页去
		createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",bname,uname,uid,nowPageNum-1);
		
	}
});
$(".nextPage").click(function(){
	//向后翻页
	var nowPageNum= parseInt($(".nowPage").eq(0).attr("index"));
	var totalPageNum=parseInt($(".nextPage").eq(0).attr("index"));
	var bname=$("#bookname").attr("index");
	var uid=$("#sellerid").attr("index");
	var uname=$("#sellername").attr("index");
	if(nowPageNum>=totalPageNum){
		//超过最大页数
		return false;
	}else {
		//到上一页去
		createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",bname,uname,uid,nowPageNum+1);
	} 
});
$(".usableLink").click(function(){
	//点击某个具体页
	var pageNum=parseInt($(this).attr("index"));//页码
	var bname=$("#bookname").attr("index");
	var uid=$("#sellerid").attr("index");
	var uname=$("#sellername").attr("index");
	createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",bname,uname,uid,pageNum);
	return false;
});
//删除
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
		  closeOnConfirm: false,
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
						"bname="+$("#bookname").attr("index")+"&"+
						"uid="+$("#sellerid").attr("index")+"&"+
						"uname="+$("#sellername").attr("index")+"&"+
						"pageNum="+$("#qBtn").attr("page");	
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
//详情
$(".btn-info").click(function(){
	var thisButton=$(this);
	var bookId=thisButton.attr("id");
	location.href="${pageContext.request.contextPath}/book/showBooDetail?bid="+bookId;
});
</script>
</html>