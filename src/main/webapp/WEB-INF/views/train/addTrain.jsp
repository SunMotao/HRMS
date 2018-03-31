<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>AddTrain</title>
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
        var mydata
        $(document).ready(function () {
            $.ajax({
                url:"train/obtainTrainNews.do",
                dataType:"json",
                success:function (data) {
                    console.log("111"+data);
                    mydata=data;
                    showData();
                }
            })
        })
        function showData() {
            $("#inId").val(mydata.infoId);
            $("#tTitle").val(mydata.trainTitle);
            $("#tContent").val(mydata.trainContent);
            $("#tTime").val(mydata.trainTime);
            $("#tPeople").val(mydata.trainPeople);
            $("#tAddress").val(mydata.trainAddress);
        }
    </script>
    <style>
        #alert {
            position: absolute;
            z-index: 1100;
            width: 100%;
        }
    </style>
</head>
<body>
<jsp:include page="../admin/adminTop.jsp"></jsp:include>
<div id="alert">
    <c:if test="${info!=null}">
        <div class="alert alert-danger">
            <c:out value="${info}"></c:out>
        </div>
    </c:if>
</div>
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
                        <td>输入相关ID</td>
                        <td><input type="text" name="infoId" id="inId"></td>
                    </tr>
                    <tr>
                        <td>培训主题</td>
                        <td><input type="text" name="trainTitle" id="tTitle"></td>
                        <td>培训对象</td>
                        <td><input type="text" name="trainPeople" id="tPeople"></td>
                    </tr>
                    <tr>
                        <td>培训地址</td>
                        <td><input type="text" name="trainAddress" id="tAddress"></td>
                        <td>培训时间</td>
                        <td><input type="date" name="trainTime" id="tTime"></td>
                    </tr>
                    <tr>
                        <td>培训内容</td>
                        <td colspan="3"><textarea rows="10" cols="120" name="trainContent" id="tContent"></textarea></td>
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