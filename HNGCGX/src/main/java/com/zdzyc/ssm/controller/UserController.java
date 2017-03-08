package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IUserService;
import com.zdzyc.ssm.service.impl.UserServiceImpl;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;

    @RequestMapping("/showUser")
    public String showUser(@RequestParam(value = "id") Long id, Model model) {

        User user = userService.selectByPrimaryKey(id);
        model.addAttribute("user", user);
        return "showUser";
    }

    @RequestMapping("/goLogin")
    public String goLogin() {

        return "login";
    }

    @RequestMapping("/doLogin")
    public String doLogin(Model model, String userName, String passWord) {

        if (StringUtils.isEmpty(userName)) {
            model.addAttribute("error","用户名不能为空");
            return "redirect:goLogin";
        }

        if (StringUtils.isEmpty(passWord)) {
            model.addAttribute("error","用户名不能为空");
            return "redirect:goLogin";
        }

        return "index";
    }

    @RequestMapping("/register")
    public String register() {

        return "register";
    }

    @RequestMapping("/addUser")
    public String addUser(Model model, User user) {

        userService.addUser(user);
        return "redirect:/index.jsp";
    }


}  