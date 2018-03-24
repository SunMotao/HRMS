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
                   </tr>
                    <tr>
                        <td>手机号码</td>
                        <td><input type="text" name="employeePhone"></td>
                        <td>邮箱</td>
                        <td><input type="email" name="employeeEmail"></td>
                    </tr>
                    <tr>
                        <td>招聘形式</td>
                        <td><input type="text" name="employeeForm"></td>
                        <td>入职时间</td>
                        <td><input type="date" name="hireTime"></td>
                    </tr>
                    <tr>
                        <td>重置</td>
                        <td><input type="reset" value="重置"></td>
                        <td>提交</td>
                        <td><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>