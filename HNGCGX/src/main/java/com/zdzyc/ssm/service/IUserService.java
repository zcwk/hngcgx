package com.zdzyc.ssm.service;

import com.zdzyc.ssm.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by zhoudezheng on 2017/3/5.
 */
public interface IUserService {

    User selectByPrimaryKey(Long id);

    void addUser(User user);

}
