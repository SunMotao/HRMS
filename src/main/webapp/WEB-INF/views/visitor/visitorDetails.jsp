<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>VisitorDetails</title>
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

        var mydata;
        $(document).ready(function () {
            $.ajax({
                url:"baseInfo/queryVisitorBaseInfo.do",
                dataType:"json",
                success:function (data) {
                    mydata=data;
                    showData();
                }
            })
        })
        function showData() {
            $("#vName").val(mydata.realName);
            $("#vSex").val(mydata.sex);
            $("#vAge").val(mydata.age);
            $("#vNation").val(mydata.nation);
            $("#vFamliy").val(mydata.family);
            $("#vAddress").val(mydata.address);
            $("#vCard").val(mydata.identityCard);
        }
    </script>
    <style>
        #alert {
            position: absolute;
            z-index: 1100;
            width: 100%;
        }

        td {
            text-align: center;
            border: 1px solid #ff5b5f;
        }

        input {
            border: 0px;
        }

        caption {
            border: 1px solid #ff5b5f;
        }
    </style>
</head>
<body>
<jsp:include page="visitorTop.jsp"></jsp:include>

<div id="alert">
    <c:if test="${info!=null}">
        <div class="alert alert-danger">
            <c:out value="${info}"></c:out>
        </div>
    </c:if>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="/baseInfo/baseInfo.view">
                <table class="table">
                    <caption style="text-align: center; font-size: 30px ">基本信息</caption>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name="realName" id="vName"></td>
                        <td>出生日期</td>
                        <td><input type="date" name="age" id="vAge"></td>
                        <td>性别</td>
                        <td>
                            <select name="sex" id="vSex">
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </td>
                        <td colspan="3" rowspan="3"><input type="file" name="photo"></td>
                    </tr>
                    <tr>
                        <td>民族</td>
                        <td><input type="text" name="nation" id="vNation"></td>
                        <td>户籍</td>
                        <td><input type="text" name="family" id="vFamily"></td>
                        <td>现居住地</td>
                        <td><input type="text" name="address" id="vAddress"></td>
                    </tr>
                    <tr>
                        <td>身份证号</td>
                        <td colspan="5"><input type="text" name="identityCard" id="vCard"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="reset" value="重置" class="btn btn-warning"></td>
                        <td colspan="7"><input type="submit" value="保存" class="btn btn-danger"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>
</body>
</html>