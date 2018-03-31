<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>用户注册</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <script src="/scripts/ajax.js"></script>
    <script>
        var madate;
        var vName="";
        var vPassword="";
        var vConfirmPassword="";
        var vEmail="";
        var vPhone="";
        function validateName(visitorName) {
            var v_name = document.getElementById("v_name");
            vName = visitorName;
            var reg = /^[0-9a-z_-]{3,12}$/;
            if (visitorName == undefined || !reg.test(visitorName)) {
                v_name.innerHTML = "请输入3-12个数字、字符和下划线组成的用户名";
                return false;
            } else {
                ajax("get", "visitor/checkName.do", {"visitorName": visitorName}, true, function (data, readyState, status) {
                    if (readyState == 4 && status == 200) {
                        mydate = data;
                        showCheckName();
                    }
                });
            }
        }
        function showCheckName(){
            if(mydate=="isExisted"){
                v_name.innerHTML="该用户已被注册";
                return  false;
            }
            if(mydate=="notExisted"){
                v_name.innerHTML="该用户名可用";
                return  true;
            }
        }

        function validatePassword(visitorPassword) {
            var v_password=document.getElementById("v_password");
            vPassword=visitorPassword;
            var reg=/^[a-z0-9_-]{6,18}$/;
            if(visitorPassword==undefined||!reg.test(visitorPassword)){
                v_password.innerHTML="请输入由6-18个数字、字符和下划线组成的密码";
                return false;
            }else{
                v_password.innerHTML="pass";
                return true;
            }
        }

        function confirmPassword(nextPassword) {
            var v_confirmPassword=document.getElementById("v_confirmPassword");
            var password=document.form1.visitorPassword.value;
            vConfirmPassword=nextPassword;
            if(nextPassword==undefined||nextPassword!=password){
                v_confirmPassword.innerHTML="密码错误";
                return false;
            }else{
                v_confirmPassword.innerHTML="pass";
                return true;
            }
        }

        function validateEmail(visitorEmail) {
            var v_email=document.getElementById("v_email");
            vEmail=visitorEmail;
            var reg=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(visitorEmail==undefined||!reg.test(visitorEmail)){
                v_email.innerHTML="邮箱格式错误";
                return false;
            }else{
                v_email.innerHTML="pass";
                return true;
            }
        }

        function validatePhone(visitorPhone) {
            var v_phone=document.getElementById("v_phone");
            vPhone=visitorPhone;
            var reg=/^1?[35678]{1}?[0-9]{9}$/;
            if(visitorPhone==undefined||!reg.test(visitorPhone)){
                v_phone.innerHTML="请输入正确的手机号";
                return false;
            }else{
                v_phone.innerHTML="pass";
                return true;
            }
        }

        function check() {
            return validateName(vName)&&validatePassword(vPassword)&&confirmPassword(vConfirmPassword)
                    &&validateEmail(vEmail)&&validatePhone(vPhone);
        }
    </script>
</head>

<body>
<div>
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
                    <a href="/visitor/register.do">
                        <button class="register btn" type="button">登录</button>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="alert"></div>
    <div class="row">
        <form class="form-horizontal" action="/visitor/register.view" method="post" name="form1" onsubmit="return check()">
            <div class="form-group">
                <label class="col-sm-2 control-label ">账户</label>
                <div class="col-sm-6">
                    <input type="text" name="visitorName" class="form-control" placeholder="请输入账户" onblur="validateName(this.value)">
                </div>
                <span class="col-sm-4" id="v_name"></span>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label ">密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="visitorPassword" placeholder="请输入密码" onblur="validatePassword(this.value)">
                </div>
                <span class="col-sm-4" id="v_password"></span>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label ">确认密码</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="next_visitorPassword" placeholder="请再次输入密码" onblur="confirmPassword(this.value)">
                </div>
                <span class="col-sm-4" id="v_confirmPassword"></span>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label ">邮箱</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" name="visitorEmail" placeholder="请输入邮箱" onblur="validateEmail(this.value)">
                </div>
                <span class="col-sm-4" id="v_email"></span>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label ">手机号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="visitorPhone" placeholder="请输入手机号" onblur="validatePhone(this.value)">
                </div>
                <span class="col-sm-4" id="v_phone"></span>
            </div>

            <div class="form-grop">
                <div class="col-sm-offset-2 col-sm-6">
                    <button type="submit" class="btn btn-primary btn-block btn-lg">注册</button>
                </div>
            </div>
        </form>
    </div>
    </div>
</div>
</body>
</html>