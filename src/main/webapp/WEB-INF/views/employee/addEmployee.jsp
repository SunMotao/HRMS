<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>AddEmployee</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script src="/scripts/alert.js"></script>
    <script>
        window.onload=function () {
                    var a= document.getElementById("alert");
                    hideAlert(a);
                }
    </script>
    <style>
        #alert {
            position: absolute;
            z-index: 1100;
            width: 100%;
        }
    </style>
</head>
<body>
<jsp:include page="../admin/adminTop.jsp"></jsp:include>
<div id="alert">
    <c:if test="${info!=null}">
        <div class="alert alert-danger">
            <c:out value="${info}"></c:out>
        </div>
    </c:if>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <form action="/employee/addEmployee.do" name="form1">

                <table class="table table-bordered">
                    <tr class="h4">
                        <td colspan="2">
                            添加员工
                        </td>
                    </tr>
                   <tr>
                       <td>基本信息ID</td>
                       <td><input type="text" name="baseInfoId"></td>
                       <td>部门ID</td>
                       <td><input type="text" name="departmentId"></td>
                       <td>基本薪资</td>
                       <td><input type="text" name="baseSalary"></td>
                   </tr>
                    <tr>
                        <td>手机号码</td>
                        <td colspan="2"><input type="text" name="employeePhone"></td>
                        <td>邮箱</td>
                        <td colspan="2"><input type="email" name="employeeEmail"></td>
                    </tr>
                    <tr>
                        <td>招聘形式</td>
                        <td colspan="2">
                            <select name="employeeForm">
                                <option>全职</option>
                                <option>兼职</option>
                                <option>实习</option>
                            </select>
                        <td>入职时间</td>
                        <td colspan="2"><input type="date" name="hireTime"></td>
                    </tr>
                    <tr>
                        <td>重置</td>
                        <td colspan="2"><input type="reset" value="重置"></td>
                        <td>提交</td>
                        <td colspan="2"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>