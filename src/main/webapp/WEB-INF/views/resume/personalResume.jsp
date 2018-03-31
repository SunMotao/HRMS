<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>Resume</title>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <link href="/styles/col-12.css" rel="stylesheet">
    <script src="/scripts/bootstrap.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet">
    <script src="/scripts/prefixfree.min.js"></script>
    <script>
        $(document).ready(function () {
            var resumeName=${resume.resumeName};


            $("#rName").innerHTML("resumeName");
            $("#realName").innerHTML("${resume.realName}");
            $("#rAge").html(${resume.age});
            $("#rsex").val(${resume.sex});
            $("#remail").val(${resume.email});
            $("#rPhone").val(${resume.phone});
            $("#rSalary").val(${resume.salaryException});
            $("#rJob").val(${resume.jobCategory});
            $("#rStatus").val(${resume.seekingStatus});
            $("#rEdu").val(${resume.educationBackground});
            $("#rCard").val(${resume.idCard});
            $("#rExp").val(${resume.jobExperience});
            $("#rEvalu").val(${resume.evaluation});
        })
    </script>
</head>

<body>
<jsp:include page="../visitor/visitorTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form action="resume/addResume.do">
                <table class="table  table-bordered">
                    <caption>个人简历</caption>
                    <tr>
                        <td>简历名称</td>
                        <td><input type="text" name="resumeName" id="rName"></td>
                    </tr>
                    <tr>
                        <td>姓名</td>
                        <td><input type="text" name="realName" id="realName"></td>
                        <td>年龄</td>
                        <td><input type="text" name="age" id="rAge"></td>
                        <td>性别</td>
                        <td>
                            <select name="sex" id="rSex">
                                <option>男</option>
                                <option>女</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>邮箱</td>
                        <td><input type="email" name="email" id="rEmail"></td>
                        <td>手机号</td>
                        <td><input type="text" name="phone" id="rPhone"></td>
                    </tr>
                    <tr>
                        <td>期望薪资</td>
                        <td><input type="text" name="salaryException" id="rSalary"></td>
                        <td>工作性质</td>
                        <td><select name="jobCategory" id="rJob">
                            <option>全职</option>
                            <option>兼职</option>
                        </select></td>
                        <td>目前状态</td>
                        <td><select name="seekingStatus" id="rStatus">
                            <option>在职</option>
                            <option>离职</option>
                        </select></td>
                    </tr>

                    <tr>
                        <td>学历</td>
                        <td><input type="text" name="educationBackground" id="rEdu"></td>
                        <td>身份证号</td>
                        <td><input type="text" name="idCard" id="rCard"></td>
                    </tr>
                    <tr>
                        <td>工作经验</td>
                        <td colspan="8">
                            <textarea rows="10" cols="120" name="jobExperience" id="rExp"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>自我评估</td>
                        <td colspan="8">
                            <textarea rows="10" cols="120" name="evaluation" id="rEvalu"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2"><input type="reset" value="重置简历" class="btn  btn-warning"></td>
                        <td colspan="7"><input type="submit" value="保存简历" class="btn btn-primary"></td>
                    </tr>

                </table>

            </form>
        </div>
    </div>
</div>
</body>
</html>