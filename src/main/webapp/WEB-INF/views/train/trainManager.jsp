<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>TrainManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../admin/adminTop.jsp"></jsp:include>
<div id="alert"></div>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        培训列表
                    </td>
                    <td colspan="2" >
                        <a href="/train/addTrain.view"><button class="btn btn-primary">添加培训</button></a>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>培训主题</th>
                    <th>培训人物</th>
                    <th>培训地址</th>
                    <th>培训时间</th>
                    <th>培训内容</th>
                </tr>
                <c:forEach items="${trains}" var="train">
                    <tr>
                        <td><c:out value="${train.id}"></c:out></td>
                        <td><c:out value="${train.trainTitle}"></c:out></td>
                        <td><c:out value="${train.trainPeople}"></c:out></td>
                        <td><c:out value="${train.trainAddress}"></c:out></td>
                        <td><c:out value="${train.trainTime}"></c:out></td>
                        <td><c:out value="${train.trainContent}"></c:out></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>