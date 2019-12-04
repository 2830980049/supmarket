package com.edu.Controller;

import com.edu.Mapper.CheckerMapper;
import com.edu.Pojo.Checker;
import com.edu.Service.CheckerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value = "/login.do",method = RequestMethod.GET)
    public ModelAndView login(){
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public ModelAndView loginSubmit(@RequestParam String loginname, @RequestParam String password, HttpServletRequest request){
        Checker checker = new Checker();
        checker.setChecker_account(loginname);
        checker = checkerService.selectOne(checker);
        System.out.println(checker);
        if(checker != null){
            request.getSession().setAttribute("checker",checker);
            switch (checker.getPosition()){
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
