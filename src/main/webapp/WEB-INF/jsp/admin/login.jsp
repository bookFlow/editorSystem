<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书漂流管理后台</title>
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
</head>
    <body class="gray-bg">
        <div class="middle-box text-center loginscreen  animated fadeInDown">
            <div>
                <div>
                    <h2 class="logo-name">B</h2>
                </div>
                    <h3>欢迎使用图书漂流后台编辑系统</h3>
                <div class="form-group">
                    <input class="form-control email" placeholder="账号" >
                </div>
                        <div class="form-group">
                             <input type="password" class="form-control password" placeholder="密码" />
                        </div>
                <button type="submit" class="btn btn-primary block full-width login">登 录</button>
            </div>

            <div>
            </div>
        </div>
    </body>
    <script>
    function createFromSubmit(url,passport,password){
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
        var passportEle = $('<input type="text" name="passport" />');  
        passportEle.attr('value', passport);  
        var passwordEle = $('<input type="password" name="password" />');  
        passwordEle.attr('value', password);  
        // 附加到Form  
        form.append(passportEle);  
        form.append(passwordEle); 
        // 提交表单  
        form.submit();  
        // 注意return false取消链接的默认动作  
        return false;  
    	
    	
    }
    
    
    $(".login").bind("click", function() {
        var passport = $(this).parent().find('.email').val();
        var password = $(this).parent().find('.password').val();
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/checkLogin",
            type:"POST",
            data:{
                    "passport":passport,
                    "password":password
            },
            dataType:"JSON",
            success:function(data){
                if(data.result == "true" || data.result==true){
                	location.href=location.href;
                }else {
                    swal("错误",data.des,"error");
                }
            },
            error:function(e){
                    swal("错误",e.message,"error");
            }

        });
    });

    </script>
</html>