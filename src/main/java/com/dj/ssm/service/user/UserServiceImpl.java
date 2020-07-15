package com.dj.ssm.service.user;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.user.UserMapper;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.user.UserService;
import org.springframework.stereotype.Service;
/**
 * 用户service实现类
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
