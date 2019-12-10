package com.edu.Controller;

import com.edu.Pojo.Goods_records;
import com.edu.Pojo.Trade;
import com.edu.Pojo.User;
import com.edu.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/5 15:44
 */
@Controller
@RequestMapping("/Admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public ModelAndView admins(){
        return new ModelAndView("Admin/checker");
    }

    @RequestMapping(value = "/update.do",method = RequestMethod.GET)
    public ModelAndView updates(@RequestParam String account){
        ModelAndView mav = new ModelAndView("Admin/checker");
        mav.addObject("flag","3");
        mav.addObject("account",account);
        return  mav;
    }

    @RequestMapping(value = "/update_Trade.do",method = RequestMethod.GET)
    public ModelAndView update_Trades(@RequestParam String trade_id,@RequestParam String trade_type,@RequestParam String trade_type_id){
        ModelAndView mav = new ModelAndView("Admin/trade");
        mav.addObject("flag","3");
        mav.addObject("trade_id",trade_id);
        mav.addObject("trade_type",trade_type);
        mav.addObject("trade_type_id",trade_type_id);
        return  mav;
    }

    @RequestMapping(value = "delete.do",method = RequestMethod.GET)
    public void deletes(@RequestParam String account, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setAccount(account);
        boolean flags = adminService.deletes(user);
        //ModelAndView mav = new ModelAndView(url);
        if(flags)
            request.setAttribute("flag", "4");
            //request.setAttribute("flag", "4");
            //mav.addObject("flag","4");
        else
            request.setAttribute("flag", "-4");
            //request.setAttribute("flag", "-4");
            //mav.addObject("flag","-4");
        request.getRequestDispatcher("/queryStaff.do").forward(request,response);
        //response.sendRedirect(url);
        //request.getRequestDispatcher(url).forward(request, response);
    }

    @RequestMapping(value = "/delete_record.do",method = RequestMethod.GET)
    public void delete_records(@RequestParam String goods_id, @RequestParam String flag1,HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        Goods_records goods_records = new Goods_records();
        goods_records.setGoods_id(goods_id);
        boolean flags = adminService.delete_record(goods_records);
        //ModelAndView mav = new ModelAndView(url);
        request.setAttribute("flag",flag1);
        if(flags)
            request.setAttribute("flag1", "4");
            //request.setAttribute("flag", "4");
            //mav.addObject("flag","4");
        else
            request.setAttribute("flag1", "-4");
        //request.setAttribute("flag", "-4");
        //mav.addObject("flag","-4");
        request.getRequestDispatcher("/queryRecord.do").forward(request,response);
        //response.sendRedirect(url);
        //request.getRequestDispatcher(url).forward(request, response);
    }

    @RequestMapping(value = "delete_Trade.do",method = RequestMethod.GET)
    public void delete_Trades(@RequestParam String trade_id, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Trade trade = new Trade();
        trade.setTrade_id(trade_id);
        boolean flags = adminService.delete_Trade(trade);
        //ModelAndView mav = new ModelAndView(url);
        if(flags)
            request.setAttribute("flag", "4");
            //request.setAttribute("flag", "4");
            //mav.addObject("flag","4");
        else
            request.setAttribute("flag", "-4");
        //request.setAttribute("flag", "-4");
        //mav.addObject("flag","-4");
        request.getRequestDispatcher("/queryTrade.do").forward(request,response);
        //response.sendRedirect(url);
        //request.getRequestDispatcher(url).forward(request, response);
    }

    @RequestMapping(value = "/addchecker.do",method = RequestMethod.GET)
    public ModelAndView addchecker(){
        ModelAndView mav = new ModelAndView("Admin/checker");
        mav.addObject("account","");
        return mav;
    }

    @RequestMapping(value = "/addtrade.do",method = RequestMethod.GET)
    public ModelAndView addtrade(){
        List<Trade> type = adminService.queryTypeAll(null);
        ModelAndView mav = new ModelAndView("Admin/trade");
        for(Trade s:type)
            System.out.println(s);
        mav.addObject("list",type);
        return mav;
    }

    @RequestMapping(value = "/addtrade.do",method = RequestMethod.POST)
    public ModelAndView addtrade1(@RequestParam String trade_type, @RequestParam String trade_type_id, @RequestParam String trade_id,
                                  @RequestParam String trade_name, @RequestParam String trade_value,@RequestParam String trade_number,
                                  @RequestParam String check,HttpServletResponse response)throws ServletException, IOException{
        ModelAndView mav = new ModelAndView("Admin/trade") ;
        Trade trade = new Trade();
        trade.setTrade_id(trade_id);
        trade.setTrade_type(trade_type);
        trade.setTrade_number(Integer.parseInt(trade_number));
        trade.setTrade_value(Double.parseDouble(trade_value));
        trade.setTrade_name(trade_name);
        trade.setTrade_type_id(trade_type_id);
        boolean flag = false;
        System.out.println(check);
        if(check.equals("1")) {
            flag = adminService.insertTrade(trade);
            System.out.println("check m ="+flag);
            if(flag)
                mav.addObject("flag","1");
            else
                mav.addObject("flag","0");
        }
        else if(check.equals("0")){
            flag = adminService.updatasTrade(trade);
            System.out.println("check m = "+flag);
            if (flag)
                mav.addObject("flag", "4");
            else
                mav.addObject("flag", "5");
        }
        return mav;
    }

    @RequestMapping("/query_id")
    public @ResponseBody Map<String,Object> queryAll(String trade_type) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        Trade trade = new Trade();
        trade.setTrade_type(trade_type);
        List<Trade> trades = null;
        List list1 = null;
        list1 = new ArrayList();
        trades = adminService.queryTypeAll(trade);
        System.out.println(trades);
        Map<String,String> taskMaps = new HashMap<String,String>();
        taskMaps.put("trade_id",trades.get(0).getTrade_type_id());
        list1.add(taskMaps);
        map.put("tasks",list1);
        return map;
    }

    @RequestMapping("/query_ids")
    public @ResponseBody Map<String,Object> queryAlls(String trade_id) throws Exception{
        Map<String,Object> map = new HashMap<String,Object>();
        Trade trade = new Trade();
        trade.setTrade_id(trade_id);
        List<Trade> trades = null;
        List list1 = null;
        list1 = new ArrayList();
        trades = adminService.queryAll(trade);
        System.out.println(trades);
        Map<String,String> taskMaps = new HashMap<String,String>();
        System.out.println(trade_id);
        if(trades.isEmpty()){
            taskMaps.put("trade_name","");
            taskMaps.put("trade_type","");
        }
        else {
            System.out.println(trades.get(0).getTrade_name()+"  "+trades.get(0).getTrade_type());
            taskMaps.put("trade_name",trades.get(0).getTrade_name());
            taskMaps.put("trade_type",trades.get(0).getTrade_type());
        }
        list1.add(taskMaps);
        map.put("tasks",list1);
        return map;
    }

    @RequestMapping(value = "/addchecker.do",method = RequestMethod.POST)
    public ModelAndView addcheckers(@RequestParam String account, @RequestParam String passwords, @RequestParam String username,
                                    @RequestParam String sex, @RequestParam String birthday, @RequestParam String phone,
                                    @RequestParam String positions,@RequestParam String check, HttpServletRequest request, HttpServletResponse response){
        User user = new User();
        user.setAccount(account);
        user.setSex(sex);
        user.setPhone(phone);
        user.setBirthday(Date.valueOf(birthday));
        user.setUsername(username);
        user.setPasswords(passwords);
        if(positions.equals("管理员"))
            user.setPositions(0);
        else
            user.setPositions(1);
        System.out.println(user);
        boolean m = false;
        System.out.println(check);
        ModelAndView mav = new ModelAndView("Admin/checker");
        if(check.equals("1")) {
            m = adminService.AddChecker(user);
            System.out.println("check m ="+m);
            if(m)
                mav.addObject("flag","1");
            else
                mav.addObject("flag","2");
        }
        else if(check.equals("0")){
            m = adminService.updatasType(user);
            System.out.println("check m = "+m);
            if (m)
                mav.addObject("flag", "4");
             else
                mav.addObject("flag", "5");
        }
        return  mav;
    }

}
