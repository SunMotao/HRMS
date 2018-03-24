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
    <%--<script src="/scripts/alert.js"></script>--%>
    <%--<script type="text/javascript">--%>
        <%--window.onload=function () {--%>
            <%--var a= document.getElementById("alert");--%>
            <%--hideAlert(a);--%>
        <%--}--%>
    <%--</script>--%>

</head>
<body>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">新人新事</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
                <li><a href="#">功能介绍</a></li>
                <li><a href="#">关于我们</a></li>
                <li>
                    <a href="/visitorIndex.do">
                        <button class="register btn" type="button">注册</button>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</div>
<%--<div id="alert">--%>
    <%--<c:if test="${info!=null}">--%>
        <%--<div class="alert alert-danger">--%>
            <%--<c:out value="${info}"></c:out>--%>
        <%--</div>--%>
    <%--</c:if>--%>
<%--</div>--%>

<form action="/visitor/login.view">
    用户名：<input type="text" name="visitorName" required><br/>
    密码：<input type="password" name="visitorPassword" required><br/>
    请记住我：<input type="checkbox" value="on" name="isRemember">
    <input type="submit" value="登录">
</form>
</body>
</html>