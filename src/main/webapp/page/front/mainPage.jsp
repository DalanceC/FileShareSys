<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/5
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>mainPage</title>
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
        function memberExid() {
            var result = confirm("确认退出?");
            if (result){
                window.location.href="${SourcePath}/memberExit";
            }
        }
    </script>
</head>
<body>
    <!-- 修改信息模态框 -->
    <div class="modal fade" id="editMemberModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
                                <p class="form-control-static">${sessionScope.loginMemberInfo.memberId}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">${sessionScope.loginMemberInfo.memberName}</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">真实姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="trueName" value="${sessionScope.loginMemberInfo.trueName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="memberPassword" value="${sessionScope.loginMemberInfo.memberPassword}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <c:if test="${sessionScope.loginMemberInfo.sex=='男'}">
                                    <label class="radio-inline" id="sexLable">
                                        <input type="radio" name="sex" checked="checked" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" value="女"> 女
                                    </label>
                                </c:if>
                                <c:if test="${sessionScope.loginMemberInfo.sex=='女'}">
                                    <label class="radio-inline" id="sexLable">
                                        <input type="radio" name="sex" checked="checked" value="男"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" checked="checked" value="女"> 女
                                    </label>
                                </c:if>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" value="${sessionScope.loginMemberInfo.email}">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="memberEditBtn">修改</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 修改头像模态框 -->
    <div class="modal fade bs-example-modal-sm" id="editHeadImgModel" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <form method="post" action="${SourcePath}/editSelfHeadImg" enctype="multipart/form-data">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel2">修改头像</h4>
                    </div>
                    <div class="modal-body">
                        <label>选择头像:</label>
                        <input type="file" name="headImg" id="afterChooseImg">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li id="li1" class="active"><a href="#" style="margin-top: 5px">文件资源</a></li>
                        <%--<li id="li2"><a href="${SourcePath}/getSelfFileList">我的资源</a></li>--%>
                        <li id="li2"><a href="#" style="margin-top: 5px">我的资源</a></li>
                        <li id="li3"><a href="#" style="margin-top: 5px">我的资料</a></li>
                        <li id="li4"><a href="${SourcePath}/page/front/fileUpload.jsp" target="_blank" style="margin-top: 5px">文件上传</a></li>
                        <c:if test="${empty sessionScope.loginMemberInfo}">
                            <li><a style="margin-left: 800px;margin-top: 5px" href="${SourcePath}/page/front/memberLogin.jsp">登录</a></li>
                        </c:if>
                        <c:if test="${!empty sessionScope.loginMemberInfo}">
                            <li>
                                <a style="margin-left: 500px"><img src="${SourcePath}/${sessionScope.loginMemberInfo.headImg}" style="width: 30px;height: 30px" class="img-circle">
                                    欢迎你，${sessionScope.loginMemberInfo.memberName}</a>
                            </li>
                            <li>
                                <a href="#" style="margin-top: 5px" onclick="memberExid()">退出</a>
                            </li>
                        </c:if>
                    </ul>

                </div>
            </div>
        </nav>
    </div>

    <div class="container" id="main_content">

    </div>


    <script type="text/javascript" src="${SourcePath}/static/myJs/myJavaScript.js"></script>
    <script>

        /**
         * 显示自己信息
         */
        function showSelfInfo(){
            $("#main_content").empty();
            $("#main_content").append(
                $("<div class='container'></div>")
                    .append($("<div></div>")
                        .append($("<a href='#' style='margin-left: 500px'></a>")
                                .append($("<img src='${SourcePath}/${sessionScope.loginMemberInfo.headImg}' class='img-circle' id='headImgArea' style='width: 120px;height: 120px'>"))

                    ))
                    .append($("<div class='col-sm-6'></div>")
                        .append($("<table class='table table-hover' style='margin-left: 336px;margin-top: 30px'></table>")
                            .append($("<thead></thead>")
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("字段"))
                                    .append($("<td></td>").append("内容"))
                                )
                            )
                            .append($("<tbody></tbody>")
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("用户编号"))
                                    .append($("<td></td>").append("${sessionScope.loginMemberInfo.memberId}"))

                                )
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("用户名"))
                                    .append($("<td></td>").append("${sessionScope.loginMemberInfo.memberName}"))

                                )
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("真实姓名"))
                                    .append($("<td></td>").append("${sessionScope.loginMemberInfo.trueName}"))

                                )
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("性别"))
                                    .append($("<td></td>").append("${sessionScope.loginMemberInfo.sex}"))

                                )
                                .append($("<tr></tr>")
                                    .append($("<td></td>").append("邮箱"))
                                    .append($("<td></td>").append("${sessionScope.loginMemberInfo.email}"))

                                )
                            )
                        )
                    )
                    .append($("<div class='col-sm-offset-8 col-sm-4'></div>")
                        .append($("<button type='button' class='btn btn-default' style='margin-left: 5px' onclick='editSelfInfo()'></button>")
                            .append($("<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>"))
                            .append(" 编辑")
                        )
                    )
            );

            // 点击修改头像
            $("#headImgArea").click(function () {
                $("#editHeadImgModel").modal({
                    ackdrop:'static'
                });
            });

        }

        // 打开模态框
        function editSelfInfo() {
            $("#editMemberModel").modal({
                backdrop:'static'
            });

        }

        // 用户修改自己的信息
        $("#memberEditBtn").click(function () {
            $.ajax({
                url: "${SourcePath}/updateMember/"+${sessionScope.loginMemberInfo.id},
                type: "PUT",
                data: $("#editMemberModel form").serialize(),
                success:function (result) {
                    alert(result.message);
                    // 1.关闭修改模态框
                    $("#editMemberModel").modal("hide");
                    // 2.退出当前用户并跳转到登陆界面
                    window.location.href="${SourcePath}/memberExit";
                }
            });
        });

        // 文件下载
        $(document).on("click",".down_btn",function () {
            var result = confirm("确认下载?");
            if (result){
                window.location.href="${SourcePath}/downloadFile?id="+$(this).attr("down_id");
            }
        });

        // 显示我的资源
        function showSelfFileList() {
            $.ajax({
                    url: "${SourcePath}/getSelfFileList",
                    type:"GET",
                    data:{"memberId":"${sessionScope.loginMemberInfo.memberId}"},
                    success:function (result) {
                        console.log(result);
                        $("#main_content").empty();
                        // 1.解析并显示文件信息
                        build_show_files(result);
                        // 2.解析并显示分页信息
                        bulid_show_pageinfo(result);
                        // 3.解析并显示分页条信息
                        build_show_pagenav3(result);
                    }
            });
        }

        // 根据memberId获得数据后解析分页条信息
        function build_show_pagenav3(result) {
            var td = $("<td></td>");
            var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            if (!result.returnDatas.fileSourcePageInfo.hasPreviousPage){
                preLi.addClass("disabled");
                preLi.click("javascript:void(0);");
            }

            var ul = $("<ul></ul>").addClass("pagination").append(preLi);
            preLi.click(function () {
                to_page3(result.returnDatas.fileSourcePageInfo.pageNum-1);
            });
            $.each(result.returnDatas.fileSourcePageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.returnDatas.fileSourcePageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                ul.append(numLi);
                numLi.click(function () {
                    to_page3(item)
                });
            });
            if (!result.returnDatas.fileSourcePageInfo.hasNextPage){
                nextLi.addClass("disabled");
                nextLi.click("javascript:void(0);");
            }
            ul.append(nextLi);
            nextLi.click(function () {
                to_page3(result.returnDatas.fileSourcePageInfo.pageNum+1)
            });

            td.addClass("col-sm-4")
                .append($("<nav></nav>")
                    .append(ul));

            td.appendTo("#main_content");
        }

        /**
         * 我的资源分页跳转
         * @param pageNum
         */
        function to_page3(pageNum){
            $.ajax({
                url:"${SourcePath}/getFileSourcesWithMemberId",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result) {
                    $("#main_content").empty();
                    // 1.解析并显示文件信息
                    build_show_files(result);
                    // 2.解析并显示分页信息
                    bulid_show_pageinfo(result);
                    // 3.解析并显示分页条信息
                    build_show_pagenav3(result);
                }
            });
        }


    </script>
</body>
</html>
