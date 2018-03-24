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
</head>
<body>

<div id="alert"></div>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        薪资信息
                    </td>
                    <td colspan="2" >
                        <a href="/salary/addSalary.view"><button class="btn btn-primary">添加薪资条</button></a>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>员工ID</th>
                    <th>出勤天数</th>
                    <th>基本薪资</th>
                    <th>五险一金</th>
                    <th>奖惩金额</th>
                    <th>总薪资</th>
                    <th>备注</th>
                    <th>薪资状态</th>
                    <th>发放时间</th>
                </tr>
                <c:forEach items="${salaries}" var="salary">
                    <tr>
                        <td><c:out value="${salary.id}"></c:out></td>
                        <td><c:out value="${salary.employeeId}"></c:out></td>
                        <td><c:out value="${salary.attendanceDays}"></c:out></td>
                        <td><c:out value="${salary.baseSalary}"></c:out></td>
                        <td><c:out value="${salary.fiveInsurancePayment}"></c:out></td>
                        <td><c:out value="${salary.rewardsMoney}"></c:out></td>
                        <td><c:out value="${salary.totalSalary}"></c:out></td>
                        <td><c:out value="${salary.salaryInfo}"></c:out></td>
                        <td><c:out value="${salary.salaryStatus}"></c:out></td>
                        <td><c:out value="${salary.releaseTime}"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>