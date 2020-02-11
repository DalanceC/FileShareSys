package com.hhit.test;

import com.hhit.bean.FileSource;
import com.hhit.bean.Manager;
import com.hhit.bean.Member;
import com.hhit.dao.FileSourceMapper;
import com.hhit.dao.ManagerMapper;
import com.hhit.dao.MemberMapper;
import com.hhit.util.EncryptUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    FileSourceMapper fileSourceMapper;
    @Autowired
    MemberMapper memberMapper;
    @Autowired
    ManagerMapper managerMapper;

    @Test
    public void isCreate() {
        System.out.println(fileSourceMapper);
        System.out.println(memberMapper);
        System.out.println(managerMapper);
    }

    @Test
    public void testMemberAdd() {
        Member member = new Member();
        member.setMemberId(UUID.randomUUID().toString().substring(0, 16));
        member.setMemberName("tom");
        member.setMemberPassword(EncryptUtil.md5Crypt("123"));
        member.setTrueName("狂三");
        member.setSex("女");
        member.setEmail("8281472@qq.com");
        member.setHeadImg("ddd.jpg");
        memberMapper.insertSelective(member);
    }

    @Test
    public void testMemberLogin() {
        Member member = memberMapper.memberLogin("jerry", EncryptUtil.md5Crypt("123456"));
        if (member != null) {
            System.out.println(member.toString());
        } else {
            System.out.println("用户不存在");
        }
    }

    @Test
    public void testSelectMemberById() {
        Member member = memberMapper.selectByPrimaryKey(1);
        if (member != null) {
            System.out.println(member.toString());
        } else {
            System.out.println("用户不存在");
        }
    }

    @Test
    public void testUpdateMemberById() {
        Member member = new Member();
        member.setId(2);
        member.setTrueName("王五");
        member.setMemberPassword(EncryptUtil.md5Crypt("111111"));
        memberMapper.updateByPrimaryKeySelective(member);
    }

    @Test
    public void testDeleteMemberById() {
        memberMapper.deleteByPrimaryKey(2);
    }

    @Test
    public void testManagerAdd() {
        Manager manager = new Manager();
        manager.setManagerId(UUID.randomUUID().toString().substring(0, 16));
        manager.setManagerName("jack");
        manager.setManagerPassword(EncryptUtil.md5Crypt("123456"));
        manager.setEmail("24214221@qq.com");
        manager.setHeadImg("ddd.png");
        managerMapper.insertSelective(manager);
    }

    @Test
    public void testManagerLogin() {
        Manager manager = managerMapper.managerLogin("jack", EncryptUtil.md5Crypt("123456"));
        if (manager != null) {
            System.out.println(manager.toString());
        } else {
            System.out.println("管理员不存在！");
        }
    }

    @Test
    public void testFileSourceAdd() {
        FileSource fileSource = new FileSource();
        fileSource.setFileId(UUID.randomUUID().toString().substring(0, 16));
        fileSource.setType("文档");
        fileSource.setFilePath("D://upload//pp.docx");
        fileSource.setFileName("pp.docx");
        fileSource.setMemberId("6e12936a-c5d1-43");
        fileSource.setUploadTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        fileSource.setDescription("这是一次测试!");
        fileSourceMapper.insertSelective(fileSource);
    }

    @Test
    public void testFileSourceSelectByPrimaryKeyWithMember() {
        FileSource fileSource = fileSourceMapper.selectByPrimaryKeyWithMember(1);
        System.out.println(fileSource.toString2());
    }

    @Test
    public void testFileSourceGrtWithMember() {
        List<FileSource> fileSourceList = fileSourceMapper.selectByExampleWithMember(null);
        for (FileSource fileSource : fileSourceList) {
            System.out.println(fileSource.toString2());
        }
    }

    @Test
    public void testSearchMemberByCondition() {
        List<Member> memberList = memberMapper.getAllWithCondition("");
        for (Member member : memberList) {
            System.out.println(member.toString());
        }
    }

    @Test
    public void testSearchFileSourceByCondition() {
        List<FileSource> fileSourceList = fileSourceMapper.getAllWithCondition("dd");
        for (FileSource fileSource : fileSourceList) {
            System.out.println(fileSource.toString2());
        }
    }

    @Test
    public void testGetAllFileSourcesByMemerId() {
        List<FileSource> fileSourceList = fileSourceMapper.selectByExampleWithMemberByMemberId("4f9cc776-64d0-4e");
        for (FileSource fileSource : fileSourceList) {
            System.out.println(fileSource.toString2());
        }
    }

    @Test
    public void testCheckMemberName() {
        Long num = memberMapper.checkMemberName("nan");
        System.out.println(num);
    }
}
