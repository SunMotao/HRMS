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
    <script src="/scripts/alert.js"></script>
    <script>
        var mydate;
        var alt;
        window.onload=function () {
            alt=document.getElementById("alert");
        }

        function addDepartment() {
            var departmentName=prompt("请输入部门名称",0);
            ajax("get","department/addDepartment.do",{"departmentName":departmentName},true,function (date,readyState,status) {
                if (readyState == 4 && status == 200) {
                    mydate = date;
                    console.log(mydate);
                    showAddDepartment();
                }
            });
        }
        function showAddDepartment(){
            if(mydate=="success"){
                alt.innerHTML="添加成功";
            }
            if(mydate=="default"){
                alt.innerHTML="添加失败";
            }
            hideAlert(alt);
        }
    </script>
    <style>
        #alert{
            position: absolute;
            z-index: 1001;
            width: 100%;
        }
    </style>
</head>
<body>
<%--<jsp:include page="adminTop.jsp"></jsp:include>--%>
<div id="alert" ></div>

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
                        <td><button class="btn  btn-danger" onclick="deleteProduct(${product.id},this)">更新部门信息</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>
</body>
</html>