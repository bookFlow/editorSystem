<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书漂流管理后台</title>
    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/sweetalert2.min.css"/>
   <link
            href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/css/font-awesome.min.css?v=4.4.0"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/css/animate.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/css/style.css?v=4.1.0"
            rel="stylesheet">

</head>
    <body class="fixed-sidebar full-height-layout gray-bg"
      style="overflow: hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"></div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
                                class="clear"> <span class="block m-t-xs"
                                                     style="font-size: 20px;"> <strong class="font-bold">图书漂流编辑后台</strong>
							</span>
						</span>
                        </a>
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
					<span class="ng-scope"> 欢迎&nbsp;&nbsp; ${user.name}
						&nbsp;&nbsp; <a
                                href="${pageContext.request.contextPath}/admin/logOut"><i
                                class="fa fa-sign-out"></i> 退出</a>
				</span>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope"><h3>推送管理</h3></span>
                </li>

                    <li>
                        <a class="J_menuItem"
                           href="${pageContext.request.contextPath}/push/showPush">
                            <span class="nav-label">推送查看</span>
                        </a>
                    </li>
                    <li>
                         <a class="J_menuItem"
                            href="${pageContext.request.contextPath}/push/showPushConfig">
                            <span class="nav-label">推送设置</span>
                        </a>
                    </li>
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope"><h3>图书管理</h3></span>
                    </li>

                    <li>
                        <a class="J_menuItem"
                            href="${pageContext.request.contextPath}/book/showBookList">
                        <span class="nav-label">图书查看</span>
                        </a>
                    </li>
                      <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span class="ng-scope"><h3>交易管理</h3></span>
                    </li>

                    <li>
                        <a class="J_menuItem"
                            href="${pageContext.request.contextPath}/record/showRecordList">
                        <span class="nav-label">交易查看</span>
                        </a>
                    </li>
                <c:choose>
                    <c:when test="${user.position eq '0'}">
                        <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                            <span class="ng-scope"><h3>人员管理</h3></span>
                        </li>
                        <li>
                            <a class="J_menuItem"
                                   href="${pageContext.request.contextPath}/admin/showUserList"> <span
                                    class="nav-label">管理员查看/添加</span>
                            </a>
                        </li>

                    </c:when>

                </c:choose>



            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src=""
                    frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script
        src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
<script
        src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/sweetalert2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script
        src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- 自定义js -->
<script
        src="${pageContext.request.contextPath}/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/index.js"></script>

<div style="text-align: center;">
    </div>
</body>
    <script>
    </script>
</html>