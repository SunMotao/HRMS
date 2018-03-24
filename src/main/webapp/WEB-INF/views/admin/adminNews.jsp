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
    <script src="/scripts/ajax.js"></script>
    <script>
        var mydate;
        function mark(adminNewsId) {
            ajax("get","adminNews/markAdminNews.do",{"id":adminNewsId},true,function(data,myState,status){
                if(myState==4&&status==200){
                    mydate=data;
                }
            })
        }
    </script>
</head>
<body>

<jsp:include page="adminTop.jsp"></jsp:include>

<div>
    <table class="table table-bordered">

        <tr>
            <td>消息列表</td>
        </tr>
        <tr class="success">
            <th>id</th>
            <th>用户ID</th>
            <th>员工ID</th>
            <th>消息主题</th>
            <th>消息内容</th>
            <th>添加时间</th>
            <th>修改时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${adminNewses}" var="adminNews">
            <tr>
                <td><c:out value="${adminNews.id}"></c:out></td>
                <td><c:out value="${adminNews.visitorId}"></c:out></td>
                <td><c:out value="${adminNews.employeeId}"></c:out></td>
                <td><c:out value="${adminNews.adminNewsTitle}"></c:out></td>
                <td><c:out value="${adminNews.adminNewsStatus}"></c:out></td>
                <td><c:out value="${adminNews.adminNewsCreateTime}"></c:out></td>
                <td><c:out value="${adminNews.adminNewsModifiedTime}"></c:out></td>
                <td><button class="btn btn-primary" onclick="mark(${adminNews.id})">标记</button></td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>