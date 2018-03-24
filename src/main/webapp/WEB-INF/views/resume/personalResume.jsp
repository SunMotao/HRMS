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
    <script src="/scripts/ajax.js"></script>
    <script>

    </script>
</head>

<body>
<div class="container">
    <div class="row">
        <form action="resume/addResume.do">
            <table class="table  table-bordered">
                <caption>个人简历</caption>
                <tr>
                    <td>简历名称</td>
                    <td><input type="text" name="resumeName"></td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="realName"></td>
                    <td>年龄</td>
                    <td><input type="text" name="age"></td>
                    <td>性别</td>
                    <td>
                        <select name="sex">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td><input type="email" name="email"></td>
                    <td>手机号</td>
                    <td><input type="text" name="phone"></td>
                </tr>
                <tr>
                    <td>期望薪资</td>
                    <td><input type="text" name="salaryException"></td>
                    <td>工作性质</td>
                    <td> <select name="jobCategory">
                        <option>全职</option>
                        <option>兼职</option>
                    </select></td>
                    <td>目前状态</td>
                    <td><select name="seekingStatus">
                        <option>在职</option>
                        <option>离职</option>
                    </select></td>
                </tr>

                <tr>
                    <td>学历</td>
                    <td ><input type="text" name="educationBackground"></td>
                    <td>身份证号</td>
                    <td ><input type="text" name="idCard"></td>
                </tr>
                <tr>
                    <td>工作经验</td>
                    <td colspan="8">
                        <textarea   rows="10" cols="120" name="jobExperience"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>自我评估</td>
                    <td colspan="8">
                        <textarea   rows="10" cols="120" name="evaluation"></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"><input type="reset" value="重置简历" class="btn  btn-warning"></td>
                    <td colspan="7"><input type="submit" value="保存简历" class="btn btn-primary"></td>
                </tr>

            </table>

        </form>
    </div>
</div>
</body>
</html>