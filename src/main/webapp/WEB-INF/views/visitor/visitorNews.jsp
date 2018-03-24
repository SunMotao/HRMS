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
        var mydate;
//        function seeDetail(visitorNewsId) {
//            ajax("get","visitorNews/seeVisitorApply.do",{"visitorNewsId":visitorNewsId},true,function(data,readyState,status){
//                if(readyState==4&&status==200){
//                    mydate=data;
//                    console.log(mydate);
//                    mydate=json.parse(mydate);
//                    console.log(mydate);
//                    showDetail();
//
//                }
//            });
//        }
        function seeDetail(visitorNewsId) {
            $.ajax({
                url:"visitorNews/seeVisitorApply.do?visitorNewsId="+visitorNewsId+"",
                type: "post",
                async: true,
                timeout: 5000,
                dataType: "json",

                success: function (data, textStatus) {
                    mydate=data;
                    console.log(data);
                    console.log(textStatus);
                    showDetail();
                }
            })
        }

        function showDetail() {
            var  c="<table class='table table-bordered'> " +
                    "<caption >信息详情</caption> " +
                    "<tr class='success'> " +
                    "<th>简历ID</th> " +
                    "<th>面试地点</th> " +
                    "<th>面试时间</th> " +
                    "<th>面试消息</th>" +
                    "</tr>"
            c+="<tr>"
            c+="<td>"+mydate.resumeId+"</td>"
            c+="<td>"+mydate.applyAddress+"</td>"
            c+="<td>"+mydate.applyDate+"</td>"
            c+="<td>"+mydate.applyInfo+"</td>"
            c+="</tr>"
            var conn=document.getElementById("content");
            conn.innerHTML=c;
        }
    </script>
</head>
<body>

<div id="content">
    <table class="table table-bordered">
        <tr>
            <td>消息列表</td>
        </tr>
        <tr class="success">
            <th>id</th>
            <th>用户ID</th>
            <th>消息主题</th>
            <th>消息内容</th>
            <th>消息状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${visitorNewses}" var="visitorNews">
            <tr>
                <td><c:out value="${visitorNews.id}"></c:out></td>
                <td><c:out value="${visitorNews.visitorId}"></c:out></td>
                <td><c:out value="${visitorNews.visitorNewsTitle}"></c:out></td>
                <td><c:out value="${visitorNews.visitorNewsContent}"></c:out></td>
                <td><c:out value="${visitorNews.visitorNewsStatus}"></c:out></td>
                <td><button class="btn btn-primary" onclick="seeDetail(${visitorNews.id})">详情</button></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>