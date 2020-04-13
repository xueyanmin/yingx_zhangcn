package com.baizhi.zcn.controller;

import com.baizhi.zcn.entity.User;
import com.baizhi.zcn.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;


@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    UserService userService;

    @RequestMapping("queryByPage")
    @ResponseBody
    public HashMap<String ,Object> queryByPage(Integer page,Integer rows){
        HashMap<String, Object> map = userService.queryByPage(page, rows);
        return map;
    }

    @RequestMapping("edit")
    @ResponseBody
    public String edit(User user, String oper) {


        //添加操作
        String uid = null;
        if (oper.equals("add")) {
            System.out.println(user);
            //调用的时候也得接受业务成返回的id
            uid = userService.add(user);
        }

        //修改操作
        if (oper.equals("edit")) {
            System.out.println(user);
            userService.update(user);
        }

        //删除操作
        if (oper.equals("del")) {

            userService.delete(user);
        }
        //把uid打成json返回
        return uid;
    }
    //文件修改操作
    @RequestMapping("uploadUser")
    public void uploadUser(MultipartFile headImg, String id, HttpServletRequest request) {
        userService.uploadUser(headImg, id, request);
    }


    //文件上传操作
    @RequestMapping("saveUser")
    public void saveUser(MultipartFile headImg, String id, HttpServletRequest request) {

        userService.uploadUser(headImg, id, request);
    }


    //文件删除操作
    @RequestMapping("deleteUser")
    public void deleteUser(User user) {

        userService.delete(user);

    }
}
