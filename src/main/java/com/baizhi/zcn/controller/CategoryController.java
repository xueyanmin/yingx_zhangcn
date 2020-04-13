package com.baizhi.zcn.controller;

import com.baizhi.zcn.entity.Category;
import com.baizhi.zcn.service.CategoryService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;

@RestController
@RequestMapping("category")
public class CategoryController {

    @Resource
    CategoryService categoryService;
    /**一级类别*/
    @RequestMapping("queryByOnePage")
    public HashMap<String,Object> queryByOnePage(Integer page,Integer rows){
        HashMap<String, Object> map = categoryService.queryByOnPage(page, rows);
        return map;
    }

    /**一级类别下对应的二级类别*/
    @RequestMapping("queryByTwoPage")
    public HashMap<String,Object> queryByTwoPage(Integer page,Integer rows,String parentId){
        HashMap<String, Object> map = categoryService.queryByTwoPage(page, rows, parentId);
        return map;
    }

    @RequestMapping("edit")
    public String edit(Category category,String oper){

        String uid = null;
        if (oper.equals("add")){

        }
        if(oper.equals("edit")){

        }
        if(oper.equals("del")){

        }

        return uid;
    }
}
