package com.zdzyc.ssm.service.impl;


import com.zdzyc.ssm.dao.UserMapper;
import com.zdzyc.ssm.model.User;
import com.zdzyc.ssm.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Transactional
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Resource
    public UserMapper userMapper;

    @Override
    public User selectByPrimaryKey(Long id) {
        return this.userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addUser(User user) {
        this.addUser(user);
    }

}
