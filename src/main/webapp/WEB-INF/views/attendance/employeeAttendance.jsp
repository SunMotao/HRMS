<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>AttendanceManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        var mydate;
        function signIn() {
            var attendanceType=prompt("签到类型","公司正常签到");
            var attendanceInfo=prompt("备注",0);
            $.ajax({
                url:"attendance/signIn.do",
                async:false,

                data:{"attendanceType":attendanceType,"attendanceInfo":attendanceInfo},
                success:function (data) {
                    alert(data);
                }
            });
        }

        function signOut() {
            $.ajax({
                url:"attendance/signOut.do",
                async:false,
                success:function (data) {
                    alert(data);
                }
            });
        }
    </script>

</head>
<body>
<jsp:include page="../employee/employeeTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td>
                        考勤列表
                    </td>
                    <td colspan="2" >
                        <a onclick="signIn()"><button class="btn btn-success">签到</button></a>
                    </td>
                    <td colspan="2" >
                        <a onclick="signOut()"><button class="btn btn-primary">签退</button></a>
                    </td>
                </tr>
                <tr class="success">
                    <th>员工ID</th>
                    <th>签到类型</th>
                    <th>签到时间</th>
                    <th>签退时间</th>
                    <th>备注</th>
                </tr>
                <c:forEach items="${attendances}" var="attendance">
                    <tr>
                        <td><c:out value="${attendance.employeeId}"></c:out></td>
                        <td><c:out value="${attendance.attendanceType}"></c:out></td>
                        <td><c:out value="${attendance.attendanceBeginTime}"></c:out></td>
                        <td><c:out value="${attendance.attendanceEndTime}"></c:out></td>
                        <td><c:out value="${attendance.attendanceInfo}"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>