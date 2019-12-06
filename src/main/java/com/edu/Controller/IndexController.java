package com.edu.Controller;

import com.edu.Pojo.User;
import com.edu.Service.CheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

}
