<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<span><button type="button" class="btn btn-primary">返回</button></span>&nbsp&nbsp<button type="button" class="opButton btn btn-danger" id="${red.getRid()}">删除</button>
<table class="table table-condensed">
<caption>交易列表</caption>
<thead>
<tr>
<th>交易id</th>
<th>卖家id</th>
<th>卖家姓名</th>
<th>买家id</th>
<th>买家姓名</th>
<th>出版社</th>
<th>经度</th>
<th>纬度</th>
<th>建立时间</th>
<th>确立时间</th>
</tr>
</thead>
<tbody>
<tr>
<td>${red.getRid()}</td>
<td>${red.getSid()}</td>
<td>${red.getsName()}</td>
<td>${red.getBid()}</td>
<td>${red.getbName()}</td>
<td>${red.getpName()}</td>
<td>${red.getX()}</td>
<td>${red.getY()}</td>
<td>${red.getDateE()}</td>
<td>${red.getDateOk()}</td>
<tr>
</tbody>
</table>
</body>
<script>
$(".btn-primary").click(function(){
	location.href="${pageContext.request.contextPath}/record/showRecordList";
});
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