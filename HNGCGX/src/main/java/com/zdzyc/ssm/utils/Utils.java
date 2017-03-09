package com.zdzyc.ssm.utils;

import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by zhoudezheng on 2017/3/9.
 */
public class Utils {

    public static List<String> changeUTF8(BindingResult result){
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

        return listErrors;
    }


    /**
     * 手机号验证
     * @author ：shijing
     * 2016年12月5日下午4:34:46
     * @param  str
     * @return 验证通过返回true
     */
    public static boolean isMobile(final String str) {
        Pattern p = null;
        Matcher m = null;
        boolean b = false;
        p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // 验证手机号
        m = p.matcher(str);
        b = m.matches();
        return b;
    }
}
