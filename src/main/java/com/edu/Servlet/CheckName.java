package com.edu.Servlet;

import com.edu.Pojo.User;
import com.edu.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/5 21:05
 */
@Controller
@RequestMapping("/checkName")

@WebServlet(name = "checkName",value = "/checkName.do",loadOnStartup = 1)
public class CheckName extends HttpServlet {
    public void init(ServletConfig config)throws ServletException{
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    }

    @Autowired
    AdminService adminService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        User user = new User();
        user.setAccount(req.getParameter("account").toString());
        System.out.println(req.getParameter("account"));
        boolean b = adminService.checkNames(user);
        System.out.println(b);
        resp.getWriter().write(b+"");
    }
}
