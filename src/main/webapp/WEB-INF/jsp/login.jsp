<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/4
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <!-- Meta tag Keywords -->
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>

    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link href="<%=ctxPath%>/src/res/css/style.css" media="all" rel="stylesheet" type="text/css">
<body>
<!--header-->
<div class="agileheader">
    <h1></h1>
</div>
<!--//header-->
<!--main-->
<div class="main-w3l">
    <div class="w3layouts-main">
        <h2>立即登录</h2>
        <%--        到达indexController--%>
        <form action="<%=ctxPath%>/login.do" method="post">

            <label>
                <input id="loginname" name="loginname" onfocus="this.value = '';" placeholder="请输入账号" required
                       type="text"
                       value=""/>
            </label>
            <label>
                <input id="password" name="password" onfocus="this.value = '';" required type="password"
                       value=""/>
            </label>
            <span>
                        <label>
                            <input type="checkbox"/>
                        </label>
                        记住我
                    </span>
            <div class="clear" style="color: white">${msg}</div>
            <input name="login" type="submit" value="登 录">
        </form>
    </div>
</div>
<!--//main-->
</body>
</html>
