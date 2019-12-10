<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/4
  Time: 12:18
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

    <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/src/res/css/sweetalert.css">
    <script type="text/javascript" src="<%=ctxPath%>/src/res/js/sweetalert-dev.js"></script>

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
    if (flag == "1") {%>
<script>
    swal("添加成功！", "信息已全部添加到数据库！", "success");
</script>
<%}%>
<%
    if (flag == "2") {%>
<script>
    swal("添加失败！", "未知错误！", "error");
</script>
<%}%>

<% if (flag == "4") {%>
<script>
    swal("修改成功！", "数据已更新！", "success");
</script>
<%}%>
<%
    if (flag == "5") {%>
<script>
    swal("修改失败！", "未知错误！", "error");
</script>
<%}%>


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
                    <li role="presentation" id="bar-1"><a href="<%=ctxPath%>/queryStaff.do">所有员工</a></li>
                    <li role="presentation" id="bar-2"><a href="<%=ctxPath%>/queryTrade.do">所有商品</a></li>
                    <li role="presentation" id="bar-3"><a href="<%=ctxPath%>/queryRecord.do">消费记录</a></li>
                    <li role="presentation" id="bar-4"><a href="<%=ctxPath%>/Admin/addtrade.do">添加商品</a></li>
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
            <h2 align="center">添加员工信息</h2>
        </section>
        <!-- 主要内容 -->
            <form id="fm-register" action="<%=ctxPath%>/Admin/addchecker.do" class="content" method="post">
            <!--年度计划界面-->
            <div id="main-components">
                    <form form-control>
                        <table class="table  table-condensed table-responsive">
                            <tr>
                                <td class="form-group"><label>帐号</label></td>
                                <td class="form-group">
                                    <input autocomplete required minlength="1" maxlength="20" class="form-control" type="text" autofocus id="account" name="account" value="${account}">
                                    <span class="msg-default"></span>
                                </td>
                                <td class="form-group"><label>密码</label></td>
                                <td class="form-group">
                                    <input required type="password" class="form-control" minlength="8" maxlength="40" autofocus id="passwords" name="passwords">
                                    <span class="msg-default hidden">长度8-40位之间</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-group"><label>真实姓名</label></td>
                                <td class="form-group">
                                    <input class="form-control"  minlength="1" maxlength="20" id="username" name="username" required type="text">
                                    <span class="msg-default hidden">长度10位之间</span>
                                </td>
                                <td class="form-group"><label>性别</label></td>
                                <td class="form-group">
                                    <select class="form-control" id="sex" name="sex">
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-group"><label>出生日期</label></td>
                                <td class="form-group">
                                    <input class="form-control"  id="birthday" name="birthday" required type="date">
                                    <span class="msg-default hidden">日期不能为空</span>
                                </td>
                                <td class="form-group"><label>电话</label></td>
                                <td class="form-group">
                                    <input class="form-control" id="phone" name="phone" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
                                           required type="text">
                                    <span class="msg-default hidden">手机号不合法</span>
                                </td>
                            </tr>

                            <tr>
                                <td class="form-group"><label>职位</label></td>
                                <td class="form-group">
                                    <select class="form-control" id="positions" name="positions">
                                        <option>管理员</option>
                                        <option>收银员</option>
                                    </select>
                                </td>
                                <td></td>
                                <td>
                                    <input hidden id="check" name="check">
                                    <span class="msg-default hidden"></span>
                                </td>
                            </tr>
                        </table>
                        <input class="btn btn-default" id="bt-register" type="button" value="保存" onclick="sub();"/>
                        <input class="btn btn-default" type="reset" value="重置">
                    </form>
            </div>
        </form>

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

<script type="text/javascript">
    function sub() {
        var inputs = document.getElementsByTagName("input");
        var count = 0;
        for (var i = 0; i < inputs.length - 1; i++) {
            var msg = inputs[i].nextElementSibling;
            if (msg.className == "msg-success") {
                count++;
            }
        }
        var checks = document.getElementById("check");
        <% if (flag == "3") {%>
        if (count == 4) {
            checks.value = "0";
            document.getElementById("fm-register").submit();
        }
        else
            alert("请正确输入信息！");
        <%}%>
        <% if (flag != "3") {%>
        if (count == 5) {
            checks.value = "1";
            document.getElementById("fm-register").submit();
        }
        else
            alert("请正确输入信息！");
        <%}%>
    }
</script>

<% if (flag == "3") {%>
<script>
    $('#account').prop('readonly',true);
</script>
<%}%>

<%
    if (flag != "3") {%>
<script>
    //1.获取AJAX对象
    var xmlhttp = null;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    /*1.对用户名进行验证*/
    $('#account').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '帐号不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('帐号不能为空');
        } else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '帐号不能多余20位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('帐号不能多余20位');
        } else {
            //获取输入框中的值
            var u = document.getElementById("account");
            var account = u.value;
            //处理回调函数
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    var msg = xmlhttp.responseText;
                    if (msg == "true") {
                        u.nextElementSibling.innerHTML = '帐号已被注册';
                        u.nextElementSibling.className = 'msg-error';
                    } else {
                        u.nextElementSibling.innerHTML = '帐号可用';
                        u.nextElementSibling.className = 'msg-success';
                    }
                }
            }
            xmlhttp.open("get", "<%=ctxPath%>/checkName.do?account=" + account);
            xmlhttp.send();
        }
    });
    $('#account').focus(function () {
        this.nextElementSibling.innerHTML = '长度10位之间';
        this.nextElementSibling.className = 'msg-default';
    });
</script>
    <% }%>

    <script>
    $('#username').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '姓名不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('姓名不能为空');
        }
        else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '不能多于20位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('不能多于20位');
        }
        else {
            this.nextElementSibling.innerHTML = '姓名格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('姓名格式正确');
        }
    });
    $('#username').focus(function () {
        this.nextElementSibling.innerHTML = '长度10位之间';
        this.nextElementSibling.className = 'msg-default';
    });

    /*2.对密码进行验证*/
    $('#passwords').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '密码不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('密码不能为空');
        } else if (this.validity.tooShort) {
            this.nextElementSibling.innerHTML = '长度不能少于8位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('长度不能少于8位');
        }
        else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '长度不能多于40位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('长度不能多于40位');
        }
        else {
            this.nextElementSibling.innerHTML = '密码格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#passwords').focus(function () {
        this.nextElementSibling.innerHTML = '长度在8到40位之间';
        this.nextElementSibling.className = 'msg-default';
    });

    /*3.对邮箱地址进行验证*/
    $('#birthday').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '出生日期不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('出生日期不能为空');
        } else if (this.validity.typeMismatch) {
            this.nextElementSibling.innerHTML = '格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
            //  var data =document.getElementById("email").value;
            var data = $("#birthday").val();
            if (!data) {   //用户没有输入任何内容
                return;
            }
        }
    });
    $('#birthday').focus(function () {
        this.nextElementSibling.innerHTML = '出生日期不能为空';
        this.nextElementSibling.className = 'msg-default';
    });

    /*4.对手机号进行验证*/
    $('#phone').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '手机号不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('手机号不能为空');
        } else if (this.validity.patternMismatch) {
            this.nextElementSibling.innerHTML = '格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
            //  var data =document.getElementById("email").value;
            var data = $("#phone").val();
            if (!data) {   //用户没有输入任何内容
                return;
            }
        }
    });
    $('#phone').focus(function () {
        this.nextElementSibling.innerHTML = '手机号不能为空';
        this.nextElementSibling.className = 'msg-default';
    });

</script>
</body>

</html>

