package com.baizhi.zcn.serviceImpl;

import com.baizhi.zcn.dao.CategoryMapper;
import com.baizhi.zcn.entity.Category;
import com.baizhi.zcn.entity.CategoryExample;
import com.baizhi.zcn.service.CategoryService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.soap.SAAJResult;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Resource
    CategoryMapper categoryMapper;

    @Override
    public HashMap<String, Object> queryByOnPage(Integer page, Integer rows) {
        //存取数据返回
        HashMap<String, Object> map = new HashMap<>();

        //分装数据
        //总条数 records
        CategoryExample example = new CategoryExample();
        example.createCriteria().andLevelsEqualTo("1");
        Integer records = categoryMapper.selectCountByExample(example);
        map.put("records",records);

        //总页数 total = 总条数/每页展示条数 判断是否有余数
        Integer total = records % rows == 0?records/rows:records/rows+1;
        map.put("total",total);

        //当前页 page
        map.put("page",page);

        //数据 rows
        //创建RowBounds 传递参数 忽略条数 获取条数
        RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
        List<Category> category = categoryMapper.selectByExampleAndRowBounds(example, rowBounds);
        map.put("rows",category);
        return map;
    }

    @Override
    public HashMap<String, Object> queryByTwoPage(Integer page, Integer rows, String parentId) {

        //存取数据返回
        HashMap<String, Object> map = new HashMap<>();
        //封装数据
        //总条数
        CategoryExample example = new CategoryExample();
        example.createCriteria().andParentIdEqualTo(parentId);
        Integer records = categoryMapper.selectCountByExample(example);
        map.put("records",records);

        //总页数 total 总条数/每页展示条数 再看是否有余数
        Integer total = records % rows == 0 ?records/rows:records/rows+1;
        map.put("total",total);

        //当前页 page
        map.put("page",page);

        //数据 rows
        //new RowBounds 需要传递的参数 忽略的条数 获取的条数
        RowBounds rowBounds = new RowBounds((page - 1) * rows, rows);
        List<Category> category = categoryMapper.selectByExampleAndRowBounds(example, rowBounds);
        map.put("rows",category);

        return map;
    }

    @Override
    public HashMap<String, Object> delete(Category category) {
        //判断删除的是一级类别还是二级类别

        //一级类别 判断是否有二级类别

        //二级类别 是否有视频

        return null;
    }
}
