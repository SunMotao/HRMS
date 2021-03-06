<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">

    <title>VisitorIndex</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        function sendResume(visitorId) {
            var resumeId=prompt("请输入要投的简历ID","");
            $.ajax({
                url: "apply/jobApply.do",
                data: {"visitorId": visitorId,"id":resumeId},
                success: function (data) {
                    console.log(data);
                    alert(data);
                }
            })
        }
    </script>
</head>
<body>
<jsp:include page="visitorTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <table class="table table-bordered">
                <tr>
                    <td>招聘信息</td>
                </tr>
                <tr class="success">
                    <th>部门</th>
                    <th>职位类型</th>
                    <th>招聘形式</th>
                    <th>工作地点</th>
                    <th>雇佣人数</th>
                    <th>薪资</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${recruitments}" var="recruitment">
                    <tr>
                        <td><c:out value="${recruitment.departmentName}"></c:out></td>
                        <td><c:out value="${recruitment.positionTypeName}"></c:out></td>
                        <td><c:out value="${recruitment.employeeForm}"></c:out></td>
                        <td><c:out value="${recruitment.jobAddress}"></c:out></td>
                        <td><c:out value="${recruitment.hireNum}"></c:out></td>
                        <td><c:out value="${recruitment.salaryRange}"></c:out></td>
                        <td>
                            <button class="btn btn-primary" onclick="sendResume(${sessionScope.visitor.id})">投递简历
                            </button>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>


</body>
</html>