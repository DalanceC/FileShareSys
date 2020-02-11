<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/6
  Time: 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
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
</head>
<body>
    <div class="container">
        <div>
            <h1 style="text-align: center">用户注册</h1>
        </div>
        <div style="padding-top: 26px">
            <form class="form-horizontal" method="post" action="${SourcePath}/memberRegister" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-4 control-label">用户名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="memberName" id="memberNameInput" placeholder="MemberName">
                        <label style="color: red" id="checkMemberName"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">密码</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" name="memberPassword" placeholder="Password">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">真实姓名</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" name="trueName" placeholder="TrueName">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">性别</label>
                    <div class="col-sm-6">
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="gender1_add_input" value="男" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="sex" id="gender2_add_input" value="女"> 女
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">邮箱</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" name="email" placeholder="Email">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">头像</label>
                    <div class="col-sm-6">
                        <input type="file" name="headImg" style="margin-top: 7px">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-8 col-sm-4">
                        <button type="submit" class="btn btn-default">注册</button>
                        <button type="button" class="btn btn-default" id="backBtn" style="margin-left: 30px">返回</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        $("#backBtn").click(function () {
            window.location.href="${SourcePath}/page/front/mainPage.jsp";
        });

        $("#memberNameInput").change(function () {
            var memberName = $("#memberNameInput").val();
            $.ajax({
                url:"${SourcePath}/checkMemberName",
                data:{"inputMemberName":memberName},
                type:"POST",
                success:function (rel) {
                    $("#checkMemberName").html(rel);
                }
            });
        });
    </script>
</body>
</html>
