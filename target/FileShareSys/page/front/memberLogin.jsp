<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/2
  Time: 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${SourcePath}/static/myCss/myLogin.css">
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-image: url("${SourcePath}/static/pic/01.jpg");
            background-size: cover;
        }
    </style>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
        <%--选择以往的提示名会把框子变丑！--%>

    <div class="box">
        <h2>用户登录</h2>
        <form method="post" action="${pageContext.request.contextPath}/memberLogin">
            <div class="inputBox">
                <input type="text" name="memberName" required="">
                <label>用户名</label>
            </div>
            <div class="inputBox">
                <input type="password" name="memberPassword" required="">
                <label>密码</label>
            </div>
            <%--<input type="submit" value="Submit" name="">--%>
            <button type="submit" id="btn_login">
                登录
            </button>
            <button type="button" id="btn_register">
                注册
            </button>
        </form>
    </div>

    <%--<h1 style="text-align: center">用户登录</h1>--%>
    <%--<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/memberLogin">--%>
        <%--<div class="form-group">--%>
            <%--<label class="col-sm-4 control-label">MemberName</label>--%>
            <%--<div class="col-sm-6">--%>
                <%--<input type="text" class="form-control" name="memberName" placeholder="ManagerName">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label class="col-sm-4 control-label">Password</label>--%>
            <%--<div class="col-sm-6">--%>
                <%--<input type="password" class="form-control" name="memberPassword" placeholder="Password">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<div class="col-sm-offset-5 col-sm-7">--%>
                <%--<button type="submit" class="btn btn-default" id="btn_login">登录</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <%--<button type="button" class="btn btn-default" id="btn_register">注册</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</form>--%>

    <script>
        $("#btn_register").click(function () {
            window.location.href="${SourcePath}/page/front/memberRegister.jsp";
        });
    </script>
</body>
</html>
