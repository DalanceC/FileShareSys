package com.hhit.dao;

import com.hhit.bean.FileSource;
import com.hhit.bean.FileSourceExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FileSourceMapper {
    long countByExample(FileSourceExample example);

    int deleteByExample(FileSourceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(FileSource record);

    int insertSelective(FileSource record);

    List<FileSource> selectByExample(FileSourceExample example);

    FileSource selectByPrimaryKey(Integer id);

    //带上用户查询start

    /**
     * 查询所有的文件
     *
     * @param example
     * @return
     */
    List<FileSource> selectByExampleWithMember(FileSourceExample example);

    /**
     * 通过id查询文件
     *
     * @param id
     * @return
     */
    FileSource selectByPrimaryKeyWithMember(Integer id);

    /**
     * 查询所有的文件
     *
     * @param memberId
     * @return
     */
    List<FileSource> selectByExampleWithMemberByMemberId(String memberId);
    //带上用户查询end

    int updateByExampleSelective(@Param("record") FileSource record, @Param("example") FileSourceExample example);

    int updateByExample(@Param("record") FileSource record, @Param("example") FileSourceExample example);

    int updateByPrimaryKeySelective(FileSource record);

    int updateByPrimaryKey(FileSource record);

    /**
     * 根据输入的用户名模糊查询数据
     * @param condition
     * @return
     */
    List<FileSource> getAllWithCondition(@Param("condition")String condition);

}