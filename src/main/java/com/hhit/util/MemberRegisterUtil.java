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

public class MemberRegisterUtil {
    public static Member packageMemberInfo(HttpServletRequest request, HttpServletResponse response) {
        Member member = new Member();
        String memberId = UUID.randomUUID().toString().substring(0, 16);
        String memberName = null;
        String memberPassword = null;
        String trueName = null;
        String sex = null;
        String email = null;
        String headImg = null;

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
                        if (item != null) {
                            boolean formField = item.isFormField();
                            if (formField) {
                                String formFieldName = item.getFieldName();
                                if (formFieldName.equals("memberName")) {
                                    memberName = item.getString("UTF-8");
                                } else if (formFieldName.equals("memberPassword")) {
                                    memberPassword = item.getString("UTF-8");
                                } else if (formFieldName.equals("trueName")) {
                                    trueName = item.getString("UTF-8");
                                } else if (formFieldName.equals("sex")) {
                                    sex = item.getString("UTF-8");
                                } else if (formFieldName.equals("email")) {
                                    email = item.getString("UTF-8");
                                }
                            } else {
                                String fileName = item.getName();//获取上传文件的名称
                                if (fileName != null && "" != fileName) {
                                    String suffix = fileName.substring(fileName.lastIndexOf("."));
                                    String newName = UUID.randomUUID().toString().substring(0, 5);
                                    fileName = newName + suffix;
                                    InputStream in = item.getInputStream();//获取输入流

                                    String path_store = request.getSession()
                                                                .getServletContext()
                                                                .getRealPath("/headImgPath");//获取绝对路径的目录
                                    File storePath = new File(path_store);
                                    if (!storePath.exists()) {
                                        storePath.mkdirs();
                                    }
                                    String lastStorePath = path_store + "/" + fileName;//获取最终上传的文件位置
                                    String xdPath = "/headImgPath" + "/" + fileName;//相对路径
                                    headImg = xdPath;
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

        member.setMemberId(memberId);
        member.setMemberName(memberName);
        member.setMemberPassword(EncryptUtil.md5Crypt(memberPassword));
        member.setTrueName(trueName);
        member.setSex(sex);
        member.setEmail(email);
        member.setHeadImg(headImg);

        if ("".equals(memberName) || "D41D8CD98F00B204E9800998ECF8427E".equals(memberPassword)) {
            member = null;
        }

        return member;
    }
}
