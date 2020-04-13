package com.baizhi.zcn;
import com.baizhi.zcn.dao.AdminDAO;
import com.baizhi.zcn.dao.UserMapper;
import com.baizhi.zcn.entity.Admin;
import com.baizhi.zcn.entity.User;
import com.baizhi.zcn.entity.UserExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class YingxZhangcnApplicationTests {

	@Resource
	AdminDAO adminDAO;


      @Resource
        UserMapper userMapper;


	@Test
	public void testquery(){
		User zcn = userMapper.queryByUsername("zcn");
		System.out.println(zcn);
	}

      @Test
	  public void query(){
		  List<User> users = userMapper.selectAll();
		  users.forEach(user -> System.out.println(user));
	  }
        /*@Test
        public void testquery(){
            //条件对象
            UserExample example = new UserExample();

            example.createCriteria().andIdEqualTo("1");

            List<User> users = userMapper.selectByExample(example);
            users.forEach(user -> System.out.println(user));
        }

        //多种方法插入
        @Test
        public void save(){
            //条件对象
            UserExample example = new UserExample();
            example.createCriteria().andIdEqualTo("3");
            //User  user = new User("4",null,"zcn","zcn","zcn","zcn","vvv",new Date());
            User user = new User();
            user.setId("3");
            user.setUsername("wwwwqqq");

            //可选修改
            userMapper.updateByExampleSelective(user,example);
            //serMapper.updateByExample(user,example);
            //userMapper.insertSelective(user);
            //users.forEach(user -> System.out.println(user));
        }

        //删除
        @Test
        public void delete(){
            //条件对象
            UserExample example = new UserExample();
            example.createCriteria().andIdEqualTo("4");

            //删除
            userMapper.deleteByExample(example);

        }

        //根据数量查询
        @Test
        public void testqueryCount(){
            UserExample example = new UserExample();

            long l = userMapper.countByExample(example);
            System.out.println(l);
        }

        @Test
        public void queryAll(){
            List<User> users = userMapper.queryAll();
            users.forEach(user -> System.out.println(user));
        }*/
	/*@Test
	public void contextLoads() {
		Admin admin = adminDAO.queryByUsername("1");
		System.out.println("----------------------");
		System.out.println(admin);
		System.out.println("----------------------");
	}*/

}
