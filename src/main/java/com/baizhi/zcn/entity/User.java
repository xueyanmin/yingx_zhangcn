package com.baizhi.zcn.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Table(name =" yx_user")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    private String id;

    private String username;

    private String phone;

    @Column(name = "head_img")
    private String headImg;

    private String sign;

    private String wechat;

    private String status;

    @Column(name = "create_date")
    private Date createDate;

}