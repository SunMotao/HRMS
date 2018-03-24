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
</head>
<body>

<div id="alert"></div>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        员工列表
                    </td>
                    <td colspan="2" >
                        <a href="/employee/addEmployee.view"><button class="btn btn-primary">添加员工</button></a>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>基本信息id</th>
                    <th>部门id</th>
                    <th>员工名</th>
                    <th>入职形式</th>
                    <th>手机号码</th>
                    <th>邮箱</th>
                    <th>录用时间</th>
                    <th>状态</th>
                </tr>
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td><c:out value="${employee.id}"></c:out></td>
                        <td><c:out value="${employee.baseInfoId}"></c:out></td>
                        <td><c:out value="${employee.departmentId}"></c:out></td>
                        <td><c:out value="${employee.employeeName}"></c:out></td>
                        <td><c:out value="${employee.employeeForm}"></c:out></td>
                        <td><c:out value="${employee.employeePhone}"></c:out></td>
                        <td><c:out value="${employee.employeeEmail}"></c:out></td>
                        <td><c:out value="${employee.hireTime}"></c:out></td>
                        <td><c:out value="${employee.employeeStatus}"></c:out></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>

</body>
</html>