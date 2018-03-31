<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>PositionManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <script src="/scripts/ajax.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        function addPosition() {
            var positionTypeId=prompt("请输入职位类型编号",0);
            var positionName=prompt("请输入职位名称",0);
            var positionInfo=prompt("请输入职位描述",0);
            $.ajax({
                url:"position/addPosition.do",
                data:{"positionTypeId":positionTypeId,"positionName":positionName,"positionInfo":positionInfo},
                success:function (data) {
                    alert(data)
                }
            });
        }
        function deletePosition(positionId) {
            $.ajax({
                url:"position/deletePosition.do",
                data:{"id":positionId},
                success:function (data) {
                    alert(data)
                }
            });
        }
    </script>
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
                        职位类型列表
                    </td>
                    <td colspan="2" >
                        <button class="btn btn-primary" onclick="addPosition()">添加职位</button>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>职位类型编号</th>
                    <th>职位名</th>
                    <th>职位信息</th>
                    <th>职位状态</th>
                    <th>添加时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${positions}" var="position">
                    <tr>
                        <td><c:out value="${position.id}"></c:out></td>
                        <td><c:out value="${position.positionTypeId}"></c:out></td>
                        <td><c:out value="${position.positionName}"></c:out></td>
                        <td><c:out value="${position.positionInfo}"></c:out></td>
                        <td><c:out value="${position.positionStatus}"></c:out></td>
                        <td><c:out value="${position.positionCreateTime}"></c:out></td>
                        <td><c:out value="${position.positionModifiedTime}"></c:out></td>
                        <td><button class="btn  btn-danger" onclick="deletePosition(${position.id},this)">删除</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>
</body>
</html>