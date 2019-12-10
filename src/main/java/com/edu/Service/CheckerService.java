package com.edu.Service;

import com.edu.Mapper.CheckerMapper;
import com.edu.Pojo.Goods_records;
import com.edu.Pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 13:33
 */

@Service
public class CheckerService {
    @Autowired
    private CheckerMapper checkerMapper;

    public User selectOne(User user){
        List<User> list = checkerMapper.queryChecker(user);
        if(list != null && list.size() > 1){
            throw  new RuntimeException("查询到多组数组");
        }
        if(list == null || list.size() == 0)
            return null;
        return list.get(0);
    }

    public int Maxs(){
        int id_max = checkerMapper.Max();
        return id_max;
    }

    public boolean addGoods(Goods_records goods_records){
        int flag = checkerMapper.insert_goods_records(goods_records);
        if(flag > 0)
            return true;
        return false;
    }

    public boolean updatestatus(Goods_records goods_records){
        int flag = checkerMapper.update_status(goods_records);
        if (flag > 0)
            return true;
        return false;
    }

}
