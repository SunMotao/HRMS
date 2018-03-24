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
    <script src="/scripts/ajax.js"></script>
    <script>
        var madata;
        function pass(applyId,visitorId) {
            var applyAddress=prompt("请输入面试地点","航天大厦");
            var applyDate=prompt("请输入面试时间","0");
            var applyInfo=prompt("请输入面试信息","0");
            ajax("get","apply/applyPass.do",{"id":applyId,"visitorId":visitorId,
                            "applyAddress":applyAddress,"applyDate":applyDate,"applyInfo":applyInfo},true,function (data,readyState,status) {
                if(readyState==4&&status==200){
                    madata=data;
                }
            });
        }
        function waive(applyId,visitorId) {
            ajax("get","apply/applyWaive.do",{"id":applyId,"visitorId":visitorId},true,function (data,readyState,status) {
                if(readyState==4&&status==200){
                    madata=data;
                }
            });
        }
    </script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        投递简历列表
                    </td>

                </tr>
                <tr class="success">
                    <th>id</th>
                    <th>用户ID</th>
                    <th>简历ID</th>
                    <th>求职状态</th>
                    <th>添加时间</th>
                    <th>修改时间</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${applies}" var="apply">
                    <tr>
                        <td><c:out value="${apply.id}"></c:out></td>
                        <td><c:out value="${apply.visitorId}"></c:out></td>
                        <td><c:out value="${apply.resumeId}"></c:out></td>
                        <td><c:out value="${apply.applyStatus}"></c:out></td>
                        <td><c:out value="${apply.applyCreateTime}"></c:out></td>
                        <td><c:out value="${apply.applyModifiedTime}"></c:out></td>
                        <td><button class="btn  btn-danger" onclick="pass(${apply.id},${apply.visitorId})">面试邀请</button></td>
                        <td><button class="btn btn-primary" onclick="waive(${apply.id},${apply.visitorId})">放弃</button></td>
                    </tr>
                </c:forEach>

            </table>

        </div>
    </div>
</div>


</body>
</html>