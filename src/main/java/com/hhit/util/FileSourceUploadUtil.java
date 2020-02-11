package com.hhit.util;

import com.hhit.bean.FileSource;
import com.hhit.bean.Member;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class FileSourceUploadUtil {
    public static FileSource fileSourceUpload(HttpServletRequest request, HttpServletResponse response) {
        FileSource fileSource = new FileSource();
        String fileId = UUID.randomUUID().toString().substring(0, 16);
        String type = null;
        String filePath = null;
        String fileName = null;
        Member member = (Member) request.getSession().getAttribute("loginMemberInfo");
        String memberId = member.getMemberId();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String uploadTime = simpleDateFormat.format(new Date());
        String description = null;

        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();//创建磁盘文件项工厂
            factory.setSizeThreshold(1024 * 1024);//设置缓存大小
            String path_temp = request.getSession().getServletContext().getRealPath("/path_temp");
            if (path_temp != null) {
                File file = new File(path_temp);
                if (!file.exists()) {
                    file.mkdirs();
                }
                factory.setRepository(file);//设置临时文件位置
                ServletFileUpload upload = new ServletFileUpload(factory);//创建文件上传核心类
                upload.setHeaderEncoding("UTF-8");//设置上传文件编码
                boolean isFileUploadForm = upload.isMultipartContent(request);//判断是否是文件上传表单
                if (isFileUploadForm) {
                    List<FileItem> parseList = upload.parseRequest(request);
                    if (parseList != null) {
                        for (FileItem item : parseList) {
                            if (item != null) {
                                boolean formField = item.isFormField();//判断是否是普通的表单项
                                if (formField) {
                                    String formFieldName = item.getFieldName();
                                    if (formFieldName.equals("description")) {
                                        description = item.getString("UTF-8");
                                    }
                                } else {
                                    fileName = item.getName();//获取上传文件的名称
                                    if (fileName.endsWith(".jpg") || fileName.endsWith(".png")) {
                                        type = "图片";
                                    } else if (fileName.endsWith(".docx")
                                            || fileName.endsWith(".doc")
                                            || fileName.endsWith(".xls")
                                            || fileName.endsWith(".pdf")
                                            || fileName.endsWith(".ppt")
                                            || fileName.endsWith(".txt")) {
                                        type = "文档";
                                    } else if (fileName.endsWith(".mp3")) {
                                        type = "音乐";
                                    } else if (fileName.endsWith("mp4")) {
                                        type = "视频";
                                    } else {
                                        type = "其他";
                                    }
                                    InputStream in = item.getInputStream();//获取输入流
                                    //获取最终上传的目录
                                    String path_store = request.getSession().getServletContext().getRealPath("/uploadPath");
                                    File storePath = new File(path_store);
                                    if (!storePath.exists()) {
                                        storePath.mkdirs();
                                    }
                                    String lastStorePath = path_store + "/" + fileName;//获取最终上传的文件位置
                                    filePath = lastStorePath;
                                    OutputStream out = null;
                                    if ("" != fileName) {
                                        out = new FileOutputStream(filePath);//创建输出流
                                        IOUtils.copy(in, out);//完成上传---也就是拷贝
                                    }
                                    in.close();
                                    if (out != null) {
                                        out.close();
                                    }

                                    item.delete();//清除缓存
                                }
                            }
                        }
                    }
                }
            }

        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        fileSource.setFileId(fileId);
        fileSource.setFileName(fileName);
        fileSource.setType(type);
        fileSource.setFilePath(filePath);
        fileSource.setMemberId(memberId);
        fileSource.setUploadTime(uploadTime);
        fileSource.setDescription(description);
        fileSource.setMember(member);

        if (fileName == null || fileName == "") {
            fileSource = null;
        }

        return fileSource;
    }
}
