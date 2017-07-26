package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.model.UserVo;
import com.zdzyc.ssm.qcloud.QCloud;
import com.zdzyc.ssm.qcloud.Result;
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
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


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

    @RequestMapping("/goUserHomePage")
    public String goUserHomePage() {

        return "userPage";
    }

    @RequestMapping("/doLogin")
    public String doLogin(@Validated @ModelAttribute("user") User user, BindingResult result, HttpServletResponse response, Model model) {
        //如果存在校验错误
        if (result.hasErrors()) {
            model.addAttribute("errors", Utils.changeUTF8(result));
            return "login";
        }

        User m_user = userService.selectByUserPhone(user.getUserPhone());

        if (!StringUtils.isEmpty(m_user)) {
            if (!m_user.getUserPwd().equals(user.getUserPwd())) {
                model.addAttribute("errors", "密码错误");
                return "login";
            }
            model.addAttribute("user", m_user);

            try {
                Cookie userNameCookie = new Cookie("UserName", URLEncoder.encode(m_user.getUserName(), "UTF-8"));
                Cookie userPhoneCookie = new Cookie("UserPhone", URLEncoder.encode(m_user.getUserPhone(), "UTF-8"));
                Cookie passwordCookie = new Cookie("UserPwd", URLEncoder.encode(m_user.getUserPwd(), "UTF-8"));
                userNameCookie.setMaxAge(60 * 60);
                userNameCookie.setPath("/");
                userPhoneCookie.setMaxAge(60 * 60);
                userPhoneCookie.setPath("/");
                passwordCookie.setMaxAge(60 * 60);
                passwordCookie.setPath("/");
                response.addCookie(userNameCookie);
                response.addCookie(userPhoneCookie);
                response.addCookie(passwordCookie);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "redirect:/index";
        } else {
            model.addAttribute("errors", "该用户尚未注册");
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model){
        User loginUser = (User) request.getSession().getAttribute("loginUser");
        try {
            Cookie userNameCookie = new Cookie("UserName", URLEncoder.encode(loginUser.getUserName(), "UTF-8"));
            Cookie userPhoneCookie = new Cookie("UserPhone", URLEncoder.encode(loginUser.getUserPhone(), "UTF-8"));
            Cookie passwordCookie = new Cookie("UserPwd", URLEncoder.encode(loginUser.getUserPwd(), "UTF-8"));
            userNameCookie.setMaxAge(0);
            userNameCookie.setPath("/");
            userPhoneCookie.setMaxAge(0);
            userPhoneCookie.setPath("/");
            passwordCookie.setMaxAge(0);
            passwordCookie.setPath("/");
            response.addCookie(userNameCookie);
            response.addCookie(userPhoneCookie);
            response.addCookie(passwordCookie);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        request.getSession().removeAttribute("loginUser");

        return "redirect:/index";
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

        User user = new User();
        user.setUserPwd(userVo.getUserPwd());
        user.setUserPhone(userVo.getUserPhone());

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


    //修改头像
    @RequestMapping("/editFaceSubmit")
    public String editItemSubmit(MultipartFile pictureFile) throws Exception {

        //原始文件名称
        String pictureFile_name = pictureFile.getOriginalFilename();
        //新文件名称
        String newFileName = UUID.randomUUID().toString() + pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

        //上传图片
        File uploadPic = new File("F:/develop/upload/temp/" + newFileName);

        if (!uploadPic.exists()) {
            uploadPic.mkdirs();
        }
        //向磁盘写文件
        pictureFile.transferTo(uploadPic);

        Result result = QCloud.getIstance().uploadFile("11", "", "");
        if (result.getCode() == 0) {

        }

        return "userPage";

    }

}