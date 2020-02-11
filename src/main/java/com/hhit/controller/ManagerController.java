package com.hhit.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hhit.bean.FileSource;
import com.hhit.bean.Manager;
import com.hhit.service.ManagerService;
import com.hhit.service.MemberService;
import com.hhit.util.EncryptUtil;
import com.hhit.vo.Message;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

/**
 * 处理管理员事务
 */
@Controller
public class ManagerController {
    @Autowired
    ManagerService managerService;

    /**
     * 查询所有的管理员信息
     * 真的犯傻！！！要他何用？
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAllManagers")
    public Message getAllManagers(@RequestParam(value = "pageBun", defaultValue = "1") Integer pageNum) {
        //分页
        String orderby = "id asc";
        PageHelper.startPage(pageNum, 5, orderby);
        List<Manager> managerList = managerService.getAllManagers();
        PageInfo managerPageInfo = new PageInfo(managerList, 5);

        return Message.success().add("managerPageInfo", managerPageInfo);
    }

    /**
     * 管理员登录
     *
     * @param request
     * @param response
     */
    @RequestMapping("/managerLogin")
    public void managerLogin(HttpServletRequest request, HttpServletResponse response) {
        String managerName = request.getParameter("managerName");
        String managerPassword = request.getParameter("managerPassword");
        System.out.println(managerName+"---"+managerPassword);
        Manager loginManagerInfo = managerService.managerLogin(managerName, EncryptUtil.md5Crypt(managerPassword));
        if (loginManagerInfo != null) {
            try {
                loginManagerInfo.setManagerPassword(managerPassword);
                request.getSession().setAttribute("loginManagerInfo", loginManagerInfo);
                response.sendRedirect(request.getContextPath() + "/page/background/home.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.sendRedirect(request.getContextPath() + "/page/error.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 更新管理员信息
     *
     * @param manager
     * @return
     */
    @RequestMapping(value = "/managerEdit/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Message managerEdit(Manager manager) {
        managerService.editManager(manager);
        return Message.success();
    }


}
