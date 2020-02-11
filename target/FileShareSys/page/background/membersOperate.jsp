<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/2
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户管理</title>
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
        var currentPageNum;

        //页面加载
        $(function () {
            //直接进入第1页
            to_page(1);

        });

        /**
         * 页面跳转，根据页码获取数据
         * @param pageNum
         */
        function to_page(pageNum) {
            $.ajax({
                url:"${SourcePath}/getAllMembers",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    // 1.解析并显示用户信息
                    bulid_show_member(result);
                    // 2.解析并显示分页信息
                    bulid_show_pageinfo(result);
                    // 3.解析并显示分页条信息
                    build_show_pagenav(result);
                }
            });
        }

        /**
         * 解析并显示用户信息
         * @param result
         */
        function bulid_show_member(result) {
            $("#memberTable tbody").empty();
            var members = result.returnDatas.memberPageInfo.list;
            $.each(members,function (index,item) {
                // alert(index+item.memberName);
                var count = index+1;
                var indexTd = $("<td></td>").append(count);
                var memberIdTd = $("<td></td>").append(item.memberId);
                var memberNameTd = $("<td></td>").append(item.memberName);
                var trueNameTd = $("<td></td>").append(item.trueName);
                var sexTd = $("<td></td>").append(item.sex);
                var emailTd = $("<td></td>").append(item.email);

                var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                    .append(" 编辑");
                editBtn.attr("edit_id",item.id);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append(" 删除");
                delBtn.attr("delete_id",item.id);
                var btnTd = $("<td></td>").append(editBtn).append("&nbsp;&nbsp;").append(delBtn);

                $("<tr></tr>").append(indexTd)
                    .append(memberIdTd)
                    .append(memberNameTd)
                    .append(trueNameTd)
                    .append(sexTd)
                    .append(emailTd)
                    .append(btnTd)
                    .appendTo("#memberTable tbody");
            });
        }

        /**
         * 解析并显示分页信息
         * @param result
         */
        function bulid_show_pageinfo(result) {
            $("#page_text_info").empty();
            var currentPageSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.memberPageInfo.pageNum);
            var totalPageSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.memberPageInfo.pages);
            var totalNumSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.memberPageInfo.total);
            $("#page_text_info").append("当前第").append(currentPageSpan).append("页，总共").append(totalPageSpan)
                .append("页，总共").append(totalNumSpan).append("条记录");
            currentPageNum = result.returnDatas.memberPageInfo.pageNum;

        }

        /**
         * 解析并显示分页条信息,实现跳转
         * @param result
         */
        function build_show_pagenav(result) {
            $("#page_nav_info").empty();
            var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            if (!result.returnDatas.memberPageInfo.hasPreviousPage){
                preLi.addClass("disabled");
                preLi.click("javascript:void(0);");
            }
            var ul = $("#page_nav_info").append(preLi);
            preLi.click(function () {
                to_page(result.returnDatas.memberPageInfo.pageNum-1);
            });
            $.each(result.returnDatas.memberPageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.returnDatas.memberPageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                ul.append(numLi);
                numLi.click(function () {
                    to_page(item)
                });
            });
            if (!result.returnDatas.memberPageInfo.hasNextPage){
                nextLi.addClass("disabled");
                nextLi.click("javascript:void(0);");
            }
            ul.append(nextLi);
            nextLi.click(function () {
                to_page(result.returnDatas.memberPageInfo.pageNum+1)
            });
        }

        /**
         * 点击编辑按钮，弹出模态框并显示修改的数据
         */
        $(document).on("click",".edit_btn",function () {
            //根据id获取用户信息
            getMemberById($(this).attr("edit_id"));
            //为更新按钮添加id的数据
            $("#member_update_btn").attr("edit_id",$(this).attr("edit_id"));
            $("#memberEditModel").modal({
                backdrop: "static",
                keyboard: true
            });
        });

        /**
        * 点击删除按钮，弹出确认进行操作
        */
        $(document).on("click",".delete_btn",function () {
            var result = confirm("是否删除?")
            if (result){
                $.ajax({
                    url: "${SourcePath}/deleteMember/"+$(this).attr("delete_id"),
                    type: "DELETE",
                    success:function (result) {
                        // 1.弹出处理消息
                        alert(result.message);
                        // 2.回到本页面
                        to_page(currentPageNum);
                    }
                });
            }
        });

        /**
         * 根据id获取用户信息
         * 并把数据显示在修改模态框
         * @param id
         */
        function getMemberById(id) {
            $.ajax({
                url: "${SourcePath}/getMemberById/" + id,
                type: "GET",
                success: function (result) {
                    console.log(result);
                    var memberInfo = result.returnDatas.memberInfo;
                    $("#memberId_edit_static").text(memberInfo.memberId);
                    $("#memberName_edit_static").text(memberInfo.memberName);
                    $("#memberTrueName_edit_static").text(memberInfo.trueName);
                    $("#memberPassword_update_inptut").val(memberInfo.memberPassword);
                    $("#memberEditModel input[name=sex]").val([memberInfo.sex]);
                    $("#memberEmail_update_input").val(memberInfo.email);
                }
            });
        }



    </script>
