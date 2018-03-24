<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>首页</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>

</head>
<body>
<div>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="page/admin/adminIndex.jsp">管理页面</a>
        </div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.admin!=null}">
                    <a class="navbar-text navbar-left" href="/admin/adminLogin.view">
                        <c:out value="${sessionScope.admin.adminName}"></c:out></a>
                </c:when>
                <c:otherwise>
                    <a class="navbar-text navbar-left" href="/admin/adminLogin.view">请登录</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div>
            <a class=" navbar-text navbar-left" href="/adminNews/adminNews.view">消息管理</a>
            <a class=" navbar-text navbar-left" href="/department/departmentManager.do">部门管理</a>
            <a class=" navbar-text navbar-left" href="/positionType/positionTypeManager.do">职位类型管理</a>
            <a class=" navbar-text navbar-left" href="/position/positionManager.do">职位管理</a>
            <a class=" navbar-text navbar-left" href="/employee/employeeManager.view">员工管理</a>
            <a class=" navbar-text navbar-left" href="/recruitment/recruitmentManager.do">招聘管理</a>
            <a class=" navbar-text navbar-left" href="/train/train.view">培训管理</a>
            <a class=" navbar-text navbar-left" href="shelfManager.do">考勤管理</a>
            <a class=" navbar-text navbar-left" href="/rewards/rewardsManager.view">奖惩管理</a>
            <a class=" navbar-text navbar-left" href="/salary/salaryManager.view">薪资管理</a>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="page/admin/userIndex.jsp" class="dropdown-toggle">
                        账户管理 <b class="caret"></b>
                    </a>

                </li>
            </ul>
        </div>
        <a class="navbar-text navbar-right" href="/visitor/visitorExit.do">退出</a>
    </div>
</nav>

</div>
</body>
</html>