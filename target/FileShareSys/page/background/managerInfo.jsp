<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/3
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>managerInfo</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-image: url("${SourcePath}/static/pic/background.jpg");
            background-size: cover;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
    <div class="container">
        <%--显示标题--%>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h1 style="text-align: center">Manager
                    <small>信息</small>
                </h1>
            </div>
        </div>
        <div class="col-sm-offset-4 col-sm-5">
            <table class="table table-bordered" style="margin-top: 40px">
                <thead>
                <tr>
                    <td>字段</td>
                    <td>内容</td>
                </tr>
                </thead>
                <tbody>

                <%--<tr>--%>
                    <%--<td>头像</td>--%>
                    <%--<td>--%>
                        <%--<img src="${SourcePath}/${sessionScope.loginManagerInfo.headImg}" style="width: 30px;height: 30px" class="img-circle">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <tr>
                    <td>编号</td>
                    <td>${sessionScope.loginManagerInfo.managerId}</td>
                </tr>
                <tr>
                    <td>用户名</td>
                    <td>${sessionScope.loginManagerInfo.managerName}</td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td>${sessionScope.loginManagerInfo.email}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-sm-12">
            <!-- Contextual button for informational alert messages -->
            <button type="button" class="btn btn-info" id="editManagerInfo" style="margin-left: 728px">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改信息
            </button>
        </div>
    </div>

    <!-- 修改信息模态框 -->
    <div class="modal fade" id="editManagerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">${sessionScope.loginManagerInfo.managerId}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">${sessionScope.loginManagerInfo.managerName}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="managerPassword" value="${sessionScope.loginManagerInfo.managerPassword}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" value="${sessionScope.loginManagerInfo.email}">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="managerEditBtn">修改</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $("#editManagerInfo").click(function () {
            $("#editManagerModel").modal({
                backdrop:'static'
            });
        });

        $("#managerEditBtn").click(function () {
            $.ajax({
                url: "${SourcePath}/managerEdit/"+${sessionScope.loginManagerInfo.id},
                type: "PUT",
                data: $("#editManagerModel form").serialize(),
                success:function (result) {
                    $("#editManagerModel").modal("hide");
                    alert(result.message);
                    toPage();
                }

            });
        });

        function toPage() {
            top.window.location.href="${SourcePath}/page/background/managerLogin.jsp";
        //    需要关闭当前的界面，未实现
        }

    </script>
</body>
</html>
