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
        var mydate;
        function sendResume(visitorId) {
            ajax("get","apply/jobApply.do",{"visitorId":visitorId},true, function (data, readyState, status) {
                if (readyState == 4 && status == 200) {
                    mydate = data;
                    show();
                }
            });
        }
        function show() {


        }

    </script>
</head>
<body>
<div class="container">
    <!--导航条-->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">新人新事</a>
            </div>

            <div>
                <c:choose>
                    <c:when test="${sessionScope.visitor!=null}">
                        <a class="navbar-text navbar-left" href="/visitor/visitorIndex.do">
                            <c:out value="${sessionScope.visitor.visitorName}"></c:out></a>
                    </c:when>
                    <c:otherwise>
                        <a class="navbar-text navbar-left" href="/visitor/login.do">请登录</a>
                    </c:otherwise>
                </c:choose>
            </div>

            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li><a href="/visitorNews/visitorNews.view">消息中心</a></li>
                    <li><a href="/baseInfo/baseInfo.do">完善个人信息</a></li>
                    <li><a href="/resume/resume.do">个人简历</a></li>
                    <li><a href="/visitor/visitorExit.do">退出</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr>
                    <td>招聘信息</td>
                </tr>
                <tr class="success">
                    <th>部门</th>
                    <th>职位类型</th>
                    <th>招聘形式</th>
                    <th>工作地点</th>
                    <th>雇佣人数</th>
                    <th>薪资</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${recruitments}" var="recruitment">
                    <tr>
                        <td><c:out value="${recruitment.departmentName}"></c:out></td>
                        <td><c:out value="${recruitment.positionTypeName}"></c:out></td>
                        <td><c:out value="${recruitment.employeeForm}"></c:out></td>
                        <td><c:out value="${recruitment.jobAddress}"></c:out></td>
                        <td><c:out value="${recruitment.hireNum}"></c:out></td>
                        <td><c:out value="${recruitment.salaryRange}"></c:out></td>
                        <td><button class="btn btn-primary" onclick="sendResume(${sessionScope.visitor.id})">投递简历</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>


</div>
</body>
</html>