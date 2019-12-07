package com.edu.Service;

import com.edu.Mapper.base.AdminBaseMapper;
import com.edu.Pojo.Trade;
import com.edu.Pojo.User;
import org.aspectj.weaver.Checker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/5 15:50
 */
@Service
public class AdminService {
    @Autowired
    private AdminBaseMapper adminBaseMapper;

    public boolean AddChecker(User user){
        int m = adminBaseMapper.intsertChecker(user);
        if(m  > 0)
            return true;
        else
            return false;
    }

    public boolean checkNames(User user){
        List<User> users = null;
        users = adminBaseMapper.queryCheckerAll(user);
        if(users.isEmpty())
            return false;
        return true;
    }

    public List<User> queryStaffs(){
        List<User> users = null;
        users = adminBaseMapper.queryCheckerAll(null);
        if(users.isEmpty())
            return null;
        return users;
    }

    public boolean deletes(User user){
        int m = adminBaseMapper.deleteChecker(user);
        if(m > 0)
            return true;
        return false;
    }

    public List<Trade> queryTypeAll(){
        List<Trade> list = null;
        list = adminBaseMapper.queryTrade_TypeAll();
        return list;
    }

    public boolean updatasType(User user){
        int m = adminBaseMapper.updataChecker(user);
        if(m > 0)
            return true;
        return false;
    }

    public List<Trade> queryAll(){
        List<Trade> list = adminBaseMapper.queryTradeAll();
        return list;
    }

}
