<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>Index</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <link href="/styles/bootstrap.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/bootstrap.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="/styles/style.css">
</head>
<body>
<nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
    <div class="container">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Spirit8</a>
        </div>


        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#tf-home" class="page-scroll"><span class="glyphicon glyphicon-home">HOME</span></a></li>
                <li><a href="http://www.iotek.com.cn/" class="page-scroll">About</a></li>
                <li><a href="http://www.iotek.com.cn/iotek-offline-site/html/about-us-honor.html" class="page-scroll">Team</a></li>
                <li><a href="#tf-services" class="page-scroll">Services</a></li>
                <li><a href="/visitorIndex.do"><span class="glyphicon glyphicon-user">Reg/Log</span></a></li>
                <li><a href="/employee/employeeLogin.view"><span class="	glyphicon glyphicon-star">Employee/Admin</span></a></li>
            </ul>
        </div>
    </div>
</nav>

<div id="tf-home" class="text-center">
    <div class="overlay">
        <div class="content">
            <h1>Welcome on <strong><span class="color">Spirit8</span></strong></h1>
            <p class="lead">We are a digital agency with <strong>years of experience</strong> and with <strong>extraordinary people</strong></p>

        </div>
    </div>
</div>

</body>
</html>