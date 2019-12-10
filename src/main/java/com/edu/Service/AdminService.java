package com.edu.Service;

import com.edu.Mapper.base.AdminBaseMapper;
import com.edu.Pojo.Goods_records;
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

    public boolean checkIds(Trade trade){
        List<Trade> trades = null;
        trades = adminBaseMapper.queryTradeAll(trade);
        if(trades.isEmpty())
            return false;
        return true;
    }

    public boolean insertTrade(Trade trade){
        int flag = adminBaseMapper.insertTrade(trade);
        if(flag > 0)
            return true;
        return false;
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

    public boolean delete_Trade(Trade trade){
        int m = adminBaseMapper.deleteTrade(trade);
        if(m > 0)
            return true;
        return false;
    }

    public boolean delete_record(Goods_records goods_records){
        int m = adminBaseMapper.deleteRecord(goods_records);
        if(m > 0)
            return true;
        return false;
    }

    public List<Trade> queryTypeAll(Trade trade){
        List<Trade> list = null;
        list = adminBaseMapper.queryTrade_TypeAll(trade);
        return list;
    }

    public boolean updatasType(User user){
        int m = adminBaseMapper.updataChecker(user);
        if(m > 0)
            return true;
        return false;
    }

    public boolean updatasTrade(Trade trade){
        int m = adminBaseMapper.updataTrade(trade);
        if(m > 0)
            return true;
        return false;
    }

    public List<Goods_records> queryRecord(){
        List<Goods_records> list = adminBaseMapper.queryRecord();
        return list;
    }

    public List<Trade> queryAll(Trade trade){
        List<Trade> list = adminBaseMapper.queryTradeAll(trade);
        System.out.println(list.get(0));
        return list;
    }


}
