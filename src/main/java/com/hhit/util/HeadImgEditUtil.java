package com.hhit.util;

import com.hhit.bean.Member;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

public class HeadImgEditUtil {
    public static Member editMemberHeadImg(Member member, HttpServletRequest request, HttpServletResponse response) {
        String newHeadImg = null;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(1024 * 1024);
            String path_temp = request.getSession().getServletContext().getRealPath("/path_temp");
            File file = new File(path_temp);
            if (!file.exists()) {
                file.mkdirs();
            }
            factory.setRepository(file);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            boolean isFileUploadForm = upload.isMultipartContent(request);
            if (isFileUploadForm) {
                List<FileItem> parestList = upload.parseRequest(request);
                if (parestList != null) {
                    for (FileItem item : parestList) {
                        boolean formField = item.isFormField();
                        if (formField) {
                            String formFieldName = item.getFieldName();
                            System.out.println(formFieldName);
                        } else {
                            String fileName = item.getName();//获取上传文件的名称
                            if (fileName != null && "" != fileName) {
                                String suffix = fileName.substring(fileName.lastIndexOf("."));
                                String newName = UUID.randomUUID().toString().substring(0, 5);
                                fileName = newName + suffix;
                                InputStream in = item.getInputStream();//获取输入流
                                String path_store = request.getSession().getServletContext().getRealPath("/headImgPath");//获取绝对路径的目录
                                File storePath = new File(path_store);
                                if (!storePath.exists()) {
                                    storePath.mkdirs();
                                }
                                String lastStorePath = path_store + "/" + fileName;//获取最终上传的文件位置
                                String xdPath = "/headImgPath" + "/" + fileName;//相对路径
                                newHeadImg = xdPath;
                                OutputStream out = new FileOutputStream(lastStorePath);//创建输出流
                                IOUtils.copy(in, out);//完成上传---也就是拷贝
                                in.close();
                                out.close();
                                item.delete();//清除缓存
                            }

                        }
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newHeadImg != null) {
            member.setHeadImg(newHeadImg);
        }
        return member;
    }
}
