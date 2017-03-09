package com.zdzyc.ssm.dao;

import com.zdzyc.ssm.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/3.
 */
public interface UserMapper {

    User selectByPrimaryKey(Long id);

    User selectByName(String userName);

    void addUser(User user);

}
