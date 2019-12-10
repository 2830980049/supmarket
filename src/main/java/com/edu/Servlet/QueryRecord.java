package com.edu.Servlet;

import com.edu.Pojo.Goods_records;
import com.edu.Pojo.Trade;
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
 * @date 2019/12/8 22:44
 */
@Controller
@WebServlet(name = "queryRecord",value = "/queryRecord.do",loadOnStartup = 1)
public class QueryRecord extends HttpServlet {
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
        List<Goods_records> list = adminService.queryRecord();
        Object obj = null;
        obj = req.getAttribute("flag");
        Object boj1 = null;
        boj1 = req.getParameter("flag");
        //Object flag = (String)req.getParameter("flag");
        if(boj1 == null)
            session.setAttribute("flag", (String) req.getAttribute("flag"));
        else
            session.setAttribute("flag",req.getParameter("flag"));
        session.setAttribute("flag1",(String) req.getAttribute("flag1"));
        /*
        System.out.println(" queryRecord flag  setAttribute "+req.getAttribute("flag"));
        System.out.println(" queryRecord flag  setParameter "+req.getParameter("flag"));
        System.out.println(" queryRecord flag  setParameter isEmpty "+req.getParameter("flag").isEmpty());
        System.out.println(" queryRecord flag1  " + req.getAttribute("flag1"));
           */
        session.setAttribute("list", list);
        req.getRequestDispatcher("/queryRecords.do").forward(req,resp);
        //resp.sendRedirect(req.getContextPath()+"/queryStaffs.do");
    }
}
