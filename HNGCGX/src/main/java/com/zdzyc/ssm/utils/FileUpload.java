package com.zdzyc.ssm.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

/**
 * Created by zhoudezheng on 2017/7/27.
 */
public class FileUpload {

    //文件上传
    public static String uploadFile(MultipartFile file, HttpServletRequest request, String paths) throws IOException {
        String fileName = file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath(paths);
        File tempFile = new File(path, new Date().getTime() + String.valueOf(fileName));
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);
        return "images/" + tempFile.getName();
    }
}
