package com.hhit.dao;

import com.hhit.bean.Member;
import com.hhit.bean.MemberExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
    long countByExample(MemberExample example);

    int deleteByExample(MemberExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    int insertSelective(Member record);

    List<Member> selectByExample(MemberExample example);

    Member selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Member record, @Param("example") MemberExample example);

    int updateByExample(@Param("record") Member record, @Param("example") MemberExample example);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);

    /**
     * 用户登录
     *
     * @param memberName     登录名
     * @param memberPassword 密码
     * @return
     */
    Member memberLogin(@Param("memberName")String memberName, @Param("memberPassword")String memberPassword);

    /**
     * 根据输入的用户名模糊查询数据
     * @param condition
     * @return
     */
    List<Member> getAllWithCondition(@Param("condition")String condition);

    /**
     * 验证用户名是否已存在
     * @param memberName
     * @return
     */
    Long checkMemberName(@Param("memberName") String memberName);
}