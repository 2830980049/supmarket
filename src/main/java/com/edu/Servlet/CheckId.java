package com.edu.Servlet;

import com.edu.Pojo.Trade;
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
 * @date 2019/12/8 19:34
 */
@Controller
@RequestMapping("/checkId")

@WebServlet(name = "checkId",value = "/checkId.do",loadOnStartup = 1)
public class CheckId extends HttpServlet {
    public void init(ServletConfig config)throws ServletException {
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
        Trade trade = new Trade();
        trade.setTrade_id(req.getParameter("trade_id").toString());
        System.out.println("trade_id "+req.getParameter("trade_id"));
        boolean b = adminService.checkIds(trade);
        resp.getWriter().write(b+"");
    }
}
