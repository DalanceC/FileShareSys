<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/13
  Time: 9:13
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
</head>
<body>
    <div class="box">
        <h2>Login</h2>
        <form>
            <div class="inputBox">
                <input type="text" name="" required="">
                <label>UserName</label>
            </div>
            <div class="inputBox">
                <input type="password" name="" required="">
                <label>Password</label>
            </div>
            <%--<input type="submit" value="Submit" name="">--%>
            <button type="submit">
                Submit
            </button>
        </form>
    </div>
</body>
</html>
