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
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        var mydata;
        function seeEmployeeAttendance() {
            var empId=prompt("请输入员工ID",0);
            $.ajax({
                url:"attendance/seeEmployeeAttendance.do",
                data:{"employeeId":empId},
                dataType: "json",
                success:function (data) {
                    mydata=data;
                    showData();
                }
            });
        }
        function showData() {
            var c = "<table class='table table-bordered'> " +
                    "<caption >考勤列表</caption> " +
                    "<tr class='success'> " +
                    "<th>员工ID</th> " +
                    "<th>签到类型</th> " +
                    "<th>签到时间</th> " +
                    "<th>签退时间</th> " +
                    "<th>备注</th>" +
                    "</tr>"
          for(var i=0;i<mydata.length;i++){
              c += "<tr>"
              c += "<td>" + mydata[i].employeeId + "</td>"
              c += "<td>" + mydata[i].attendanceType + "</td>"
              c += "<td>" + mydata[i].attendanceBeginTime + "</td>"
              c += "<td>" + mydata[i].attendanceEndTime + "</td>"
              c += "<td>" + mydata[i].attendanceInfo + "</td>"
              c += "</tr>"
          }

            var conn = document.getElementById("content");
            conn.innerHTML = c;

        }
    </script>
</head>
<body>
<jsp:include page="../admin/adminTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td>
                        考勤列表
                    </td>
                    <td>
                        <button class="btn btn-primary" onclick="seeEmployeeAttendance()">查看指定员工考勤记录</button>
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