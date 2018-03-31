<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>EmployeeTrainManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        function signIn(trainId) {
            $.ajax({
                url:"employee/trainSignIn.do",
                data:{"id":trainId},
                success:function (data) {
                    alert(data);
                }
            })
        }
        function signOut(trainId) {
            $.ajax({
                url:"employee/trainSignOut.do",
                data:{"id":trainId},
                success:function (data) {
                    alert(data);
                }
            })
        }

    </script>
</head>
<body>
<jsp:include page="employeeTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        培训列表
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>培训主题</th>
                    <th>培训人物</th>
                    <th>培训地址</th>
                    <th>培训时间</th>
                    <th>培训内容</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${trains}" var="train">
                    <tr>
                        <td><c:out value="${train.id}"></c:out></td>
                        <td><c:out value="${train.trainTitle}"></c:out></td>
                        <td><c:out value="${train.trainPeople}"></c:out></td>
                        <td><c:out value="${train.trainAddress}"></c:out></td>
                        <td><c:out value="${train.trainTime}"></c:out></td>
                        <td><c:out value="${train.trainContent}"></c:out></td>
                        <td><button class="btn btn-success" onclick="signIn(${train.id})">培训签到</button></td>
                        <td><button class="btn btn-primary" onclick="signOut(${train.id})">培训签退</button></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>