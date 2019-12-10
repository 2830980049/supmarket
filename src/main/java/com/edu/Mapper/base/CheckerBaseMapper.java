package com.edu.Mapper.base;

import com.edu.Pojo.User;
import com.edu.Pojo.Goods_records;

import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 11:52
 */
public interface CheckerBaseMapper {
    int insert_goods_records (Goods_records goods_records);
    int delete_goods_records (Goods_records goods_records);
    int Max();
    List<User> queryChecker(User user);
}
