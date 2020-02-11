package com.hhit.service;

import com.hhit.bean.Member;
import com.hhit.dao.MemberMapper;
import com.hhit.util.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    public List<Member> getAllMembers() {
        List<Member> memberList = memberMapper.selectByExample(null);
        return memberList;
    }

    public Member getMemberById(Integer id) {
        Member member = memberMapper.selectByPrimaryKey(id);
        return member;
    }

    public void updateMember(Member member) {
        member.setMemberPassword(EncryptUtil.md5Crypt(member.getMemberPassword()));
        memberMapper.updateByPrimaryKeySelective(member);
    }

    public void deleteMemberById(Integer id) {
        memberMapper.deleteByPrimaryKey(id);
    }

    public List<Member> getAllMembersWithCondition(String condition) {
        List<Member> memberList = memberMapper.getAllWithCondition(condition);
        return memberList;
    }

    public Member memberLogin(String memberName, String memberPassword) {
        Member member = memberMapper.memberLogin(memberName, memberPassword);
        return member;
    }

    public void saveMember(Member member) {
        memberMapper.insertSelective(member);
    }

    public boolean checkMemberName(String memberName) {
        Long num = memberMapper.checkMemberName(memberName);
        return num != 0 ? true : false;
    }
}
