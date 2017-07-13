<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>人员查询界面</title>
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
               		<button id="adBtn" type="button"  class="btn btn-success" data-toggle="modal" data-target="#myModal">添加</button>
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
    <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					人员添加
				</h4>
			</div>
			<div class="modal-body">
				<form id="addUserForm" class="form-horizontal" role="form">
					  <div class="form-group">
						<label for="add_name" class="col-sm-2 control-label">名字</label>
						<div class="col-sm-8">
						  <input type="text" name="name" class="form-control" id="add_name" placeholder="请输入名字">
						</div>
						 <div class="col-sm-2">
							 <span id="" class=""></span>
						</div>
					  </div>
					   <div class="form-group">
						<label for="add_pp" class="col-sm-2 control-label">账号</label>
						<div class="col-sm-8">
						  <input type="text" name="passport" class="form-control" id="add_pp" placeholder="请输入账号">
						</div>
						 <div class="col-sm-2">
							 <span id="add_vPp" class=""></span>
						</div>
					  </div>
					   <div class="form-group">
						<label for="add_pwd" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-8">
						  <input type="password" name="password" class="form-control" id="add_pwd" placeholder="">
						</div>
						 <div class="col-sm-2">
							 <span id="add_vPw" class=""></span>
						</div>
					  </div>
					  <div class="form-group">
						<label for="add_surePwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-8">
						  <input type="password" class="form-control" id="add_surePwd" placeholder="">
						</div>
						 <div class="col-sm-2">
							 <span id="add_vPw1" class=""></span>
						</div>
					  </div>
					  <div class="form-group">
						<label for="add_surePwd" class="col-sm-2 control-label">身份</label>
						<div class="col-sm-4">
							<select  class="form-control" id="posSelect">
								<c:if test="${position == 0}">
									<option value="0">超级管理员</option>
								</c:if>	
									<option selected="selected" value="1">普通</option>
							</select>
						</div>
					  </div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					取消
				</button>
				<button id="submitUser" type="button" class="btn btn-primary">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
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
				location.href="${pageContext.request.contextPath}/admin/showUserList?"+
						"name="+$("#nameInput").val()+"&"+
						"passport="+$("#ppInput").val()+"&"+
						"pageNum=1";
				
			}else {
				//
				swal("提示","请输入查询条件","warning");
			}
			
			
		});
		//删除操作
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
					var passPortId=thisButton.attr("id").substring(thisButton.attr("id").indexOf("_")+1);//passPorts
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/deleteAdmin?passport="+passPortId,
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
	  function createFromSubmit(url,name,password,pageNum){
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
	        var nameEle = $('<input type="text" name="name" />');  
	        nameEle.attr('value', name);  
	        var passportEle = $('<input type="password" name="passport" />');  
	        passportEle.attr('value', password);  
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
		var name=$("#nameInput").attr("index");
		var passport=$("#ppInput").attr("index");
		if(nowPageNum<=1){
			return false;
		}else {
			//到上一页去
			createFromSubmit("${pageContext.request.contextPath}/admin/showUserList",name,passport,nowPageNum-1);
		}
	});
	$(".nextPage").click(function(){
		//向后翻页
		var nowPageNum= parseInt($(".nowPage").eq(0).attr("index"));
		var totalPageNum=parseInt($(".nextPage").eq(0).attr("index"));
		var name=$("#nameInput").attr("index");
		var passport=$("#ppInput").attr("index");
		if(nowPageNum>=totalPageNum){
			//超过最大页数
			return false;
		}else {
			//到上一页去
			createFromSubmit("${pageContext.request.contextPath}/admin/showUserList",name,passport,nowPageNum+1);
		} 
	});
	$(".usableLink").click(function(){
		//点击某个具体页
		var pageNum=parseInt($(this).attr("index"));//页码
		var name=$("#nameInput").attr("index");
		var passport=$("#ppInput").attr("index");
		createFromSubmit("${pageContext.request.contextPath}/admin/showUserList",name,passport,pageNum);
		return false;
	});
	$("#add_pp").blur(function(){
		//验证账号
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/hasAdmin",
			type:"POST",
			data:{
				passport:$("#add_pp").val(),
				
			},
			dataType:"json",
			success:function(data){
				//如果有的话
				if(data.result == false || data.result == "false"){
					$("#add_vPp").attr("class","glyphicon glyphicon-ok");
					$("#add_vPp").css({"color":"#00C618"});
				}else {
					$("#add_vPp").attr("class","glyphicon glyphicon-remove-sign");
					$("#add_vPp").css({"color":"#FF4900"});
				}
			},
			error:function(){
					$("#add_vPp").attr("class","glyphicon glyphicon-remove-sign");
					$("#add_vPp").css({"color":"#A60000"});
			}

		});
		
		
		
	});
	$("#add_surePwd").blur(function(){
		//验证密码是否一致
		var pwd= $("#add_pwd").val();
		var pwd1=$("#add_surePwd").val();
		if(pwd != pwd1){
			
			$("#add_vPw1").text("两次密码不一致");
		}else {
			$("#add_vPw1").text("");
			
		}
	});
	$("#add_pwd").blur(function(){
		//验证密码是否符合要求，不小于6位
		var pwd= $("#add_pwd").val();
		if(!checkPwd(pwd)){
			$("#add_vPw").text("密码必须是字母和数字的组合且不小于6位");
			
		}else {
			
			$("#add_vPw").text("");
		}
		
	});
	function checkPwd(pwd){
		var str = pwd;
	    if (str == null || str.length <6) {
	        return false;
	    }
	    var reg1 = new RegExp(/^[0-9A-Za-z]+$/);
	    if (!reg1.test(str)) {
	        return false;
	    }
	    var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
	    if (reg.test(str)) {
	        return true;
	    } else {
	        return false;
	    }

		
		
	}
	
	$("#submitUser").click(function(){
		//提交表单
		$("#addUserForm").attr("action","${pageContext.request.contextPath}/admin/addAdmin");
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/addAdmin",
			type:"POST",
			data:{
				passport:$("#add_pp").val(),
				password:$("#add_pwd").val(),
				name:$("#add_name").val(),
				position:$("#posSelect").val() //选择框的值
			},
			dataType:"json",
			success:function(data){
				//成功返回
				if(data.result == "true" || data.result == true){
					//插入成功
					swal("提示","添加成功","success");
					//刷新
					var nowPageNum= parseInt($(".nowPage").eq(0).attr("index"));
					var name=$("#nameInput").attr("index");
					var passport=$("#ppInput").attr("index");
					createFromSubmit("${pageContext.request.contextPath}/admin/showUserList",name,passport,nowPageNum);
				}else {
					swal("提示","插入失败","warning");
					
				}
			},
			error:function(e){
				swal("提示","访问错误","warning");
				
			}
			
		});
		
	});
	</script>
</html>