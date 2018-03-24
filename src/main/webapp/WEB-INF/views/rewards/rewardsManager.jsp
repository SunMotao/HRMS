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
                        奖惩信息
                    </td>
                    <td colspan="2" >
                        <a href="/rewards/addRewards.view"><button class="btn btn-primary">添加奖惩</button></a>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>员工ID</th>
                    <th>奖惩主题</th>
                    <th>奖惩内容</th>
                    <th>奖惩金额</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                </tr>
                <c:forEach items="${rewardses}" var="rewards">
                    <tr>
                        <td><c:out value="${rewards.id}"></c:out></td>
                        <td><c:out value="${rewards.employeeId}"></c:out></td>
                        <td><c:out value="${rewards.rewardsTitle}"></c:out></td>
                        <td><c:out value="${rewards.rewardsContent}"></c:out></td>
                        <td><c:out value="${rewards.rewardsMoney}"></c:out></td>
                        <td><c:out value="${rewards.rewardsCreateTime}"></c:out></td>
                        <td><c:out value="${rewards.rewardsModifiedTime}"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

</body>
</html>