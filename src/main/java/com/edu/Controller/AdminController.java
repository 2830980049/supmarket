package com.edu.Controller;

import com.edu.Pojo.User;
import com.edu.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    @RequestMapping(value = "/addchecker.do",method = RequestMethod.GET)
    public ModelAndView addchecker(){
        return new ModelAndView("Admin/checker");
    }

    @RequestMapping(value = "/addchecker.do",method = RequestMethod.POST)
    public ModelAndView addcheckers(@RequestParam String account, @RequestParam String passwords, @RequestParam String username,
                                    @RequestParam String sex, @RequestParam String birthday, @RequestParam String phone,
                                    @RequestParam String positions, HttpServletRequest request, HttpServletResponse response){
        User user = new User();
        user.setAccount(account);
        user.setSex(sex);
        user.setPhone(phone);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(birthday);
            user.setBirthday(date);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        user.setUsername(username);
        user.setPasswords(passwords);
        if(positions.equals("管理员"))
            user.setPositions(0);
        else
            user.setPositions(1);
        System.out.println(user);
        boolean m  = adminService.AddChecker(user);
        ModelAndView mav = new ModelAndView("Admin/checker");
        if(m){
            mav.addObject("flag","1");
            return  mav;
        }
        else{
            mav.addObject("flag","2");
            return mav;
        }
    }

}
