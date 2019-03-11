package com.sz.controller;

import com.sun.deploy.ui.AppInfo;
import com.sz.pojo.DevUser;
import com.sz.service.AppInfoService;
import com.sz.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dev")
public class DevUserController {
    @Autowired
    private  DevUserService devUserService;
    @Autowired
    private AppInfoService appInfoService;

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "dev/login";
    }

    @RequestMapping("/login")
    public String login(DevUser devUser, Model model, HttpSession session){
       DevUser devUser_1=devUserService.login(devUser);
        if(devUser_1 != null){
            session.setAttribute("devUser",devUser_1);
            return "dev/index";
        }else {
            model.addAttribute("errMsg","登录失败");
            return "dev/login";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("devUser");
        session.invalidate();
        return "redirect:/";
    }

}
