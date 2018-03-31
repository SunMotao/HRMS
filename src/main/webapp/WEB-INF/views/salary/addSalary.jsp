<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>AddSalary</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script>
        var employeeId;
        function obtainEmployeeId(emplId) {
            employeeId=emplId;
            $.getJSON({
                url:"salary/queryEmployeeBaseSalary.do",
                data:{"employeeId":employeeId},
                success:function (data) {
                    $("#bSalary").val(data.baseSalary);
                    $("#fivePayment").val(-data.baseSalary*0.18);

                }
            })
        }

    </script>


</head>
<body>
<jsp:include page="../admin/adminTop.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-md-12" id="content">
            <form action="/salary/addSalary.do" name="form1">

                <table class="table table-bordered">
                    <tr class="h4">
                        <td colspan="2">
                            添加薪资信息
                        </td>
                    </tr>
                    <tr>
                        <td>员工ID</td>
                        <td><input type="text" name="employeeId" onblur="obtainEmployeeId(this.value)"></td>
                        <td>出勤天数</td>
                        <td><input type="number" name="attendanceDays" id="attDays" onblur="obtainAttenanceDays()"></td>
                        <td>基本薪资</td>
                        <td><input type="text" name="baseSalary" id="bSalary"></td>
                    </tr>
                    <tr>
                        <td>五险一金</td>
                        <td><input type="text" name="fiveInsurancePayment" id="fivePayment"></td>
                        <td>奖惩金额</td>
                        <td><input type="text" name="rewardsMoney" id="rMoney"></td>
                        <td>总薪资</td>
                        <td><input type="text" name="totalSalary" id="tSalary"></td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="5"><textarea rows="5" cols="80" name="salaryInfo" id="sInfo"></textarea></td>
                    </tr>

                    <tr>
                        <td >重置</td>
                        <td colspan="2"><input type="reset" value="重置"></td>
                        <td >提交</td>
                        <td colspan="2"><input type="submit" value="提交"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>