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
    public static String uploadFile(MultipartFile file, HttpServletRequest request, String paths,String id) throws IOException {
        String fileName = file.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath(paths);
        File tempFile = new File(path, id + String.valueOf(fileName));
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }else{
            tempFile.delete();
        }
        file.transferTo(tempFile);
        return paths + tempFile.getName();
    }
}
