var localObj = window.location;
var SourcePath = localObj.pathname.split("/")[1];

var searchCondtion;

$(function () {
    to_page(1);


});

$("#li1").click(function () {
    $("#li1").addClass("active");
    $("#li2").removeClass("active");
    $("#li3").removeClass("active");
    $("#li4").removeClass("active");
    to_page(1);
});

function to_page(pageNum){
    $.ajax({
        url: "/"+SourcePath+"/getAllFileSources",
        type: "GET",
        data: "pageNum="+pageNum,
        success:function (result) {
            // console.log(result);
            $("#main_content").empty();
            $("#main_content").append($("<div></div>")
                .append($("<form method='post' class='form-inline' " +
                    "style='margin-left: 800px'></form>")
                    .append($("<div class='form-group'></div>")
                        .append($("<input type='text' class='form-control' " +
                            "id='searchCondition' name='searchName' " +
                            "placeholder='Input FileName' />"))
                    )
                    .append($("<button type='button' class='btn btn-default' " +
                                        "id='searchBtn' style='margin-left: 5px' " +
                                        "onclick='searchWithCondition()'></button>")
                        .append($("<span class='glyphicon glyphicon-search' " +
                                            "aria-hidden='true'></span>"))
                        .append(" Search")
                    )
                )
            );
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
function build_show_files(result){
    var fileSources = result.returnDatas.fileSourcePageInfo.list;
    var thead = $("<tbody></tbody>")
        .append($("<tr></tr>")
            .append("<td>上传者头像</td>")
            .append("<td>文件名</td>")
            .append("<td>文件类型</td>")
            .append("<td>上传时间</td>")
            .append("<td>上传者</td>")
            .append("<td>文件描述</td>")
            .append("<td>操作</td>")
        );

    var tbody = $("<tbody></tbody>");
    $.each(fileSources,function (index,item) {
        var memberImgTd = $("<td></td>")
            .append($("<img src='/"+SourcePath+"/"+item.member.headImg+"' " +
                "class='img-circle' " +
                "style='width: 50px;height: 50px'>"));
        var fileNameTd = $("<td style='padding-top: 23px'></td>").append(item.fileName);
        var typeTd = $("<td style='padding-top: 23px'></td>").append(item.type);
        var uploadTimeTd = $("<td style='padding-top: 23px'></td>").append(item.uploadTime);
        var memberTd = $("<td style='padding-top: 23px'></td>").append(item.member.memberName);
        var descriptionTd = $("<td style='padding-top: 23px'></td>").append(item.description);
        var downloadBtn = $("<button class='btn btn-primary btn-xs down_btn' " +
            "id='download_btn'></button>")
                .append($("<span></span>").addClass("glyphicon glyphicon-arrow-down"))
                .append(" 下载");
        downloadBtn.attr("down_id",item.id);
        var finalDownloadBtn = $("<td style='padding-top: 23px'></td>").append(downloadBtn);

        var tr = $("<tr></tr>").append(memberImgTd)
            .append(fileNameTd)
            .append(typeTd)
            .append(uploadTimeTd)
            .append(memberTd)
            .append(descriptionTd)
            .append(finalDownloadBtn)
            .appendTo(tbody);
    });

    var table = $("<table></table>")
        .addClass("table")
        .append(thead)
        .append(tbody)
        .appendTo("#main_content");

}

// 2.解析并显示分页信息
function bulid_show_pageinfo(result){
    var currentPageSpan = $("<span></span>")
        .addClass("label label-default")
        .append(result.returnDatas.fileSourcePageInfo.pageNum);
    var totalPageSpan = $("<span></span>")
        .addClass("label label-default")
        .append(result.returnDatas.fileSourcePageInfo.pages);
    var totalNumSpan = $("<span></span>")
        .addClass("label label-default")
        .append(result.returnDatas.fileSourcePageInfo.total);
    var td = $("<td></td>").addClass("col-sm-8")
        .append("当前第").append(currentPageSpan)
        .append("页，总共").append(totalPageSpan)
        .append("页，总共").append(totalNumSpan).append("条记录")
        .appendTo("#main_content");
}

// 3.解析并显示分页条信息
function build_show_pagenav(result){
    var td = $("<td></td>");
    var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
    var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    if (!result.returnDatas.fileSourcePageInfo.hasPreviousPage){
        preLi.addClass("disabled");
        preLi.click("javascript:void(0);");
    }

    var ul = $("<ul></ul>").addClass("pagination").append(preLi);
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

    td.addClass("col-sm-4")
        .append($("<nav></nav>")
            .append(ul));

    td.appendTo("#main_content");
}

// 搜索
function searchWithCondition(){
    var searchName = document.getElementById("searchCondition").value;
    searchCondtion = searchName;
    $.ajax({
        url: "/"+SourcePath+"/searchByFileName",
        typr: "PUT",
        data: {"searchName":searchName},
        success:function (result) {
            $("#main_content").empty();
            $("#main_content").append($("<div></div>")
                .append($("<form method='post' class='form-inline' " +
                                    "style='margin-left: 800px'></form>")
                    .append($("<div class='form-group'></div>")
                        .append($("<input type='text' class='form-control' " +
                                            "id='searchCondition' name='searchName' " +
                                            "placeholder='Input FileName' " +
                                            "value='"+searchCondtion+"' />"))
                    )
                    .append($("<button type='button' class='btn btn-default' " +
                                        "id='searchBtn' style='margin-left: 5px' " +
                                        "onclick='searchWithCondition()'></button>")
                        .append($("<span class='glyphicon glyphicon-search' " +
                                            "aria-hidden='true'></span>"))
                        .append(" Search")
                    )
                )
            );
            // 1.解析并显示文件信息
            build_show_files(result);
            // 2.解析并显示分页信息
            bulid_show_pageinfo(result);
            // 3.解析并显示分页条信息
            build_show_pagenav2(result);
        }
    });
}

// 搜索后解析分页条信息
function build_show_pagenav2(result) {
    var td = $("<td></td>");
    var preLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
    var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
    if (!result.returnDatas.fileSourcePageInfo.hasPreviousPage){
        preLi.addClass("disabled");
        preLi.click("javascript:void(0);");
    }

    var ul = $("<ul></ul>").addClass("pagination").append(preLi);
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

    td.addClass("col-sm-4")
        .append($("<nav></nav>")
            .append(ul));

    td.appendTo("#main_content");
}

function to_page2(pageNum) {
    $.ajax({
        url:"/"+SourcePath+"/getFileSourcesWithCondition",
        data:"pageNum="+pageNum,
        type:"GET",
        success:function (result) {
            $("#main_content").empty();
            $("#main_content").append($("<div></div>")
                .append($("<form method='post' class='form-inline' style='margin-left: 800px'></form>")
                    .append($("<div class='form-group'></div>")
                        .append($("<input type='text' class='form-control' id='searchCondition' name='searchName' placeholder='Input FileName' value='"+searchCondtion+"'/>"))
                    )
                    .append($("<button type='button' class='btn btn-default' id='searchBtn' style='margin-left: 5px' onclick='searchWithCondition()'></button>")
                        .append($("<span class='glyphicon glyphicon-search' aria-hidden='true'></span>"))
                        .append(" Search")
                    )
                )
            );
            // 1.解析并显示文件信息
            build_show_files(result);
            // 2.解析并显示分页信息
            bulid_show_pageinfo(result);
            // 3.解析并显示分页条信息
            build_show_pagenav2(result);
        }
    });
}

$("#li2").click(function () {
    $("#li1").removeClass("active");
    $("#li2").addClass("active");
    $("#li3").removeClass("active");
    $("#li4").removeClass("active");
    showSelfFileList();
});

$("#li3").click(function () {
    $("#li1").removeClass("active");
    $("#li2").removeClass("active");
    $("#li3").addClass("active");
    $("#li4").removeClass("active");
    showSelfInfo();
});

$("#li4").click(function () {
    $("#li1").removeClass("active");
    $("#li2").removeClass("active");
    $("#li3").removeClass("active");
    $("#li4").addClass("active");

});



