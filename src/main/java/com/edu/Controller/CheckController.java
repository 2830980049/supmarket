package com.edu.Controller;

import com.edu.Pojo.Goods_records;
import com.edu.Pojo.Trade;
import com.edu.Service.AdminService;
import com.edu.Service.CheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/9 23:05
 */
@Controller
@RequestMapping("/Check")
public class CheckController {
    @Autowired
    CheckerService checkerService;
    @RequestMapping(value = "/addsell.do",method = RequestMethod.POST)
    public ModelAndView addtrade1(@RequestParam String trade_id, @RequestParam String trade_name, @RequestParam String trade_type, @RequestParam String discount_type,
                                  @RequestParam String trade_number, HttpServletResponse response)throws ServletException, IOException {
        ModelAndView mav = new ModelAndView("Checker/Create_trade") ;
        Integer max = checkerService.Maxs();
        max += 1;
        Goods_records goods_records = new Goods_records();
        goods_records.setGoods_id(max.toString());
        goods_records.setTrade_id(trade_id);
        goods_records.setTrade_type(trade_type);
        goods_records.setTrade_number(Integer.parseInt(trade_number));
        goods_records.setTrade_name(trade_name);
        goods_records.setStatus("已出售");
        goods_records.setDiscount_type(discount_type);
        System.out.println(goods_records);
        boolean m = checkerService.addGoods(goods_records);
        System.out.println("maxs m ="+max);
        if(m)
            mav.addObject("flag","1");
        else
            mav.addObject("flag","0");
        return mav;
    }
}
