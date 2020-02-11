package com.hhit.service;

import com.hhit.bean.FileSource;
import com.hhit.dao.FileSourceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileSourceService {
    @Autowired
    FileSourceMapper fileSourceMapper;

    public List<FileSource> getAllFileSources() {
        List<FileSource> fileSourceList = fileSourceMapper.selectByExampleWithMember(null);
        return fileSourceList;
    }

    public void deleteFileSource(Integer id) {
        fileSourceMapper.deleteByPrimaryKey(id);
    }

    public List<FileSource> getAllFileSourcesWithCondition(String searchName) {
        List<FileSource> fileSourceList = fileSourceMapper.getAllWithCondition(searchName);
        return fileSourceList;
    }

    public void saveFileSource(FileSource fileSource) {
        fileSourceMapper.insertSelective(fileSource);
    }

    public FileSource getFileSourceById(Integer id) {
        FileSource fileSource = fileSourceMapper.selectByPrimaryKeyWithMember(id);
        return fileSource;
    }

    public List<FileSource> getFileSourcesByMemberId(String memberId) {
        List<FileSource> fileSourceList = fileSourceMapper.selectByExampleWithMemberByMemberId(memberId);
        return fileSourceList;
    }
}
