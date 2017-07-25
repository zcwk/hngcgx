package com.zdzyc.ssm.service;

import com.zdzyc.ssm.model.User;

/**
 * Created by zhoudezheng on 2017/3/5.
 */
public interface IUserService {

    User selectByPrimaryKey(Long id);

    User selectByUserPhone(String phone);

    Long addUser(User user);

}
