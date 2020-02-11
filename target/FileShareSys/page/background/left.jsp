<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/4
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>LEFT</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <link type="text/css" rel="stylesheet" href="${SourcePath}/static/myCss/myCss.css">
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <div>
        <c:if test="${empty sessionScope.loginManagerInfo}">
            <%--<a href="#" class="errorLink">--%>
                <%--<h4>个人信息</h4>--%>
            <%--</a>--%>
            <%--<a href="#" class="errorLink">--%>
                <%--<h4>用户管理</h4>--%>
            <%--</a>--%>
            <%--<a href="#" class="errorLink">--%>
                <%--<h4>文件管理</h4>--%>
            <%--</a>--%>

            <div class="sidebar">
                <ul>
                    <li><a class="glyphicon glyphicon-plus" href="#"></a></li>
                    <li><a class="glyphicon glyphicon-search" href="#"></a></li>
                    <li><a class="glyphicon glyphicon-user" href="#"></a></li>
                </ul>
            </div>

        </c:if>



        <c:if test="${!empty sessionScope.loginManagerInfo}">
            <%--<a href="${pageContext.request.contextPath}/page/background/managerInfo.jsp" target="content">--%>
                <%--<h4>个人信息</h4>--%>
            <%--</a>--%>
            <%--<a href="${pageContext.request.contextPath}/page/background/membersOperate.jsp" target="content">--%>
                <%--<h4>用户管理</h4>--%>
            <%--</a>--%>
            <%--<a href="${pageContext.request.contextPath}/page/background/fileSourcesOperate.jsp" target="content">--%>
                <%--<h4>文件管理</h4>--%>
            <%--</a>--%>

            <div class="sidebar">
                <ul>
                    <li><a class="glyphicon glyphicon-cog" href="${pageContext.request.contextPath}/page/background/managerInfo.jsp" target="content"></a></li>
                    <li><a class="glyphicon glyphicon-user" href="${pageContext.request.contextPath}/page/background/membersOperate.jsp" target="content"></a></li>
                    <li><a class="glyphicon glyphicon-folder-open" href="${pageContext.request.contextPath}/page/background/fileSourcesOperate.jsp" target="content"></a></li>
                </ul>
            </div>

        </c:if>
    </div>

    <script>
        $(".errorLink").click(function () {
            alert("请先登录!");
        });
    </script>
</body>
</html>
