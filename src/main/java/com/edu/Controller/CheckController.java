package com.edu.Controller;

import com.edu.Pojo.Goods_records;
import com.edu.Pojo.Trade;
import com.edu.Service.AdminService;
import com.edu.Service.CheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;

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

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/addsell.do",method = RequestMethod.POST)
    public ModelAndView addtrade1(@RequestParam String trade_id, @RequestParam String trade_name, @RequestParam String trade_type, @RequestParam String discount_type,
                                  @RequestParam String trade_number,HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ModelAndView mav = new ModelAndView("Checker/Create_trade") ;
        Integer max = checkerService.Maxs();
        max += 1;
        Goods_records goods_records = new Goods_records();
        goods_records.setGoods_id(max);
        goods_records.setTrade_id(trade_id);

        Trade trade = new Trade();
        trade.setTrade_id(trade_id);
        System.out.println("trade_id = "+trade.getTrade_id());
        List<Trade> list = adminService.queryAll(trade);
        Double num = list.get(0).getTrade_value();
        num = num * Integer.parseInt(trade_number);
        goods_records.setTrade_type(trade_type);
        goods_records.setTrade_number(Integer.parseInt(trade_number));
        goods_records.setTrade_name(trade_name);
        goods_records.setStatus("已出售");

        File sourceFile = null;
        if(num < 200)
            sourceFile = ResourceUtils.getFile("classpath:No_discount");
            else if(num >= 200 && num < 500)
                 sourceFile = ResourceUtils.getFile("classpath:discount1");
                else sourceFile = ResourceUtils.getFile("classpath:discount2");

        String discounts = null;

        StringBuffer buf = new StringBuffer();
        try {
            Reader in = new FileReader(sourceFile);
            char[] cs = new char[1];
            int len = -1;

            while ((len = in.read(cs)) != -1) {
                buf.append(new String(cs, 0, len));
            }
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        discounts = buf.toString();
        System.out.println(discounts);
        Double total = 0.0;
        if(discounts.equals("No discount")){ }
            else if(discounts.equals("Full 200 minus 50"))
                num -= 50;
                    else
                        num *= 0.7;
        goods_records.setDiscount_type(discounts);
        goods_records.setTotal(num);
        System.out.println(discounts);
        System.out.println(goods_records.getTotal());
        boolean m = checkerService.addGoods(goods_records);
        System.out.println("maxs m ="+max);
        if(m)
            mav.addObject("flag","1");
        else
            mav.addObject("flag","0");
        mav.addObject("total",num.toString());
        return mav;
    }

    @RequestMapping(value = "/updatestatus.do",method = RequestMethod.GET)
    public void updatestatus(@RequestParam String goods_id, @RequestParam String flag1,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Goods_records goods_records = new Goods_records();
        goods_records.setGoods_id(Integer.parseInt(goods_id));
        goods_records.setStatus("已退货");
        boolean flag = checkerService.updatestatus(goods_records);
        request.setAttribute("flag",flag1);
        //System.out.println("flag1  "+flag1);
        if (flag)
            request.setAttribute("flag1", "4");
        else
            request.setAttribute("flag1", "-4");
        //System.out.println(request.getContextPath()+"/queryRecord.do");
        request.getRequestDispatcher("/queryRecord.do").forward(request,response);
    }


}
