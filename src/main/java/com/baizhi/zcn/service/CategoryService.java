package com.baizhi.zcn.service;

import com.baizhi.zcn.entity.Category;

import java.util.HashMap;

public interface CategoryService {

    //查询一级类别
    HashMap<String,Object> queryByOnPage(Integer page,Integer rows);

    //查询一级类别下对应的二级类别
    HashMap<String,Object> queryByTwoPage(Integer page,Integer rows,String parentId);

    /*删除一级类别*/
    HashMap<String,Object> delete(Category category);

}
