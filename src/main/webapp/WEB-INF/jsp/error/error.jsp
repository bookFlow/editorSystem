<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</body>
	<script>
		$(document).ready(function(){
			swal({
				  title: "提示",
				  text: "发生错误，点击确定返回",
				  type: "warning",
				  showCancelButton: false,
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定",
				  closeOnConfirm: false
				},
				function(){
					window.history.go(-1);
				});
		});
	</script>
</html>