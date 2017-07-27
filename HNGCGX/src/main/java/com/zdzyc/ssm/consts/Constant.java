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

    private final static String ALLTYPE[] = {"办公建筑","商业酒店","住宅建筑","别墅建筑","景观小品","医疗建筑","其他",};


    public static String getProjectType(int type){
        return ALLTYPE[type];
    }

    public static int getProjectType(String name){
        for (int i = 0; i < ALLTYPE.length; i++) {
            if (ALLTYPE[i].equals(name)){
                return i;
            }
        }
        return 0;
    }
}
