package com.baizhi.zcn.dao;

import com.baizhi.zcn.entity.User;
import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User> {

    User queryByUsername(String username);

}