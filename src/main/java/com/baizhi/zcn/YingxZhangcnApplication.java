package com.baizhi.zcn;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@MapperScan("com.baizhi.zcn.dao")
//@MapperScan("com.baizhi.zcn.dao")
@SpringBootApplication
public class YingxZhangcnApplication {

	public static void main(String[] args) {
		SpringApplication.run(YingxZhangcnApplication.class, args);
	}

}
