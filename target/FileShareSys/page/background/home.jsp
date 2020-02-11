<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/3
  Time: 2:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
    <frameset rows="11%,*" border="1px">
        <frame src="${pageContext.request.contextPath}/page/background/top.jsp" noresize="false">
        <frameset cols="95px,*">
            <frame src="${pageContext.request.contextPath}/page/background/left.jsp" noresize="false">
            <frame name="content">
        </frameset>
    </frameset>
</html>
