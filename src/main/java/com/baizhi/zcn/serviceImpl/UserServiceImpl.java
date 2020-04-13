package com.baizhi.zcn.serviceImpl;

import com.baizhi.zcn.dao.UserMapper;
import com.baizhi.zcn.entity.User;
import com.baizhi.zcn.entity.UserExample;
import com.baizhi.zcn.service.UserService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Resource
    UserMapper userMapper;

    //添加的时候返回一个id
    @Override
    public String add(User user) {

        String uid = UUID.randomUUID().toString();
        user.setId(uid);
        user.setStatus("0");
        user.setCreateDate(new Date());

        userMapper.insert(user);

        //返回的Id是为了修改
        return uid;
    }


    //文件的上传与修改方法
    /*1:MultipartFile接受上传的文件 图片名称headImg
      2:接受id:responseText: "aa3f80ee-f6c9-44ae-8fac-9e12505c4cda"
      */
    @Override
    public void uploadUser(MultipartFile headImg, String id, HttpServletRequest request) {
        //上传步骤
        //1：根据相对路径获取绝对路径
        String realPath = request.getSession().getServletContext().getRealPath("/upload/photo");

        //判断是否有当前目录
        File file = new File(realPath);

        //存在取反，
        if (!file.exists()) {
            // 如果文件目录不存在,创建目录
            file.mkdirs();
        }

        //2：获取文件名
        String filename = headImg.getOriginalFilename();

        //拼接时间戳getTime()+"-"+filename
        String newName = new Date().getTime() + "-" + filename;

        try {

            //3：文件上传
            headImg.transferTo(new File(realPath, newName));

            //4：图片信息修改
            //修改的条件
            UserExample example = new UserExample();
            example.createCriteria().andIdEqualTo(id);

            User user = new User();
            user.setHeadImg(newName);  //设置修改的结果


            //修改数据
            userMapper.updateByExampleSelective(user, example);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public HashMap<String, Object> queryByPage(Integer page, Integer rows) {

       HashMap<String, Object> map = new HashMap<>();
       //工具栏封装数据
        //总体条数 records
        UserExample example = new UserExample();
        Integer records = userMapper.selectCountByExample(example);
        map.put("records",records);
        //总页数 total
        Integer total = records % rows==0? records/rows:records/rows+1;
        map.put("total",total);
        //当前页 page
        map.put("page",page);
        //数据
        RowBounds rowBounds = new RowBounds((page-1)*rows,rows);
        List<User> users = userMapper.selectByRowBounds(new User(), rowBounds);
        map.put("rows",users);

        return map;
    }

    @Override
    public void update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public void delete(User user) {
        userMapper.deleteByPrimaryKey(user);
    }

}
