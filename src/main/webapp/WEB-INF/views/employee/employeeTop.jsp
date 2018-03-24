<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>首页</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <script src="/scripts/ajax.js"></script>
    <script>
        var mydata;
        function updateNameAndPassword() {
            var employeeName=prompt("请输入新的用户名",0);
            var employeePassword=prompt("请输入新的密码",0);
            ajax("get","employee/updateNameAndPassword.do",{"employeeName":employeeName,
                "employeePassword":employeePassword},true,function (data,readyState,status) {
                if(readyState==4&&status==200){
                    mydata=data;
                }
            });
        }
    </script>
</head>
<body>
<!--导航条-->
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">新人新事</a>
        </div>

        <div>
            <c:choose>
                <c:when test="${sessionScope.employee!=null}">
                    <a class="navbar-text navbar-left" href="/employee/employeeLogin.view">
                        <c:out value="${sessionScope.employee.employeeName}"></c:out></a>
                </c:when>
                <c:otherwise>
                    <a class="navbar-text navbar-left" href="/employee/employeeLogin.view">请登录</a>
                </c:otherwise>
            </c:choose>
        </div>

        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a onclick="updateNameAndPassword()" >修改账号密码</a></li>
                <li><a href="/visitorNews/visitorNews.view">消息中心</a></li>
                <li><a href="/baseInfo/baseInfo.do">完善个人信息</a></li>
                <li><a href="/attendance/attendanceManager.view">考勤打卡</a></li>
                <li><a href="/employee/employeeTrainManager.view">培训信息</a></li>
                <li><a href="/visitor/visitorExit.do">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>