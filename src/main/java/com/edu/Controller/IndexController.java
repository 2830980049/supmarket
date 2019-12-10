package com.edu.Controller;

import com.edu.Pojo.User;
import com.edu.Service.CheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/4 14:40
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    CheckerService checkerService;

    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/queryStaffs.do",method = RequestMethod.GET)
    public ModelAndView queryStaffs(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView("Admin/AllStaff");
        System.out.println("flag = " + (String)request.getAttribute("flag"));
        mav.addObject("flag",(String)request.getAttribute("flag"));
        return mav;
    }

    @RequestMapping(value = "/queryTrades.do",method = RequestMethod.GET)
    public ModelAndView queryTrades(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView("Admin/AllTrade");
        System.out.println("flag = " + (String)request.getAttribute("flag"));
        mav.addObject("flag",(String)request.getAttribute("flag"));
        return mav;
    }

    @RequestMapping(value = "/queryRecords.do",method = RequestMethod.GET)
    public ModelAndView queryRecords(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = null;
        //System.out.println("queryRecords flag equals "+request.getAttribute("flag").equals(null));
        //System.out.println("queryRecords flag1 equals "+request.getAttribute("flag1").equals(null));
        //System.out.println("queryRecords flag  "+request.getAttribute("flag"));
        //System.out.println("queryRecords flag1  "+request.getAttribute("flag1"));
        //System.out.println("queryRecords flag getParameter "+request.getParameter("flag").isEmpty());
        Object obj = null;
        obj = request.getAttribute("flag");
        Object boj1 = null;
        boj1 = request.getParameter("flag");
        if (obj == null) {
            if(request.getParameter("flag").equals("0"))
                mav = new ModelAndView("Admin/records");
            else
                mav = new ModelAndView("Checker/Return_goods");
        }
        else {
            if(request.getAttribute("flag").equals("0"))
                mav = new ModelAndView("Admin/records");
            else
                mav = new ModelAndView("Checker/Return_goods");
        }
        mav.addObject("flag1", (String) request.getAttribute("flag1"));
        return mav;
    }

    @RequestMapping(value = "/addSells.do",method = RequestMethod.GET)
    public ModelAndView addSells(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mav = new ModelAndView("Checker/Create_trade");
        //System.out.println("flag = " + (String)request.getAttribute("flag"));
        mav.addObject("flag",(String)request.getAttribute("flag"));
        return mav;
    }

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public ModelAndView loginSubmit(@RequestParam String loginname, @RequestParam String password, HttpServletRequest request){
        User user = new User();
        user.setAccount(loginname);
        user.setPasswords(password);
        user = checkerService.selectOne(user);
        System.out.println(user);
        if(user != null){
            request.getSession().setAttribute("user", user);
            switch (user.getPositions().toString()){
                case "0":
                    return new ModelAndView("Admin/Start");

                case "1":
                    return new ModelAndView("Checker/Start");
                default:
                    return  new ModelAndView("login","msg","用户名或者密码错误");
            }
        }
        else
            return  new ModelAndView("login","msg","用户名或者密码错误");
    }

    @RequestMapping(value = "/discount")
    public void discounts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer num = Integer.parseInt((String)request.getAttribute("num"));
        System.out.println(num);
        File file = null;
        if (num < 200)
            file = new File("Checker/No_discount");
            else if(num >= 200 && num < 500)
                 file = new File("Checker/discount1");
                    else file = new File("Checker/discount2");
        String str = null;
        StringBuffer buf = new StringBuffer();
        try {
            Reader in = new FileReader(file);
            char[] cs = new char[1];
            int len = -1;

            while ((len = in.read(cs)) != -1) {
                buf.append(new String(cs, 0, len));
            }
            in.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (
                IOException e) {
            e.printStackTrace();
        }
        str = buf.toString();
        request.setAttribute("str",str);
        request.getRequestDispatcher("/queryRecord.do").forward(request,response);
    }


}
