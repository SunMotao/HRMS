<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>VisitorTop</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">

</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">HOME</a>
        </div>
        <div>
                <c:choose>
                    <c:when test="${sessionScope.visitor!=null}">
                        <a class="navbar-text navbar-left" href="/visitor/visitorIndex.do">
                            <span class="glyphicon glyphicon-user">
                            <c:out value="${sessionScope.visitor.visitorName}"></c:out></span></a>
                    </c:when>
                    <c:otherwise>
                        <a href="/visitor/login.do" class="navbar-text navbar-left">请登录</a>
                    </c:otherwise>
                </c:choose>
        </div>
        <div>
            <a class=" navbar-text navbar-left" href="informManager.view">About</a>
            <a class=" navbar-text navbar-left" href="productManager.view">Team</a>
            <a class=" navbar-text navbar-left" href="page/order/orderManager.jsp">Services</a>
        </div>
    </div>
</nav>

<div class="row">
    <div >
        <ul class="drawer">
            <li>
                <a href="/visitor/recruitmentInfo.view">
                    <i class="fa fa-info-circle"></i>
                    <span>查看招聘信息</span>
                </a>
            </li>

            <li>
                <a href="/visitorNews/visitorNews.view">
                    <i class="fa fa-info-circle"></i>
                    <span>消息中心</span>
                </a>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <i class="fa fa-folder-open"></i>
                            <span>Portfolio</span>
                        </a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="/baseInfo/baseInfo.do">
                    <i class="fa fa-folder"></i>
                    <span>完善个人信息</span>
                </a>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <i class="fa fa-flash"></i>
                            <span>Hover.css</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/resume/resume.view">
                    <i class="fa fa-share-alt"></i>
                    <span>个人简历</span>
                </a>
                <ul>
                    <li>
                        <a href="#" target="_blank">
                            <i class="fa fa-codepen"></i>
                            <span>CodePen</span>
                        </a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="/visitor/visitorExit.do">
                    <i class="fa fa-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>