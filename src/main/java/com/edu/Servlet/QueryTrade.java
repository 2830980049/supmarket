package com.edu.Servlet;

import com.edu.Pojo.Trade;
import com.edu.Pojo.User;
import com.edu.Service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author Wuqili
 * @version 1.0
 * @date 2019/12/8 21:02
 */
@Controller
@WebServlet(name = "queryTrade",value = "/queryTrade.do",loadOnStartup = 1)
public class QueryTrade extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    }
    @Autowired
    AdminService adminService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        List<Trade> list = adminService.queryAll();
        session.setAttribute("flag", (String) req.getAttribute("flag"));
        session.setAttribute("list", list);
        System.out.println("flag = "+(String) req.getAttribute("flag"));
        req.getRequestDispatcher("/queryTrades.do").forward(req,resp);
        //resp.sendRedirect(req.getContextPath()+"/queryStaffs.do");
    }
}
