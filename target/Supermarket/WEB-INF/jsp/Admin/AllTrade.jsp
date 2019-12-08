<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/8
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <title>员工个人信息详情表</title>
    <!-- 告诉浏览器响应屏幕宽度 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link href="<%=ctxPath%>/src/res/css/bootsrap.min.css" rel="stylesheet">
    <!-- 象形异体字 -->
    <link href="<%=ctxPath%>/src/res/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- 主题风格 -->
    <link href="<%=ctxPath%>/src/res/css/Admin.min.css" rel="stylesheet">
    <!-- 皮肤 -->
    <link href="<%=ctxPath%>/src/res/css/_all-skins.min.css" rel="stylesheet">
    <!--谷歌字体 -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"
          rel="stylesheet">
    <!--导入vue.js有网的时候推荐-->
    <script charset="UTF-8" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!--没网的时候-->
    <!--script src="<%=ctxPath%>/src/res/js/vue.js" type="text/javascript" charset="UTF-8"></script-->
    <style type="text/css">
        #mian-components {
            text-align: center;

        }

        .btn-default {
            margin-top: 10px;

            margin-right: 35px;
        }

        .table {
            text-align: center;
        }

        .table-mess {
            width: 300px;
            text-align: center;
        }

        .system-mess {
            width: 600px;
            text-align: center;
        }

        body {
            text-align: center;
        }

        h1 {
            font-size: 25px;
            text-align: center;
        }

        .zhuce {
            font-size: 14px;
            text-align: center;
            width: 840px;
            margin: 0 auto;
            background: #f7f7f7;
        }

        .zhuce td {
            border: 1px solid rgb(0, 0, 0);
            padding: 2px 3px;
        }

        .zhuce .ibg {
            text-align: left;
        }

        .zhuce .bbg {
            padding: 10px 0;
            font-size: 13px;
        }

        #bt {
            width: 100px;
            height: 35px;
            background: #99ffcc;
        }

        my-tr {
            height: 300px;
        }
    </style>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<%
    String flag = (String) request.getAttribute("flag");
%>
<% if(flag == "4"){%>
<script>
    alert("删除成功");
</script>
<% }%>

<% if(flag == "-4"){%>
<script>
    alert("删除失败");
</script>
<% }%>

<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a class="logo" href="#">
            <!-- 迷你标志为侧栏迷你50x50像素 -->
            <span class="logo-mini"><b>L</b>B</span>
            <!-- 常规状态和移动设备的徽标 -->
            <span class="logo-lg">启立智能超市系统</span>
        </a>
        <!-- 标题导航栏:样式可以在Header .less中找到 -->
        <nav class="navbar navbar-static-top">
            <!-- 侧边栏切换按钮-->
            <a class="sidebar-toggle" data-toggle="push-menu" href="#" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- 用户帐号:风格可以在dropdown.less中找到 -->
                    <li class="dropdown user user-menu">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <span class="hidden-xs">噬魂</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <br>
                                <br>
                                <p>
                                    启立 - web开发人员
                                    <small>2019.12.4</small>
                                </p>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- 左列。包含徽标和边栏 -->
    <aside class="main-sidebar">

        <!-- 侧栏:style可以在sidebar.less中找到 -->
        <section class="sidebar">
            <!-- 侧边栏用户面板 -->
            <div class="user-panel">
                <ul class="nav nav-pills nav-stacked">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" id="bar-1"><a href="<%=ctxPath%>/queryStaff.do">所有员工</a></li>
                        <li role="presentation" id="bar-2"><a href="<%=ctxPath%>/queryRecord.do">消费记录</a></li>
                        <li role="presentation" id="bar-3"><a href="<%=ctxPath%>/Admin/addchecker.do">添加员工</a></li>
                        <li role="presentation" id="bar-4"><a href="<%=ctxPath%>/Admin/addtrade.do">添加商品</a></li>
                    </ul>
                </ul>
            </div>
            <!-- 侧栏菜单::style可以在sidebar.less中找到-->


        </section>
        <!-- /.侧边栏描述 -->
    </aside>
    <!-- 内容包装器。包含页面内容 -->
    <div class="content-wrapper">

        <!-- 内容页眉(页眉） -->
        <section class="content-header">
            <h2 align="center">商品详情表</h2>
        </section>
        <!-- 主要内容 -->


        <section class="content container-fluid">
            <div class="box box-primary">
                <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th style="text-align: center">商品类型编号</th>
                            <th style="text-align: center">商品类型</th>
                            <th style="text-align: center">商品编号</th>
                            <th style="text-align: center">商品名称</th>
                            <th style="text-align: center">商品价格</th>
                            <th style="text-align: center">商品数量</th>
                            <th style="text-align: center">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="trade">
                            <tr>
                                <td>${trade.trade_type_id}</td>
                                <td>${trade.trade_type}</td>
                                <td>${trade.trade_id}</td>
                                <td>${trade.trade_name}</td>
                                <td>${trade.trade_value}</td>
                                <td>${trade.trade_number}</td>
                                <td>
                                    <a href="#" onclick="sub('${trade.trade_id}','${trade.trade_type}','${trade.trade_type_id}');" style="color: #606c84;font-weight: bold">编辑</a>
                                    <a href="#" onclick="subs(${trade.trade_id});" style="color: crimson;font-weight: bold">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
        </section>

    </div>
    <!-- /.主要内容 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>CRAETE TO 2019.12.4 Admin WUQILI.</strong> 保留所有权
    </footer>
    <script type="text/javascript">
    </script>
    <!-- ./包装器 -->
    <!-- jQuery 3 -->
    <script src="<%=ctxPath%>/src/res/js/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="<%=ctxPath%>/src/res/js/bootstrap.min.js"></script>
    <!-- 侧栏打开/关闭代码 -->
    <script src="<%=ctxPath%>/src/res/js/adminllkxl.min.js"></script>
</div>
<script>
    function sub(trade_id,trade_type,trade_type_id) {
        var trade_id = trade_id;
        var trade_type = trade_type;
        var trade_type_id = trade_type_id;
        window.location.href = "<%=ctxPath%>/Admin/update_Trade.do?trade_id="+trade_id+"&trade_type="+trade_type+"&trade_type_id="+trade_type_id;
    }
    function subs(st) {
        var trade_id = st;
        var result = window.confirm("您确定删除该员工信息?");
        if (result) {
            window.location.href = "<%=ctxPath%>/Admin/delete_Trade.do?trade_id="+trade_id;
        }
    }
</script>
</body>
</html>