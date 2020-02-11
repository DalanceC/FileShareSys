package com.hhit.pas;

import com.hhit.util.EncryptUtil;

public class GetPwd {
    public static void main(String[] args) {
        EncryptUtil encryptUtil = new EncryptUtil();
        String result = encryptUtil.md5Crypt("admin");
        System.out.println(result);
    }
}
