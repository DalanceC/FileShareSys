<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/6
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>FileUpload</title>
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
    <script>
        $(function () {
            if (${sessionScope.loginMemberInfo==null}) {
                alert("用户未登录，无法上传!")
            }
        });
    </script>
</head>
<body>
    <div class="container">
        <div>
            <h1 style="text-align: center">文件上传 </h1>
        </div>

        <div>
            <form class="form-horizontal" action="${SourcePath}/fileUpload" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-2 control-label">上传文件名</label>
                    <div class="col-sm-10">
                        <input type="file" name="fileName" id="fileIsChoose" style="margin-top: 7px">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">文件描述</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="description"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <c:if test="${!empty sessionScope.loginMemberInfo}">
                            <button type="submit" class="btn btn-default" id="uploadBtn">
                                <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>&nbsp;上传
                            </button>
                        </c:if>
                        <c:if test="${empty sessionScope.loginMemberInfo}">
                            <button type="button" class="btn btn-default">
                                <span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span>&nbsp;上传
                            </button>
                        </c:if>
                    </div>
                </div>
            </form>
        </div>

        <div>
            <%--${requestScope.result}--%>
            <%--<c:set var="resultDD" value="${requestScope.result}"></c:set>--%>
            <%--不知道怎么搞了！--%>
        </div>
    </div>

    <script type="text/javascript">
        $("#uploadBtn").click(function () {
            var ctx = "${requestScope.result}";
            if (ctx==""){
                alert("文件上传成功！");
            } else {
                alert(ctx);
            }
        });


    </script>
</body>
</html>
