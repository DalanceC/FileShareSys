package com.hhit.util;

import com.hhit.bean.FileSource;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

public class FileSourceDownloadUtil {
    public static void downFile(FileSource file, HttpServletResponse response) throws IOException {
        //设置获得的文件名的编码
        String filename = URLEncoder.encode(file.getFileName(), "utf-8");
        //使得浏览器以下载的方式打开文件
        response.setHeader("Content-disposition", "attachment;filename=" + filename);
        InputStream in = new FileInputStream(file.getFilePath());
        OutputStream out = response.getOutputStream();
        byte[] bytes = new byte[1024];
        int len = 0;
        while ((len = in.read(bytes)) != -1) {
            out.write(bytes, 0, len);
        }
        response.addHeader("Content-Length", String.valueOf(len));
    }
}
