<%--
  Created by IntelliJ IDEA.
  User: 82607
  Date: 2019/5/4
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件管理</title>
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
</head>
<body>
  <div class="container">
      <%--显示标题--%>
      <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <h1>FileSource
                  <small>管理</small>
              </h1>
          </div>
      </div>

      <%--搜索框--%>
      <div>
          <form class="form-inline" method="post" style="margin-left: 800px">
              <div class="form-group">
                  <input type="text" class="form-control"
                         id="searchCondition" name="searchName"
                         placeholder="Input FileName"
                         value="${requestScope.condition.searchProductName}"/>
              </div>
              <button type="button" class="btn btn-default" id="searchBtn">
                  <span class="glyphicon glyphicon-search"aria-hidden="true"></span>&nbsp;Search
              </button>
          </form>
      </div>

      <%--显示用户信息--%>
      <div>
          <table class="table table-hover" id="fileSourceTable">
              <thead>
              <tr>
                  <td>#</td>
                  <td>文件编号</td>
                  <td>文件名</td>
                  <td>文件类型</td>
                  <td>上传时间</td>
                  <td>上传者</td>
                  <td>文件描述</td>
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
              <nav style="margin-left: 300px">
                  <ul class="pagination" id="page_nav_info">

                  </ul>
              </nav>
          </div>
      </div>

  </div>

    <script>
        var currentPage;
        $(function () {
            to_page(1);

        });
        
        function to_page(pageNum) {
            $.ajax({
                url:"${SourcePath}/getAllFileSources",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result) {
                    // console.log(result);
                    // 1.解析并显示文件信息
                    build_show_files(result);
                    // 2.解析并显示分页信息
                    bulid_show_pageinfo(result);
                    // 3.解析并显示分页条信息
                    build_show_pagenav(result);
                }
            });
        }

        // 1.解析并显示文件信息
        function build_show_files(result) {
            $("#fileSourceTable tbody").empty();
            var fileSources = result.returnDatas.fileSourcePageInfo.list;
            $.each(fileSources,function (index,item) {
                var count = index+1;
                var indexTd = $("<td></td>").append(count);
                var fileIdTd = $("<td></td>").append(item.fileId);
                var fileNameTd = $("<td></td>").append(item.fileName);
                var typeTd = $("<td></td>").append(item.type);
                var uploadTimeTd = $("<td></td>").append(item.uploadTime);
                var memberNameTd = $("<td></td>").append(item.member.memberName);
                var descriptionTd = $("<td></td>").append(item.description);
                var delBtn = $("<td></td>")
                    .append($("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
                    .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                    .append(" 删除"));
                delBtn.attr("delete_id",item.id);

                $("<tr></tr>").append(indexTd)
                    .append(fileIdTd)
                    .append(fileNameTd)
                    .append(typeTd)
                    .append(uploadTimeTd)
                    .append(memberNameTd)
                    .append(descriptionTd)
                    .append(delBtn)
                    .appendTo("#fileSourceTable tbody");
            });
        }

        // 2.解析并显示分页信息
        function bulid_show_pageinfo(result) {
            $("#page_text_info").empty();
            var currentPageSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.fileSourcePageInfo.pageNum);
            var totalPageSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.fileSourcePageInfo.pages);
            var totalNumSpan = $("<span></span>")
                .addClass("label label-default")
                .append(result.returnDatas.fileSourcePageInfo.total);
            $("#page_text_info").append("当前第").append(currentPageSpan).append("页，总共").append(totalPageSpan)
                .append("页，总共").append(totalNumSpan).append("条记录");
            currentPageNum = result.returnDatas.fileSourcePageInfo.pageNum;
        }

        // 3.解析并显示分页条信息
        function build_show_pagenav(result) {
            $("#page_nav_info").empty();
            var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            if (!result.returnDatas.fileSourcePageInfo.hasPreviousPage){
                preLi.addClass("disabled");
                preLi.click("javascript:void(0);");
            }
            var ul = $("#page_nav_info").append(preLi);
            preLi.click(function () {
                to_page(result.returnDatas.fileSourcePageInfo.pageNum-1);
            });
            $.each(result.returnDatas.fileSourcePageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.returnDatas.fileSourcePageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                ul.append(numLi);
                numLi.click(function () {
                    to_page(item)
                });
            });
            if (!result.returnDatas.fileSourcePageInfo.hasNextPage){
                nextLi.addClass("disabled");
                nextLi.click("javascript:void(0);");
            }
            ul.append(nextLi);
            nextLi.click(function () {
                to_page(result.returnDatas.fileSourcePageInfo.pageNum+1)
            });
        }

        /**
         * 点击删除按钮，弹出确认进行操作
         */
        $(document).on("click",".delete_btn",function () {
            var result = confirm("是否删除?")
            if (result){
                $.ajax({
                    url: "${SourcePath}/deleteFileSource/"+$(this).attr("delete_id"),
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
         * 文件搜索
         */
        $("#searchBtn").click(function () {
            var searchName = document.getElementById("searchCondition").value;
            console.log(searchName);
            $.ajax({
                url: "${pageContext.request.contextPath}/searchByFileName",
                typr: "PUT",
                data: {"searchName":searchName},
                success:function (result) {
                    // console.log(result);
                    // 1.解析并显示文件信息
                    build_show_files(result);
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
            if (!result.returnDatas.fileSourcePageInfo.hasPreviousPage){
                preLi.addClass("disabled");
                preLi.click("javascript:void(0);");
            }
            var ul = $("#page_nav_info").append(preLi);
            preLi.click(function () {
                to_page2(result.returnDatas.fileSourcePageInfo.pageNum-1);
            });
            $.each(result.returnDatas.fileSourcePageInfo.navigatepageNums,function (index,item) {
                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if (result.returnDatas.fileSourcePageInfo.pageNum==item){
                    numLi.addClass("active");
                }
                ul.append(numLi);
                numLi.click(function () {
                    to_page2(item)
                });
            });
            if (!result.returnDatas.fileSourcePageInfo.hasNextPage){
                nextLi.addClass("disabled");
                nextLi.click("javascript:void(0);");
            }
            ul.append(nextLi);
            nextLi.click(function () {
                to_page2(result.returnDatas.fileSourcePageInfo.pageNum+1)
            });
        }


        function to_page2(pageNum) {
            $.ajax({
                url:"${SourcePath}/getFileSourcesWithCondition",
                data:"pageNum="+pageNum,
                type:"GET",
                success:function (result) {
                    // console.log(result);
                    // 1.解析并显示文件信息
                    build_show_files(result);
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
