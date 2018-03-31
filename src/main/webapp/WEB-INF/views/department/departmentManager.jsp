<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>DepartmentManager</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        function addDepartment() {
            var departmentName=prompt("请输入部门名称",0);
            $.ajax({
                url:"department/addDepartment.do",
                data:{"departmentName":departmentName},
                success:function (data) {
                    alert(data)
                }
            });
        }
        function deleteDepartment(departmentId) {
            $.ajax({
                url:"department/deleteDepartment.do",
                data:{"id":departmentId},
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
                        部门列表
                    </td>
                    <td colspan="2" >
                        <button class="btn btn-primary" onclick="addDepartment()">添加部门</button>

                    </td>
                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>部门名</th>
                    <th>部门状态</th>
                    <th>创建时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${departments}" var="department">
                    <tr>
                        <td><c:out value="${department.id}"></c:out></td>
                        <td><c:out value="${department.departmentName}"></c:out></td>
                        <td><c:out value="${department.departmentStatus}"></c:out></td>
                        <td><c:out value="${department.departmentCreateTime}"></c:out></td>
                        <td><c:out value="${department.departmentModifiedTime}"></c:out></td>
                        <td><button class="btn  btn-danger" onclick="deleteDepartment(${department.id},this)">删除</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>
</body>
</html>