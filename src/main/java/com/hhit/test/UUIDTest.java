package com.hhit.test;

import java.util.UUID;

public class UUIDTest {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            String str = UUID.randomUUID().toString();
            System.out.println(str);
        }

    }
}
