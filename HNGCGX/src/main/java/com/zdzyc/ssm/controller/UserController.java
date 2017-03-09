package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.model.UserVo;
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
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;


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

            //输出错误信息
            List<ObjectError> allErrors = result.getAllErrors();//接受检验错误结果

            List<String> listErrors = new ArrayList<>();//自定义一个list接受自己编码后的提示字符串，在把自己定义的list传到界面，
            //这样就解决了把乱码传到界面的问题了

            for (ObjectError objectError : allErrors) {
                //输出错误信息
                String strError = null; //把返回错误的提示再次编码
                try {
                    strError = new String(objectError.getDefaultMessage().getBytes("ISO-8859-1"), "UTF-8");
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
                listErrors.add(strError);//把编码好的错误提示信息加自己定义好list集合里面去
                //错误提示信息如果没有出现乱码的话可以自己把   allErrors 这个错误结果直接返回界面的，
                //但是出现了乱码不能直接把结果返回界面,我不懂怎么样在界面编码所以只能在返回之前就解决乱码的问题
            }
            model.addAttribute("errors", listErrors);
            return "login";
        }

        User m_user = userService.selectByName(user.getUserName());

        if (!StringUtils.isEmpty(m_user)) {
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
    public String addUser(Model model, UserVo userVo) {

        User user = new User();
        user.setUserName(userVo.getUserName());
        user.setUserPwd(userVo.getUserName());
        user.setUserPhone(userVo.getUserName());
        user.setUserName(userVo.getUserName());
        user.setUserName(userVo.getUserName());
        user.setUserName(userVo.getUserName());
        user.setUserName(userVo.getUserName());
        userService.addUser(user);
        return "redirect:/index.jsp";
    }


}  