<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>PositionTypeManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <script src="/scripts/ajax.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        function addPositionType() {
            var departmentId=prompt("请输入部门编号",0);
            var positionTypeName=prompt("请输入职位类型名称",0);
            var positionTypeInfo=prompt("请输入职位类型描述",0);
            $.ajax({
                url:"positionType/addpositionType.do",
                data:{"departmentId":departmentId,"positionTypeName":positionTypeName,"positionTypeInfo":positionTypeInfo},
                success:function (data) {
                    alert(data)
                }
            });
        }
        function deletePositionType(positionTypeId) {
            $.ajax({
                url:"positionType/deletepositionType.do",
                data:{"id":positionTypeId},
                success:function (data) {
                    alert(data)
                }
            });
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
                    <td colspan="2">
                        职位类型列表
                    </td>
                    <td colspan="2" >
                        <button class="btn btn-primary" onclick="addPositionType()">添加职位类型</button>
                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>部门id</th>
                    <th>职位类型名称</th>
                    <th>职位信息</th>
                    <th>职位状态</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${positionTypes}" var="positionType">
                    <tr>
                        <td><c:out value="${positionType.id}"></c:out></td>
                        <td><c:out value="${positionType.departmentId}"></c:out></td>
                        <td><c:out value="${positionType.positionTypeName}"></c:out></td>
                        <td><c:out value="${positionType.positionTypeInfo}"></c:out></td>
                        <td><c:out value="${positionType.positionTypeStatus}"></c:out></td>
                        <td><c:out value="${positionType.positionTypeCreateTime}"></c:out></td>
                        <td><c:out value="${positionType.positionTypeModifiedTime}"></c:out></td>
                        <td><button class="btn  btn-danger" onclick="deletePositionType(${positionType.id},this)">删除</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>
</body>
</html>