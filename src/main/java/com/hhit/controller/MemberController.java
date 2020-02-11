package com.hhit.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hhit.bean.Member;
import com.hhit.service.MemberService;
import com.hhit.util.EncryptUtil;
import com.hhit.util.HeadImgEditUtil;
import com.hhit.util.MemberRegisterUtil;
import com.hhit.vo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 处理用户事务
 */

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    private String searchCondition = null;

    /**
     * 查询所有的用户信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getAllMembers")
    public Message getAllMembers(@RequestParam(value = "pageNum",
            defaultValue = "1") Integer pageNum) {
        //分页
        String orderby = "id asc";
        PageHelper.startPage(pageNum, 5, orderby);
        List<Member> memberList = memberService.getAllMembers();
        PageInfo memberPageInfo = new PageInfo(memberList, 5);
        return Message.success().add("memberPageInfo", memberPageInfo);
    }

    /**
     * 查询所有包含关键字的的用户信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/searchByMemberName")
    public Message getAllMembersWithCondition(String searchName) {
        //分页
        String orderby = "id asc";
        PageHelper.startPage(1, 5, orderby);
        searchCondition = searchName;
        List<Member> memberList = memberService.getAllMembersWithCondition(searchName);
        PageInfo memberPageInfo = new PageInfo(memberList, 5);
        return Message.success().add("memberPageInfo", memberPageInfo);
    }

    /**
     * 分页所有符合条件的用户信息
     * 将数据写在分页栏中
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/getMembersWithCondition")
    public Message getMembersWithCondition(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {
        //分页
        PageHelper.startPage(pageNum, 5);
        List<Member> memberList = memberService.getAllMembersWithCondition(searchCondition);
        PageInfo memberPageInfo = new PageInfo(memberList, 5);
        return Message.success().add("memberPageInfo", memberPageInfo);
    }


    /**
     * 根据id获取用户信息
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getMemberById/{id}", method = RequestMethod.GET)
    public Message getMemberById(@PathVariable("id") Integer id) {
        Member memberInfo = memberService.getMemberById(id);
        return Message.success().add("memberInfo", memberInfo);
    }

    /**
     * 更新用户信息
     *
     * @param member
     * @return
     */
    @RequestMapping(value = "/updateMember/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public Message updateMember(Member member) {
        memberService.updateMember(member);
        System.out.println(member);
        return Message.success();
    }

    /**
     * 删除用户信息
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteMember/{id}", method = RequestMethod.DELETE)
    public Message deleteMemberById(@PathVariable("id") Integer id) {
        memberService.deleteMemberById(id);
        return Message.success();
    }

    /**
     * 用户登录
     *
     * @param request
     * @param response
     */
    @RequestMapping("/memberLogin")
    public void memberLogin(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String memberName = request.getParameter("memberName");
        String memberPassword = request.getParameter("memberPassword");
        Member loginMemberInfo = memberService.memberLogin(memberName, EncryptUtil.md5Crypt(memberPassword));
        if (loginMemberInfo != null) {
            try {
                loginMemberInfo.setMemberPassword(memberPassword);
                request.getSession().setAttribute("loginMemberInfo", loginMemberInfo);
                response.sendRedirect(request.getContextPath() + "/page/front/mainPage.jsp");
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
     * 用户注册
     *
     * @param request
     * @param response
     */
    @RequestMapping("/memberRegister")
    public void memberRegister(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            Member member = MemberRegisterUtil.packageMemberInfo(request, response);
            if (member != null) {
                memberService.saveMember(member);
                response.sendRedirect(request.getContextPath() + "/page/front/memberLogin.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/page/error.jsp");
            }


        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户退出
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/memberExit")
    public void memberExit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("loginMemberInfo");
        response.sendRedirect(request.getContextPath() + "/page/front/memberLogin.jsp");
    }

    /**
     * 用户修改头像
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/editSelfHeadImg")
    public void editSelfHeadImg(HttpServletRequest request, HttpServletResponse response) {
        try {
            Member member = (Member) request.getSession().getAttribute("loginMemberInfo");
            String oldHeadImg = member.getHeadImg();
            Member laterMember = HeadImgEditUtil.editMemberHeadImg(member, request, response);
            String newHeadImg = laterMember.getHeadImg();
            if (!oldHeadImg.equals(newHeadImg)) {
                memberService.updateMember(laterMember);
                request.getRequestDispatcher("/memberExit").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/page/error.jsp");
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 验证用户的用户名是否存在
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/checkMemberName")
    public void checkMemberName(HttpServletRequest request, HttpServletResponse response) {
        String memberName = request.getParameter("inputMemberName");
        boolean isExit = memberService.checkMemberName(memberName);
        try {
            if (isExit) {
                response.getWriter().write("用户名已存在!");
            }else {
                response.getWriter().write("");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
