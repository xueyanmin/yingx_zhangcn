package com.baizhi.zcn.dao;

import com.baizhi.zcn.entity.Admin;

public interface AdminDAO {
   Admin queryByUsername(String Username);
   Admin queryByUsername(Admin admin);
}
