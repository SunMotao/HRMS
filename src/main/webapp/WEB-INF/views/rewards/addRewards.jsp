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

<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <form action="/rewards/addRewards.do" name="form1">

                <table class="table table-bordered">
                    <tr class="h4">
                        <td colspan="2">
                            添加奖惩信息
                        </td>
                    </tr>
                    <tr>
                        <td>员工ID</td>
                        <td><input type="text" name="employeeId"></td>
                        <td>奖惩金额</td>
                        <td><input type="number" name="rewardsMoney"></td>
                        <td>奖惩主题</td>
                        <td><input type="text" name="rewadsTitle"></td>
                    </tr>
                    <tr>
                        <td>奖惩内容</td>
                        <td colspan="5"><textarea  rows="8" cols="80" name="rewardsContent"></textarea></td>
                    </tr>

                    <tr>
                        <td colspan="2">重置</td>
                        <td><input type="reset" value="重置"></td>
                        <td colspan="2">提交</td>
                        <td><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

</body>
</html>