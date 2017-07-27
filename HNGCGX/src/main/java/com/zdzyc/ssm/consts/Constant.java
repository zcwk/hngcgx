package com.zdzyc.ssm.consts;

/**
 * Created by zhoudezheng on 2017/7/26.
 */
public class Constant {

    public final static int PT_WORK = 1;
    public final static int PT_HOTEL = 2;
    public final static int PT_HOME = 3;
    public final static int PT_VILLA = 4;
    public final static int PT_SCENERY = 5;
    public final static int PT_MEDICAL = 6;
    public final static int PT_OTHER = 7;


    public static String getProjectType(int type){
        String name = "办公建筑";
        switch (type){
            case PT_WORK:
                name = "办公建筑";
                break;
            case PT_HOTEL:
                name = "商业酒店";
                break;
            case PT_HOME:
                name = "住宅建筑";
                break;
            case PT_VILLA:
                name = "别墅建筑";
                break;
            case PT_SCENERY:
                name = "景观小品";
                break;
            case PT_MEDICAL:
                name = "医疗建筑";
                break;
            case PT_OTHER:
                name = "其他";
                break;
        }
        return name;
    }
}
