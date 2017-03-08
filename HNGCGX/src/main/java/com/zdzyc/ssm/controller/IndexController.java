package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;


@Controller
public class IndexController {

    @RequestMapping("/index")
    public String index(Model model) {

        return "index";
    }

}  