package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.model.UserVo;
import com.zdzyc.ssm.service.IUserService;
import com.zdzyc.ssm.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;


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
    public String doLogin(@Validated @ModelAttribute("user") User user, BindingResult result, Model model) {
        //如果存在校验错误
        if (result.hasErrors()) {
            model.addAttribute("errors", Utils.changeUTF8(result));
            return "login";
        }

        User m_user = userService.selectByName(user.getUserName());

        if (!StringUtils.isEmpty(m_user)) {
            if (!m_user.getUserPwd().equals(user.getUserPwd())) {
                model.addAttribute("errors", "密码错误");
                return "login";
            }
            model.addAttribute("user", m_user);
            return "index";
        } else {
            model.addAttribute("errors", "该用户尚未注册");
            return "login";
        }
    }

    @RequestMapping("/register")
    public String register() {

        return "register";
    }

    @RequestMapping("/addUser")
    public String addUser(@Validated @ModelAttribute("userVo") UserVo userVo, BindingResult result, Model model) {
        //如果存在校验错误
        if (result.hasErrors()) {
            model.addAttribute("errors", Utils.changeUTF8(result));
            return "register";
        }

        if (!userVo.getUserPwd().equals(userVo.getUserPwd2())) {
            model.addAttribute("errors", "两次密码不一致");
            return "register";
        }

        if (!Utils.isMobile(userVo.getUserPhone())) {
            model.addAttribute("errors", "请正确输入电话号码");
            return "register";
        }


        User user = new User();
        user.setUserName(userVo.getUserName());
        user.setUserPwd(userVo.getUserPwd());
        user.setUserPhone(userVo.getUserPhone());
        user.setUserEmail(userVo.getUserEmail());
        user.setUserDetail(userVo.getUserDetail());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        Date date = new Date();
        df.format(date);
        user.setCreateTime(date);

        Long count = null;
        try {
            count = userService.addUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (count > 0) {
            return "login";
        } else {
            model.addAttribute("errors", "注册失败");
            return "register";
        }


    }


}  