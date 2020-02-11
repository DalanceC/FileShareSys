package com.hhit.service;

import com.hhit.bean.FileSource;
import com.hhit.bean.Manager;
import com.hhit.bean.Member;
import com.hhit.dao.ManagerMapper;
import com.hhit.util.EncryptUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {

    @Autowired
    ManagerMapper managerMapper;



    public List<Manager> getAllManagers() {
        List<Manager> managerList = managerMapper.selectByExample(null);
        return managerList;
    }

    public Manager managerLogin(String managerName, String managerPassword) {
        Manager manager = managerMapper.managerLogin(managerName,managerPassword);
        return manager;
    }

    public void editManager(Manager manager) {
        String password = manager.getManagerPassword();
        manager.setManagerPassword(EncryptUtil.md5Crypt(password));
        managerMapper.updateByPrimaryKeySelective(manager);
    }
}
