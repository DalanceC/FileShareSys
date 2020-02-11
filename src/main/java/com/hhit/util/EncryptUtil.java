package com.hhit.util;

import java.security.MessageDigest;

public class EncryptUtil {
    public final static String md5Crypt(String inputString){
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
        try {
            byte[] input = inputString.getBytes();

            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest md5Instance = MessageDigest.getInstance("MD5");

            // 使用指定的字节更新摘要
            md5Instance.update(input);

            // 获得密文
            byte[] md5 = md5Instance.digest();

            // 把密文转换成十六进制的字符串形式
            int j = md5.length;
            char str[] = new char[j*2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md5[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
