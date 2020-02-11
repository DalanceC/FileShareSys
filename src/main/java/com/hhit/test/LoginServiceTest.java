package com.hhit.test;

import com.hhit.bean.Manager;
import com.hhit.dao.ManagerMapper;
import com.hhit.service.ManagerService;
import com.hhit.util.EncryptUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class LoginServiceTest {
    @Autowired
    ManagerService managerService;
    @Autowired
    ManagerMapper managerMapper;
    @Test
    public void testLogin() {

//        System.out.println(managerService.toString());
        Manager manager = managerService.managerLogin("jack", EncryptUtil.md5Crypt("123456"));
        if (manager != null) {
            System.out.println(manager.toString());
        } else {
            System.out.println("error");
        }
//        Manager manager = managerMapper.managerLogin("jack", EncryptUtil.md5Crypt("123456"));
//        System.out.println(manager.toString());
    }
}
