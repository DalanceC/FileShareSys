<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>TOP</title>
    <%
        pageContext.setAttribute("SourcePath", request.getContextPath());
    %>
    <link rel="stylesheet" type="text/css" href="${SourcePath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="${SourcePath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body style="background: #7572f4">
    <div>
        <div class="col-sm-9">
            <h2 style="margin-left: 10px;color: white">后 台 管 理 系 统</h2>
        </div>
        <div class="col-sm-3">
            <c:if test="${empty sessionScope.loginManagerInfo}">
                <h4>
                    <a href="#" id="loginLink" style="text-decoration: none;color: white">
                        登录
                    </a>
                </h4>
            </c:if>
            <c:if test="${!empty sessionScope.loginManagerInfo}">

                <h4 style="color: white;margin-top: 26px">
                    <img src="${SourcePath}/${sessionScope.loginManagerInfo.headImg}" style="width: 30px;height: 30px" class="img-circle">
                    欢迎你，${sessionScope.loginManagerInfo.managerName}&nbsp;&nbsp;&nbsp;&nbsp;
                    <small>
                        <a href="#" id="exitLink">
                            <font color="white">退出</font>
                        </a>
                    </small>
                </h4>
            </c:if>
        </div>
    </div>

    <script>
        $("#exitLink").click(function () {
            var result = confirm("确认退出?");
            if (result){
                top.window.location.href="${SourcePath}/page/background/managerLogin.jsp";
            }
        });

        $("#loginLink").click(function () {
            top.window.location.href="${SourcePath}/page/background/managerLogin.jsp";
        });
    </script>

</body>
</html>
