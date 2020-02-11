<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/12
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demo</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${SourcePath}/static/myCss/myCss.css">
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
</head>
<body>
    <div class="sidebar">
        <ul>
            <li><a class="glyphicon glyphicon-plus" href="#"></a></li>
            <li><a class="glyphicon glyphicon-search" href="#"></a></li>
            <li><a class="glyphicon glyphicon-user" href="#"></a></li>
        </ul>
    </div>


</body>
</html>
