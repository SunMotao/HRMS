<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>AdminTop</title>
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
            <a class="navbar-brand" href="#">
                <span class="glyphicon glyphicon-home">HOME</span></a>
        </div>
        <div>
            <c:choose>
                <c:when test="${sessionScope.admin!=null}">
                    <a class="navbar-text navbar-left" href="#">
                        <span class="glyphicon glyphicon-user"><c:out value="${sessionScope.admin.adminName}">
                        </c:out></span></a>
                </c:when>
                <c:otherwise>
                    <a href="/admin/adminLogin.do" class="navbar-text navbar-left">请登录</a>
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
                <a href="/adminNews/adminNews.view">
                    <i class="fa fa-info-circle"></i>
                    <span>消息管理</span>
                </a>
            </li>

            <li>
                <a href="/department/departmentManager.do">
                    <i class="fa fa-info-circle"></i>
                    <span>部门管理</span>
                </a>
                <ul>
                    <li>
                        <a href="/department/queryAllDepartment.do" target="_blank">
                            <i class="fa fa-folder-open"></i>
                            <span>查看所有部门</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/positionType/positionTypeManager.do">
                    <i class="fa fa-folder"></i>
                    <span>职位类型管理</span>
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
                <a href="/position/positionManager.do">
                    <i class="fa fa-share-alt"></i>
                    <span>职位管理</span>
                </a>
            </li>
            <li>
                <a href="/employee/employeeManager.view">
                    <i class="fa fa-share-alt"></i>
                    <span>员工管理</span>
                </a>
            </li>
            <li>
                <a >
                    <i class="fa fa-share-alt"></i>
                    <span>招聘管理</span>
                </a>

                <ul>
                    <li>
                        <a href="/recruitment/addRecruitment.view" target="_blank">
                            <i class="fa fa-flash"></i>
                            <span>添加招聘</span>
                        </a>
                    </li>

                    <li>
                        <a href="/apply/seeResume.view" target="_blank">
                            <i class="fa fa-flash"></i>
                            <span>已投简历</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/train/train.view">
                    <i class="fa fa-share-alt"></i>
                    <span>培训管理</span>
                </a>
            </li>
            <li>
                <a href="/attendance/attendanceManager.view">
                    <i class="fa fa-share-alt"></i>
                    <span>考勤管理</span>
                </a>
            </li>
            <li>
                <a href="/rewards/rewardsManager.view">
                    <i class="fa fa-share-alt"></i>
                    <span>奖惩管理</span>
                </a>
            </li>
            <li>
                <a href="/salary/salaryManager.view">
                    <i class="fa fa-share-alt"></i>
                    <span>薪资管理</span>
                </a>
            </li>

            <li>
                <a href="/admin/adminExit.do">
                    <i class="fa fa-share-alt"></i>
                    <span>退出</span>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>