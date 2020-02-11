<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/3
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Login</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
            background-image: url("${SourcePath}/static/pic/01.jpg");
            background-size: cover;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="${SourcePath}/static/myCss/myLogin.css">
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="box">
        <h2>管理员登录</h2>
        <form method="post" action="${pageContext.request.contextPath}/managerLogin">
            <div class="inputBox">
                <input type="text" name="managerName" required="">
                <label>用户名</label>
            </div>
            <div class="inputBox">
                <input type="password" name="managerPassword" required="">
                <label>密码</label>
            </div>
            <%--<input type="submit" value="Submit" name="">--%>
            <button type="submit" id="btn_login">
                登录
            </button>
            <button type="reset">
                重置
            </button>
        </form>
    </div>

    <%--<h1 style="text-align: center">管理员登录</h1>--%>
    <%--<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/managerLogin">--%>
        <%--<div class="form-group">--%>
            <%--<label class="col-sm-4 control-label">ManagerName</label>--%>
            <%--<div class="col-sm-6">--%>
                <%--<input type="text" class="form-control" name="managerName" placeholder="ManagerName">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<label class="col-sm-4 control-label">Password</label>--%>
            <%--<div class="col-sm-6">--%>
                <%--<input type="password" class="form-control" name="managerPassword" placeholder="Password">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
            <%--<div class="col-sm-offset-5 col-sm-7">--%>
                <%--<button type="submit" class="btn btn-default" id="btn_login">Login</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <%--<button type="reset" class="btn btn-default">Reset</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</form>--%>

</body>
</html>
