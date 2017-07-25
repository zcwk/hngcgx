package com.zdzyc.ssm.dao;

import com.zdzyc.ssm.model.User;

/**
 * Created by zhoudezheng on 2017/3/3.
 */
public interface UserMapper {

    User selectByPrimaryKey(Long id);

    User selectByUserPhone(String userPhone);

    Long addUser(User user);

}
