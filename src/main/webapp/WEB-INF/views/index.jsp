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
    <!--导航条-->
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">新人新事</a>
            </div>
            <div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li><a href="#">功能介绍</a></li>
                    <li><a href="#">版本套餐</a></li>
                    <li><a href="#">最新动态</a></li>
                    <li><a href="#">关于我们</a></li>
                    <li><a href="#">下载</a></li>
                    <li><a href="#">合伙人加盟</a></li>
                    <li>
                        <a href="/visitorIndex.do">
                        <button class="login btn" type="button">用户</button>
                        </a>
                    </li>
                    <li>
                        <a href="/employee/employeeLogin.view">
                        <button class="login btn" type="button">员工</button>
                        </a>
                    </li>
                    <li>
                        <a href="/admin/login.do">
                        <button class="login btn" type="button">管理员</button>
                        </a>
                    </li>
                    <li>
                        <a href="/visitor/register.do">
                            <button class="register btn" type="button">注册</button>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

</div>


</body>
</html>