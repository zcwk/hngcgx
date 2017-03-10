package com.zdzyc.ssm.qcloud;


import com.alibaba.fastjson.JSON;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.request.CreateFolderRequest;
import com.qcloud.cos.request.StatFolderRequest;
import com.qcloud.cos.request.UploadFileRequest;
import com.qcloud.cos.sign.Credentials;

/**
 * Created by zhoudezheng on 2017/3/9.
 */
public class Qcloud {

    private static long appId = 1251496435;
    private static String secretId = "AKIDugGert1Ll15xc5uQIxY0JRO8sS3WoN2a";
    private static String secretKey = "WqytccR4dgcQ2Xq35vZ6dyCE4iASYXO3";
    // 设置要操作的bucket
    private static String bucketName = "hngczlgx";
    private static COSClient cosClient;

    public static Qcloud instance;

    public static Qcloud getIstance() {
        if (instance == null) {
            synchronized (Qcloud.class) {
                if (instance == null) {
                    instance = new Qcloud();
                }
            }
        }
        return instance;
    }

    private Qcloud() {
        // 初始化秘钥信息
        Credentials cred = new Credentials(appId, secretId, secretKey);

        // 初始化客户端配置
        ClientConfig clientConfig = new ClientConfig();
        // 设置bucket所在的区域，比如华南园区：gz； 华北园区：tj；华东园区：sh ；
        clientConfig.setRegion("gz");

        // 初始化cosClient
        cosClient = new COSClient(clientConfig, cred);
    }

    /**
     * @param userId
     * @param cosPath  /sample_file.txt
     * @param loclPath local_file_1.txt
     * @return
     */
    public static Requset uploadFile(String userId, String cosPath, String loclPath) {
        Requset requset = CreateFolder("/" + userId + "/");
        if (requset.getCode() == 0) {
            UploadFileRequest uploadFileRequest = new UploadFileRequest(bucketName, cosPath, loclPath);
            requset = JSON.parseObject(cosClient.uploadFile(uploadFileRequest), Requset.class);
        }
        return requset;
    }


    /**
     * 创建文件夹
     *
     * @param cosPath "/sample_folder/"
     */
    private static Requset CreateFolder(String cosPath) {
        Requset requset = isHasFolder(cosPath);
        if (requset.getCode() == 0) {
            CreateFolderRequest createFolderRequest = new CreateFolderRequest(bucketName, cosPath);
            return JSON.parseObject(cosClient.createFolder(createFolderRequest), Requset.class);
        } else {
            return requset;
        }
    }


    /**
     * @param cosPath "/sample_folder/"
     */
    private static Requset isHasFolder(String cosPath) {
        StatFolderRequest statFolderRequest = new StatFolderRequest(bucketName, cosPath);
        return JSON.parseObject(cosClient.statFolder(statFolderRequest), Requset.class);
    }

}
