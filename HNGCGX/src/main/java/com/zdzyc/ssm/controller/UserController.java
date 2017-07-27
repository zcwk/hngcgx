package com.zdzyc.ssm.controller;


import com.zdzyc.ssm.consts.Constant;
import com.zdzyc.ssm.dao.UserMapper;
import com.zdzyc.ssm.model.Project;
import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.model.UserVo;
import com.zdzyc.ssm.qcloud.QCloud;
import com.zdzyc.ssm.qcloud.Result;
import com.zdzyc.ssm.service.IProjectService;
import com.zdzyc.ssm.service.IUserService;
import com.zdzyc.ssm.utils.FileUpload;
import com.zdzyc.ssm.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;

    @Resource
    private IProjectService projectService;

    @RequestMapping("/goLogin")
    public String goLogin() {

        return "login";
    }

    @RequestMapping("/upload")
    public String goUpload(HttpServletRequest request, Model model) {

        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return "login";
        }
        model.addAttribute("user", user);


        List<String> typeList = new ArrayList<>();
        for (int i = 0; i < Constant.ALLTYPE.length; i++) {
            typeList.add(Constant.ALLTYPE[i]);
        }
        model.addAttribute("typeList", typeList);

        return "upLoad";
    }

    @RequestMapping(value = "/update/{projectId}", method = RequestMethod.GET)
    public String update(@PathVariable("projectId") int projectId, HttpServletRequest request, Model model) {

        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return "login";
        }
        model.addAttribute("user", user);

        List<String> typeList = new ArrayList<>();
        for (int i = 0; i < Constant.ALLTYPE.length; i++) {
            typeList.add(Constant.ALLTYPE[i]);
        }
        model.addAttribute("typeList", typeList);

        Project project = projectService.selectProjectById(projectId);
        if (project != null)
            model.addAttribute("project", project);
        return "update";
    }

    @RequestMapping(value = "/delete/{projectId}", method = RequestMethod.GET)
    public String delete(@PathVariable("projectId") int projectId, HttpServletRequest request, Model model) {

        int ok = projectService.deleteProject(projectId);

        return "redirect:/user/goUserHomePage";
    }

    @RequestMapping("/doUpload")
    public String doUpload(@Validated @ModelAttribute("project") Project project, HttpServletRequest request, Model model, MultipartFile updateImage, MultipartFile updateFile) {
        User user = (User) request.getSession().getAttribute("loginUser");
        if (user == null) {
            return "login";
        }

        if (project != null) {
            project.setUserId(user.getId());
            //原始名称
            String originalFilename = updateImage.getOriginalFilename();
            //上传图片
            if (updateImage != null && originalFilename != null && originalFilename.length() > 0) {
                try {
                    String url = FileUpload.uploadFile(updateImage, request, "images/", String.valueOf(project.getId()));
                    project.setImages(url);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //原始名称
            String projectFilename = updateFile.getOriginalFilename();
            //上传文件
            if (updateFile != null && projectFilename != null && projectFilename.length() > 0) {
                try {
                    String path = FileUpload.uploadFile(updateFile, request, "project/", String.valueOf(project.getId()));
                    project.setDownloadUrl(path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        projectService.insertProject(project);

        return "redirect:/user/goUserHomePage";
    }

    @RequestMapping(value = "/doUpdate/{projectId}")
    public String doUpdate(@PathVariable("projectId") int projectId, @Validated @ModelAttribute("project") Project project, HttpServletRequest request, Model model, MultipartFile updateImage, MultipartFile updateFile) {

        Project pro = projectService.selectProjectById(projectId);

        if (pro != null && project != null) {
            //原始名称
            String originalFilename = updateImage.getOriginalFilename();
            //上传图片
            if (originalFilename != null && originalFilename.length() > 0) {
                try {
                    String url = FileUpload.uploadFile(updateImage, request, "images/", String.valueOf(projectId));
                    pro.setImages(url);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            //原始名称
            String projectFilename = updateFile.getOriginalFilename();
            //上传文件
            if (projectFilename != null && projectFilename.length() > 0) {
                try {
                    String path = FileUpload.uploadFile(updateFile, request, "project/", String.valueOf(projectId));
                    pro.setDownloadUrl(path);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        projectService.updateProject(pro);

        return "redirect:/user/goUserHomePage";
    }

    @RequestMapping("/goUserHomePage")
    public String goUserHomePage(HttpServletRequest request, Model model) {
        User user = (User) request.getSession().getAttribute("loginUser");

        if (user == null) {
            return "login";
        }
        model.addAttribute("user", user);

        List<Project> list = projectService.selectProjectByUserId(user.getId());
        model.addAttribute("project", list);
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
                userNameCookie.setMaxAge(60 * 60 * 24);
                userNameCookie.setPath("/");
                userPhoneCookie.setMaxAge(60 * 60 * 24);
                userPhoneCookie.setPath("/");
                passwordCookie.setMaxAge(60 * 60 * 24);
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
    public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
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