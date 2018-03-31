<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/"; %>
<html>
<head>
    <base href="<%= basePath%>">
    <title>AddRecruitment</title>
    <link href="/styles/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="/scripts/bootstrap.min.js"></script>
    <script src="/scripts/jquery-3.3.1.min.js"></script>
    <link href="/styles/sidebar.css" rel="stylesheet" type="text/css">
    <script src="/scripts/prefixfree.min.js"></script>
    <link href="/styles/col-12.css" rel="stylesheet">
    <script src="/scripts/alert.js"></script>
    <script>
        var deptArray;
        var selectDept;
        var selectPos;
        var posArray;
        window.onload=function () {
            var a= document.getElementById("alert");
            hideAlert(a);
            selectDept=document.getElementById("dept_id");
            selectPos=document.getElementById("pos_id");
        }

        $(document).ready(function () {
            $.ajax({
                url: "department/obtainDpartment.do",
                type: "post",
                async: true,
                timeout: 5000,
                dataType: "json",

                success: function (data, textStatus) {
                    deptArray=data;
//                    console.log(data);
//                    console.log(textStatus);
                    adddept();
                }
            });
        });

        function adddept() {
            selectDept.length=deptArray.length;
            console.log( selectDept.length);
            for(var i=0;i<deptArray.length;i++){
                selectDept.options[i].value=deptArray[i].departmentName;
                selectDept.options[i].text=deptArray[i].departmentName;
            }
            addpos(0);
        }

        function addpos(index){

            posArray =  deptArray[index].positionTypeList;
            selectPos.length=posArray.length;
            for(var i=0;i<posArray.length; i++){
                selectPos.options[i].value=posArray[i].positionTypeName;
                selectPos.options[i].text=posArray[i].positionTypeName;
            }
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
            <form action="/recruitment/addRecruitment.do" name="form1">

            <table class="table table-bordered">
                <tr class="h4">
                    <td colspan="2">
                        招聘信息
                    </td>
                </tr>
                <tr>
                    <td>申请部门</td>
                    <td><select name="departmentName" id="dept_id" onchange="addpos(this.selectedIndex)">
                        <option value="-1">选择部门</option>
                    </select></td>
                    <td>申请职位</td>
                    <td><select name="positionTypeName" id="pos_id">
                        <option value="-1">职位类型</option>
                    </select></td>

                </tr>
                <tr>
                    <td>招聘形式</td>
                    <td><input type="text" name="employeeForm"></td>
                    <td>薪资</td>
                    <td><input type="text" name="salaryRange"></td>
                </tr>
                <tr>
                    <td>工作地址</td>
                    <td><input type="text" name="jobAddress"></td>
                    <td>招聘人数</td>
                    <td><input type="text" name="hireNum"></td>
                </tr>
                <tr>
                    <td>重置</td>
                    <td><input type="reset" value="重置"></td>
                    <td>提交</td>
                    <td><input type="submit" value="提交"></td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>