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
    <!-- 告诉浏览器响应屏幕宽度 -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link href="<%=ctxPath%>/src/res/css/bootsrap.min.css" rel="stylesheet">
    <!-- 象形异体字 -->
    <link href="<%=ctxPath%>/src/res/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- 主题风格 -->
    <link href="<%=ctxPath%>/src/res/css/AdminLLKXL.min.css" rel="stylesheet">
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
    alert("添加成功！");
</script>
<%}%>
<%
    if (flag == "2") {%>
<script>
    alert("添加失败！");
</script>
<%}%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://39.106.152.196:3306/db_llkxl","root","Chen+Kai+123");
    Statement statement=con.createStatement();
    ResultSet rs=statement.executeQuery("SELECT * FROM tb_position");
    List<String> list=new ArrayList<String>();
    try{
        while(rs.next()){
            list.add(rs.getString("pt_name"));
        }
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    rs.close();
    rs=statement.executeQuery("SELECT * FROM tb_department");
    List<String> list1=new ArrayList<String>();
    try{
        while(rs.next()){
            list1.add(rs.getString("dt_name"));
        }
    }catch(SQLException ex){
        System.out.println(ex.getMessage());
    }
    statement.close();
%>


<div class="wrapper">
    <header class="main-header">
        <!-- Logo -->
        <a class="logo" href="#">
            <!-- 迷你标志为侧栏迷你50x50像素 -->
            <span class="logo-mini"><b>L</b>B</span>
            <!-- 常规状态和移动设备的徽标 -->
            <span class="logo-lg">LLKXL智能制造系统</span>
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
                            <span class="hidden-xs">琳琳开心力</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <br>
                                <br>
                                <p>
                                    琳琳开心力 - web开发人员
                                    <small>2019.11.1</small>
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
                    <li role="presentation" id="bar-2"><a href="<%=ctxPath%>/querystaffs.do">所有员工</a></li>
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
            <h2 align="center">员工个人信息详情表</h2>
        </section>
        <!-- 主要内容 -->
        <form id="fm-register" action="admin.do" class="content" method="post">
            <!--年度计划界面-->
            <div id="main-components">
                <div>
                    <form form-control>
                        <table class="table  table-condensed table-responsive">
                            <tr>
                                <td>登录名</td>
                                <td>
                                    <input autocomplete required minlength="1" maxlength="10" class="form-control" type="text" autofocus id="txtName" name="txtName" >
                                    <span class="msg-default">用户名长度在1到10位之间</span>
                                </td>
                                <td>QQ</td>
                                <td>
                                    <input required type="text" class="form-control" minlength="8" maxlength="11" autofocus id="qq" name="qq">
                                    <span class="msg-default">QQ长度在8到11位之间</span>
                                </td>

                            </tr>
                            <tr>
                                <td>真实姓名</td>
                                <td>
                                    <input class="form-control"  minlength="1" maxlength="10" id="trueName" name="trueName" required type="text">
                                    <span class="msg-default">姓名长度在1到10位之间</span>
                                </td>
                                <td>密码</td>
                                <td>
                                    <input required type="text" minlength="6" maxlength="20" class="form-control" autofocus id="password" name="password">
                                    <span class="msg-default hidden">密码长度在6到20位之间</span>
                                </td>
                            </tr>
                            <tr>
                                <td>职位</td>
                                <td>
                                    <select class="form-control" id="ptNum" name="ptNum">
                                        <%for(int i=0;i<list.size();i++){%>
                                        <option><%=list.get(i)%></option>
                                        <%}%>
                                    </select>
                                </td>
                                <td>所属部门</td>
                                <td>
                                    <select class="form-control" id="dtNum" name="dtNum">
                                        <%for(int i=0;i<list1.size();i++){%>
                                        <option><%=list1.get(i)%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <td>固定电话</td>
                                <td>
                                    <input class="form-control" id="hardPhone" name="hardPhone" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
                                           required type="text">
                                    <span class="msg-default hidden">请输入合法的手机号</span>
                                </td>
                                <td>手机</td>
                                <td>
                                    <input class="form-control" id="phone" name="phone" pattern="(\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$"
                                           required type="text">
                                    <span class="msg-default hidden">请输入合法的手机号</span>
                                </td>

                            </tr>
                            <tr>
                                <td>公司邮箱</td>
                                <td>
                                    <input class="form-control" id="companyEmail" name="companyEmail" autocomplete required type="email">
                                    <span class="msg-default hidden">请输入合法的邮箱地址</span>
                                </td>
                                <td>其他邮箱</td>
                                <td>
                                    <input class="form-control" id="otherEmail" name="otherEmail" autocomplete required type="email">
                                    <span class="msg-default hidden">请输入合法的邮箱地址</span>
                                </td>

                            </tr>

                        </table>
                        <input class="btn btn-default" id="bt-register" type="button" value="保存" onclick="sub();"/>
                        <input class="btn btn-default" type="reset" value="重置">
                    </form>
                </div>
            </div>
        </form>

    </div>
    <!-- /.主要内容 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 3.0.0
        </div>
        <strong>CRAETE TO 2019.11.1AdminLLKXL.</strong> 保留所有权
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
        if (count == 8) {
            document.getElementById("fm-register").submit();
        } else {
            alert("请正确输入信息！");
        }
    }
</script>

<script>
    //1.获取AJAX对象
    var xmlhttp = null;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    /*1.对用户名进行验证*/
    $('#txtName').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '用户名不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('用户名不能为空');
        } else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '用户名不能多余10位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('用户名不能多余10位');
        } else {
            //获取输入框中的值
            var u = document.getElementById("txtName");
            var txtName = u.value;
            //处理回调函数
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    var msg = xmlhttp.responseText;
                    if (msg == "true") {
                        u.nextElementSibling.innerHTML = '用户名已被注册';
                        u.nextElementSibling.className = 'msg-error';
                    } else {
                        u.nextElementSibling.innerHTML = '用户名可用';
                        u.nextElementSibling.className = 'msg-success';
                    }
                }
            }
            xmlhttp.open("get", "<%=ctxPath%>/checkName.do?txtName=" + txtName);
            xmlhttp.send();
        }
    });
    $('#txtName').focus(function () {
        this.nextElementSibling.innerHTML = '用户名长度在1到10位之间';
        this.nextElementSibling.className = 'msg-default';
    });

    $('#trueName').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '姓名不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('姓名不能为空');
        } else if (this.validity.tooShort) {
            this.nextElementSibling.innerHTML = '姓名长度在1到10位之间';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('姓名长度在1到10位之间');
        } else {
            this.nextElementSibling.innerHTML = '姓名格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#trueName').focus(function () {
        this.nextElementSibling.innerHTML = '姓名长度在1到10位之间';
        this.nextElementSibling.className = 'msg-default';
    });

    /*2.对密码进行验证*/
    $('#password').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '密码不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('密码不能为空');
        } else if (this.validity.tooShort) {
            this.nextElementSibling.innerHTML = '密码长度尽量别少于6位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('密码长度尽量别少于6位');
        } else {
            this.nextElementSibling.innerHTML = '密码格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#password').focus(function () {
        this.nextElementSibling.innerHTML = '密码长度在6到12位之间';
        this.nextElementSibling.className = 'msg-default';
    });
    /*3.对邮箱地址进行验证*/
    $('#otherEmail').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '邮箱不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('邮箱不能为空');
        } else if (this.validity.typeMismatch) {
            this.nextElementSibling.innerHTML = '邮箱格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('邮箱格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '邮箱格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
            //  var data =document.getElementById("email").value;
            var data = $("#otherEmail").val();
            if (!data) {   //用户没有输入任何内容
                return;
            }
        }
    });
    $('#otherEmail').focus(function () {
        this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
        this.nextElementSibling.className = 'msg-default';
    });

    $('#qq').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = 'QQ不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('QQ不能为空');
        } else if (this.validity.tooShort) {
            this.nextElementSibling.innerHTML = 'QQ长度在8到11位之间';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('QQ长度不少于8位');
        } else {
            this.nextElementSibling.innerHTML = 'QQ格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#qq').focus(function () {
        this.nextElementSibling.innerHTML = 'QQ长度在8到11位之间';
        this.nextElementSibling.className = 'msg-default';
    });

    $('#companyEmail').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '邮箱不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('邮箱不能为空');
        } else if (this.validity.typeMismatch) {
            this.nextElementSibling.innerHTML = '邮箱格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('邮箱格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '邮箱格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
            //  var data =document.getElementById("email").value;
            var data = $("#companyEmail").val();
            if (!data) {   //用户没有输入任何内容
                return;
            }
        }
    });
    $('#companyEmail').focus(function () {
        this.nextElementSibling.innerHTML = '请输入合法的邮箱地址';
        this.nextElementSibling.className = 'msg-default';
    });

    /*4.对手机号进行验证*/
    $('#phone').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '手机号不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('手机号不能为空');
        } else if (this.validity.patternMismatch) {
            this.nextElementSibling.innerHTML = '手机号格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('手机号格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '手机号格式正确';
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
        this.nextElementSibling.innerHTML = '请输入合法的手机号';
        this.nextElementSibling.className = 'msg-default';
    });

    $('#hardPhone').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '手机号不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('手机号不能为空');
        } else if (this.validity.patternMismatch) {
            this.nextElementSibling.innerHTML = '手机号格式不正确';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('手机号格式不正确');
        } else {
            this.nextElementSibling.innerHTML = '手机号格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
            //  var data =document.getElementById("email").value;
            var data = $("#hardPhone").val();
            if (!data) {   //用户没有输入任何内容
                return;
            }
        }
    });
    $('#hardPhone').focus(function () {
        this.nextElementSibling.innerHTML = '请输入合法的手机号';
        this.nextElementSibling.className = 'msg-default';
    });
</script>

</body>

</html>

