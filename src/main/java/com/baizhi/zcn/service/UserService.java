package com.baizhi.zcn.service;

import com.baizhi.zcn.entity.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

public interface UserService {
    public String add(User user);

    void uploadUser(MultipartFile headImg, String id, HttpServletRequest request);

    HashMap<String,Object> queryByPage(Integer page,Integer rows);

    void update(User user);

    void delete(User user);

    }
