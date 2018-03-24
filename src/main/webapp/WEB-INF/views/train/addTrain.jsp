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
            <form action="/train/addTrain.do" name="form1">

                <table class="table table-bordered">
                    <tr class="h4">
                        <td colspan="2">
                            添加培训信息
                        </td>
                    </tr>
                    <tr>
                        <td>培训主题</td>
                        <td><input type="text" name="trainTitle"></td>
                        <td>培训对象</td>
                        <td><input type="text" name="trainPeople"></td>
                    </tr>
                    <tr>
                        <td>培训地址</td>
                        <td><input type="text" name="trainAddress"></td>
                        <td>培训时间</td>
                        <td><input type="date" name="trainTime"></td>
                    </tr>
                    <tr>
                        <td>培训内容</td>
                        <td colspan="3"><textarea rows="10" cols="120" name="trainContent"></textarea></td>
                    </tr>
                    <tr>
                        <td>重置</td>
                        <td ><input type="reset" value="重置"></td>
                        <td>提交</td>
                        <td ><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>