</head>
<body>
    <div class="container">
        <%--显示标题--%>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h1>Member
                    <small>管理</small>
                </h1>
            </div>
        </div>

        <%--搜索框--%>
        <div>
            <form class="form-inline" id="searchForm" style="margin-left: 800px">
                <div class="form-group">
                    <input type="text" id="searchCondition" class="form-control" name="searchByMemberName" placeholder="Input MemberName" value="${requestScope.condition.searchProductName}"/>
                </div>
                <button type="button" class="btn btn-default" id="searchBtn">
                    <span class="glyphicon glyphicon-search"aria-hidden="true"></span>&nbsp;Search
                </button>
            </form>
        </div>

        <%--显示用户信息--%>
        <div>
            <table class="table table-hover" id="memberTable">
                <thead>
                <tr>
                    <td>#</td>
                    <td>用户编号</td>
                    <td>用户名</td>
                    <td>真实姓名</td>
                    <td>性别</td>
                    <td>邮箱</td>
                    <td>操作</td>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>

        <%--显示分页信息--%>
        <div class="row">
            <%--文字信息--%>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" id="page_text_info"></div>
            <%--分页条信息--%>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <nav aria-label="Page navigation" style="margin-left: 300px">
                    <ul class="pagination" id="page_nav_info">

                    </ul>
                </nav>
            </div>
        </div>
    </div>


    <!-- 修改用户模态框 -->
    <div class="modal fade" id="memberEditModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户编号</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="memberId_edit_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="memberName_edit_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">真实姓名</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="memberTrueName_edit_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="memberPassword" id="memberPassword_update_inptut">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex1_update_input" value="男" checked="checked">
                                    男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" id="sex2_update_input" value="女"> 女
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="email" class="form-control" name="email" id="memberEmail_update_input">
                                <span class="help-block"></span>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="member_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

<script>
    /**
     * 点击模态框的修改按钮进行修改
     */
    $("#member_update_btn").click(function () {
        $.ajax({
            url: "${SourcePath}/updateMember/"+$(this).attr("edit_id"),
            type: "PUT",
            data: $("#memberEditModel form").serialize(),
            success:function (result) {
                alert(result.message);
                // 1.关闭修改模态框
                $("#memberEditModel").modal("hide");
                // 2.回到本页面
                to_page(currentPageNum);
            }
        });
    });

    $("#searchBtn").click(function () {
        var searchName = document.getElementById("searchCondition").value;
        console.log(searchName);
        $.ajax({
            url: "${pageContext.request.contextPath}/searchByMemberName",
            type:"PUT",
            data:{"searchName":searchName},
            success:function (result) {
                console.log(result);
                // 1.解析并显示用户信息
                bulid_show_member(result);
                // 2.解析并显示分页信息
                bulid_show_pageinfo(result);
                // 3.解析并显示分页条信息
                build_show_pagenav2(result);
            }
        });
    });

    function build_show_pagenav2(result) {
        $("#page_nav_info").empty();
        var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!result.returnDatas.memberPageInfo.hasPreviousPage){
            preLi.addClass("disabled");
            preLi.click("javascript:void(0);");
        }
        var ul = $("#page_nav_info").append(preLi);
        preLi.click(function () {
            to_page2(result.returnDatas.memberPageInfo.pageNum-1);
        });
        $.each(result.returnDatas.memberPageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.returnDatas.memberPageInfo.pageNum==item){
                numLi.addClass("active");
            }
            ul.append(numLi);
            numLi.click(function () {
                to_page2(item)
            });
        });
        if (!result.returnDatas.memberPageInfo.hasNextPage){
            nextLi.addClass("disabled");
            nextLi.click("javascript:void(0);");
        }
        ul.append(nextLi);
        nextLi.click(function () {
            to_page2(result.returnDatas.memberPageInfo.pageNum+1)
        });
    }

    function to_page2(pageNum) {
        $.ajax({
            url:"${SourcePath}/getMembersWithCondition",
            data:"pageNum="+pageNum,
            type:"GET",
            success:function (result) {
                console.log(result);
                // 1.解析并显示用户信息
                bulid_show_member(result);
                // 2.解析并显示分页信息
                bulid_show_pageinfo(result);
                // 3.解析并显示分页条信息
                build_show_pagenav2(result);
            }
        });
    }

</script>

</body>
</html>
