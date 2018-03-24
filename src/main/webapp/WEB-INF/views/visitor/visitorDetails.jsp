<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <style>
        #elert{
            position: absolute;
            z-index: 1001;
            width: 100%;
        }
        td{
            text-align: center;
            border: 1px solid #ff5b5f;
        }
        input{
            border: 0px;
        }
        caption{
            border: 1px solid #ff5b5f;
        }
    </style>
</head>
<body>
<div id="elert">
    <c:if test="${requestScope.info!=null}">
        <c:choose>
            <c:when test="${requestScope.info eq '添加成功'}">
                <div class="alert alert-success">
                    <c:out value="${requestScope.info}"></c:out>
                </div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning">
                    <c:out value="${requestScope.info}"></c:out>
                </div>
            </c:otherwise>
        </c:choose>
    </c:if>
</div>

<jsp:include page="visitorTop.jsp"></jsp:include>

<div class="container">
    <div class="row" >
        <form action="/baseInfo/baseInfo.view">
            <table class="table">
                <caption style="text-align: center; font-size: 30px ">基本信息</caption>
                <tr>
                    <td>姓名</td>
                    <td><input type="text" name="realName"></td>
                    <td>出生日期</td>
                    <td><input type="date" name="age"></td>
                    <td>性别</td>
                    <td>
                        <select name="sex">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </td>
                    <td colspan="3" rowspan="3"><input type="file" name="photo"></td>
                </tr>
                <tr>
                    <td>民族</td>
                    <td ><input type="text" name="nation"></td>
                    <td>户籍</td>
                    <td ><input type="text" name="family"></td>
                    <td>现居住地</td>
                    <td ><input type="text" name="address"></td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td colspan="5"><input type="text" name="identityCard"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="reset" value="重置" class="btn btn-warning"></td>
                    <td colspan="7"><input type="submit" value="保存" class="btn btn-danger"></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>