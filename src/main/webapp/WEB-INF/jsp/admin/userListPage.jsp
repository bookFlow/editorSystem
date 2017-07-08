<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>人员查询界面</title>
        <title>图书漂流管理后台</title>
		 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sweetalert.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
       
    </head>
    <body>
    <div class="container">
        <div class="row clearfix">
            <!-- 这一行用来放置查询条件的输入框和按钮 -->
            <div class="col-md-12 column">
                <form class="form-inline" role="form">
                    <div class="form-group">
                    <label class="sr-only" for="name">名称</label>
                    <input id="nameInput" index="${name}" type="text" class="form-control" id="name" value=""
                    placeholder="管理员姓名">
                    </div>
                    <div class="form-group">
                    <label class="sr-only" for="name">名称</label>
                    <input id="ppInput" index="${passPort}" type="text" class="form-control" id="passPort" value=""
                    placeholder="登陆账号">
                    </div>
                    <button id="qBtn" type="button" page="${pageNum}" class="btn btn-default">查询</button>
                </form>
            </div>
        </div>
        <div class="row clearfix">
            <!-- 这一行放置table -->
            <div class="col-md-12 column">
             	<table class="table table-striped">
					<caption>人员列表</caption>
					<thead>
						<tr>
							<th>编号</th>
							<th>姓名</th>
							<th>账号</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<!-- 把数组里面的抽出来 -->
						<c:forEach 
							var="admin" 
							items="${adminList}" 
							varStatus="i"
							begin="${start}"
							end="${end}"
						>
							<tr>
								<td>${i.index+1}</td><!-- 编号 -->
								<td>${admin.getName()}</td><!-- 姓名 -->
								<td>${admin.getPassport()}</td><!-- 账号-->
								<td><button class="opButton btn btn-danger" id="${start+i.index}_${admin.getPassport()}">删除</button></td><!-- 删除操作 -->
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
		//现在要绑定些事件，1 搜索 2 翻页
		$("#qBtn").click(function(){
			//如果搜索框没有东西的话，无法搜索
			if(    
					(
							$("#nameInput").val() != null &&
							$("#nameInput").val() !=""
							
					
					) || 
					(
							$("#ppInput").val() != null &&
							$("#ppInput").val() !=""
							
					
					)

			){
				//现在可以查询
				location.href="/admin/showUserList?"+
						"name="+$("#nameInput").val()+"&"+
						"passport="+$("#ppInput").val()+"&"+
						"pageNum=1";
				
			}else {
				//
				swal("提示","请输入查询条件","warning");
			}
			
			
		});
		//删除操作
		$(".opButton").eq(0).click(function(){
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
				  closeOnCancel: false
				},
				function(isConfirm){
					if(isConfirm){
					var passPortId=thisButton.attr("id").substring(thisButton.attr("id").indexOf("_")+1);//passPorts
					$.ajax({
						url:"/admin/deleteAdmin?passport="+passPortId,
						type:"GET",
						dataType:"json",
						success:function(data){
							if(data.result == "true" || data.result == true){
								//删除成功
								swal("提示", data.des, "success");
								location.href="/admin/showUserList?"+
								"name="+$("#nameInput").attr("index")+"&"+
								"passPort="+$("#ppInput").attr("index")+"&"+
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
	
	</script>
</html>