package com.edu.Mapper.base;

import com.edu.Pojo.Trade;
import com.edu.Pojo.User;

import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 12:15
 */
public interface AdminBaseMapper {
    int intsertChecker(User user);
    int updataChecker(User user);
    int deleteChecker(User user);
    List<User> queryCheckerAll(User user);

    int insertTrade(Trade trade);
    int updataTrade(Trade trade);
    int deleteTrade(Trade trade);
    List<Trade>queryTradeAll();

    List<Trade>queryTrade_TypeAll(Trade trade);
}
