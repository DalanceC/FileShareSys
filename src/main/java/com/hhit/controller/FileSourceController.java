package com.hhit.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hhit.bean.FileSource;
import com.hhit.bean.Member;
import com.hhit.service.FileSourceService;
import com.hhit.util.FileSourceDownloadUtil;
import com.hhit.util.FileSourceUploadUtil;
import com.hhit.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class FileSourceController {
    @Autowired
    FileSourceService fileSourceService;

    private String searchCondition = null;
    private String selfMemberId = null;

    /**
     * 查询所有的文件信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAllFileSources")
    public Message getAllFileSources(@RequestParam(value = "pageNum",
                            defaultValue = "1") Integer pageNum) {
        //分页
        String orderby = "f.id asc";
        PageHelper.startPage(pageNum, 5, orderby);
        List<FileSource> fileSourceList = fileSourceService.getAllFileSources();
        PageInfo fileSourcePageInfo = new PageInfo(fileSourceList, 5);
        return Message.success().add("fileSourcePageInfo", fileSourcePageInfo);
    }

    /**
     * 根据id获取到文件信息然后删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteFileSource/{id}", method = RequestMethod.DELETE)
    public Message deleteFileSource(@PathVariable("id") Integer id) {
        fileSourceService.deleteFileSource(id);
        return Message.success();
    }

    /**
     * 查询所有包含关键字的的文件信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/searchByFileName")
    public Message getAllFileSourcesWithCondition(String searchName) {
        //分页
        String orderby = "f.id asc";
        PageHelper.startPage(1, 5, orderby);
        searchCondition = searchName;
        List<FileSource> fileSourceList = fileSourceService.getAllFileSourcesWithCondition(searchName);
        PageInfo fileSourcePageInfo = new PageInfo(fileSourceList, 5);
        return Message.success().add("fileSourcePageInfo", fileSourcePageInfo);
    }

    /**
     * 查询所有符合条件的文件信息并进行分页
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getFileSourcesWithCondition")
    public Message getFileSourcesWithCondition(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //分页
        String orderby = "f.id asc";
        PageHelper.startPage(pageNum, 5, orderby);
        List<FileSource> fileSourceList = fileSourceService.getAllFileSourcesWithCondition(searchCondition);
        PageInfo fileSourcePageInfo = new PageInfo(fileSourceList, 5);
        return Message.success().add("fileSourcePageInfo", fileSourcePageInfo);
    }

    /**
     * 文件上传
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/fileUpload")
    public void fileUpload(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            FileSource fileSource = FileSourceUploadUtil.fileSourceUpload(request, response);
            if (fileSource == null) {

                response.sendRedirect(request.getContextPath() + "/page/error.jsp");
            } else {
                fileSourceService.saveFileSource(fileSource);
                request.setAttribute("result", "文件上传成功！");
                request.getRequestDispatcher("/page/front/fileUpload.jsp").forward(request,response);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


    /**
     * 文件下载
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/downloadFile")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Integer id = Integer.parseInt(request.getParameter("id"));
        FileSource fileSource = fileSourceService.getFileSourceById(id);
        if (fileSource != null) {
            FileSourceDownloadUtil.downFile(fileSource, response);
        }
    }

    /**
     * 用户查看自己上传的文件
     *
     * @param memberId
     * @return
     */
    @ResponseBody
    @RequestMapping("/getSelfFileList")
    public Message getSelfFileList(String memberId) {
        String orderby = "f.id asc";
        PageHelper.startPage(1, 5, orderby);
        List<FileSource> fileSourceList = fileSourceService.getFileSourcesByMemberId(memberId);
        selfMemberId = memberId;
        PageInfo fileSourcePageInfo = new PageInfo(fileSourceList, 5);
        return Message.success().add("fileSourcePageInfo", fileSourcePageInfo);
    }

    /**
     * 分页用户查看自己上传的文件
     *
     * @param pageNum
     * @return
     */
    @ResponseBody
    @RequestMapping("/getFileSourcesWithMemberId")
    public Message getFileSourcesWithMemberId(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //分页
        String orderby = "f.id asc";
        PageHelper.startPage(pageNum, 5, orderby);
        List<FileSource> fileSourceList = fileSourceService.getFileSourcesByMemberId(selfMemberId);
        PageInfo fileSourcePageInfo = new PageInfo(fileSourceList, 5);
        return Message.success().add("fileSourcePageInfo", fileSourcePageInfo);
    }

}
