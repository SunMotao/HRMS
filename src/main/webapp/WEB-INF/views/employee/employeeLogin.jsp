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
    <script src="/scripts/alert.js"></script>
    <script type="text/javascript">
        window.onload=function () {
            var a= document.getElementById("alert");
            hideAlert(a);
        }
    </script>
    <style>
        body{
            background-image: url("images/starsky.jpg");
            background-repeat:no-repeat ;

            background-size:100% 100%;

            background-attachment: fixed
        }
        #alert{
            position: absolute;
            z-index: 1001;
            width: 100%;
            text-align: center;
        }
        .bg1{
            height: 500px;
            width: 500px;
            border-radius:300px;
        }
        .reg{
            padding-bottom: 20px;
        }
    </style>
</head>
<body>

<div id="alert">
    <c:if test="${requestScope.info !=null}">
        <div class="alert alert-danger">
            <c:out value="${requestScope.info}"></c:out>
        </div>
    </c:if>
</div>
<div class="container">
    <div class="alert"></div>
    <div class="row">
        <div class="col-md-4">
            <img src="images/Taylor Swift.jpg" class="bg1">
        </div>
        <div class="col-md-8 right">

            <form class="form-horizontal" action="employee/employeeLogin.do" method="post">
                <div class="form-group">
                    <label class="col-sm-4 control-label ">账户</label>
                    <div class="col-sm-8">
                        <input type="text" name="employeeName" class="form-control" placeholder="请输入账户">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label ">密码</label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" name="employeePassword" placeholder="请输入密码">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <div class="checkbox col-sm-8">
                            <label>
                                <input type="checkbox" name="is_remember" >
                                <span class="reg">请记住我</span>
                            </label>
                        </div>
                    </div>
                </div>
                <br/>
                <br/>
                <div class="form-grop">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-primary btn-block btn-lg">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>