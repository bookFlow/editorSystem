<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
</head>
<body>
<div class="container">
<div class="row clearfix">
<!--放置查询条件 -->
<div class="col-md-12 column">
<form class="form-inline" role="form">
<div class="form-group">
<!--买家id -->
<input id="bookid" placeholder="买家id" type="text" class="form-control" index="${bid}">
</div>
<!--卖家id-->
<div class="form-group">
<input id="sellerid" placeholder="卖家id" type="text"  class="form-control" index="${sid}">
</div>
<button id="qBtn" type="button" class="btn btn-default" page="${pageNum}">查询</button>
</form>
</div>
<div class="row clearfix">
<!--放置table-->
<div class="col-md-12 column">
<table class="table table-striped">
<caption>交易列表</caption>
<thead>
<tr>
<th>交易id</th>
<th>买家id</th>
<th>卖家id</th>
<th>交易状态</th>
<th>截至时间</th>
<th>操作</th>
</tr>
</thead>
<!--表的主体 -->
<tbody>
<!--  -->
<c:forEach
var="record"
items="${list}"
begin="${start}"
end="${end}"
>
<tr>
<td>${record.getRid()}</td>
<td>${record.getBid()}</td>
<td>${record.getSid()}</td>
<td>${record.getStatus()}</td>
<td>${record.getDateE()}</td>
<td><button type="button" class="btn btn-info" id="${record.getRid()}">详情</button>&nbsp<button class="opButton btn btn-danger" id="${record.getRid()}">取消</button></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
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
	($("#bookid").val()!=null&&
	$("#bookid").val()!="")
	||
	(
	 $("#sellerid").val()!=null&&
	 $("#sellerid").val()!=""
	)
	)
	{
		//现在可以查询
		location.href="${pageContext.request.contextPath}/record/showRecordList?"+
				"sid="+$("#sellerid").val()+"&"+
				"bid="+$("#bookid").val();		
	}
	//不成功
	else
	{
		swal("提示","请输入查询条件","warning");
	}
	
});
//翻页
function createFromSubmit(url,bname,sid,bid,pageNum){
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
	        bnameEle.attr('value', bid);  
	        //
	        var snameEle = $('<input type="text" name="sname" />');  
	        snameEle.attr('value', sid);
	        // 
	        var pageEle = $('<input type="text" name="pageNum" />');  
	        pageEle.attr('value', pageNum);  
	        // 附加到Form  
	        form.append(bnameEle);  
	        form.append(snameEle); 
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
	var bname=$("#bookid").attr("index");
	var sid=$("#sellerid").attr("index");
	if(nowPageNum<=1){
		return false;
	}else {
		//到上一页去
		createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",sid,bname,nowPageNum-1);
		
	}
});
$(".nextPage").click(function(){
	//向后翻页
	var nowPageNum= parseInt($(".nowPage").eq(0).attr("index"));
	var totalPageNum=parseInt($(".nextPage").eq(0).attr("index"));
	var bname=$("#bookid").attr("index");
	var sid=$("#sellerid").attr("index");
	if(nowPageNum>=totalPageNum){
		//超过最大页数
		return false;
	}else {
		//到上一页去
		createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",sid,bname,nowPageNum+1);
	} 
});
$(".usableLink").click(function(){
	//点击某个具体页
	var pageNum=parseInt($(this).attr("index"));//页码
	var bname=$("#bookid").attr("index");
	var sid=$("#sellerid").attr("index");
	createFromSubmit("${pageContext.request.contextPath}/book/bookListPage",sid,bname,pageNum);
	return false;
});
//详情
$(".btn-info").click(function(){
	var thisButton=$(this);
	var rid=thisButton.attr("id");
	//var rid="0";
	location.href="${pageContext.request.contextPath}/record/showdetailRecord?rid="+rid;
});
//取消
$(".opButton").click(function(){
	var thisButton=$(this);
	swal({
		  title: "提示",
		  text: "是否确定取消，此操作不可恢复",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "是，取消",
		  cancelButtonText: "取消",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
		function(isConfirm){
			if(isConfirm){
			var bookId=thisButton.attr("id");
			$.ajax({
				url:"${pageContext.request.contextPath}/record/cancelRecord?rid="+bookId,
				type:"GET",
				dataType:"json",
				success:function(data){
					if(data.result == "true" || data.result == true){
						//删除成功
						swal("提示", data.des, "success");
						location.href="${pageContext.request.contextPath}/record/showRecordList";
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