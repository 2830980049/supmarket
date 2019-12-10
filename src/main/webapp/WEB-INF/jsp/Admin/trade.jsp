<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/4
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <title>商品信息表</title>

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
    if (flag == "0") {%>
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
                    <li class="dropdown user user-menu">
                        <a class="dropdown-toggle"  href="<%=ctxPath%>/login.do">
                            <span class="hidden-xs">退出</span>
                        </a>
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
                    <li role="presentation" id="bar-3"><a href="<%=ctxPath%>/queryRecord.do?flag=0">消费记录</a></li>
                    <li role="presentation" id="bar-4"><a href="<%=ctxPath%>/Admin/addchecker.do">添加员工</a></li>
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
            <h2 align="center">添加商品信息</h2>
        </section>
        <!-- 主要内容 -->
        <form id="fm-register" action="<%=ctxPath%>/Admin/addtrade.do" class="content" method="post">
            <!--年度计划界面-->
            <div id="main-components">
                <form form-control>
                    <table class="table  table-condensed table-responsive">
                        <tr>
                            <td class="form-group"><label>商品类型</label></td>
                            <td class="form-group">
                                <select class="form-control" id="trade_type" name="trade_type" onchange="changeNum()">
                                    <%
                                        if (flag != "3") {%>
                                        <option>请选择</option>
                                        <c:forEach items="${list}" var="trade">
                                        <option value="${trade.trade_type}"> ${trade.trade_type}</option>
                                        </c:forEach>
                                    <%}%>
                                    <%
                                        if (flag == "3") {%>
                                            <option>${trade_type}</option>
                                    <%}%>
                                </select>
                            </td>
                            <td>商品类型编号</td>
                            <td class="form-group">
                                <input autocomplete required minlength="1" maxlength="20" class="form-control" type="text" autofocus id="trade_type_id" name="trade_type_id" value="${trade_type_id}" readonly>
                                <span class="msg-success"></span>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group"><label>商品编号</label></td>
                            <td class="form-group">
                                <input autocomplete required minlength="1" maxlength="20" class="form-control" type="text" autofocus id="trade_id" name="trade_id" value="${trade_id}">
                                <span class="msg-default"></span>
                            </td>
                            <td class="form-group"><label>商品名称</label></td>
                            <td class="form-group">
                                <input required type="text" class="form-control" minlength="1" maxlength="40" autofocus id="trade_name" name="trade_name">
                                <span class="msg-default hidden">长度40位之间</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-group"><label>商品价格</label></td>
                            <td class="form-group">
                                <input required type="text" class="form-control" minlength="1" maxlength="20" autofocus id="trade_value" name="trade_value" onkeyup="value=value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1')">
                                <span class="msg-default hidden">价格为空</span>
                            </td>
                            <td class="form-group"><label>商品数量</label></td>
                            <td class="form-group">
                                <input class="form-control" id="trade_number" name="trade_number" required type="text" onkeyup="value=value.replace(/[^\d]/g,'')">
                                <span class="msg-default hidden"></span>
                            </td>
                        </tr>
                        <tr>
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
        var trade_type = document.getElementById("trade_type");
        var checks = document.getElementById("check");
        <% if (flag == "3") {%>
            if (count == 4){
                checks.value = "0";
                document.getElementById("fm-register").submit();
            }
            else
                alert("请正确输入信息！");
            <%}%>
         <% if (flag != "3") {%>
              if (count == 5 && trade_type.value != "请选择") {
                  checks.value = "1";
                  document.getElementById("fm-register").submit();
              }
              else
                alert("请正确输入信息！");
         <%}%>
    }
</script>

<%
    if (flag == "3") {%>
<script>
    var xmlhttp = null;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    $('#trade_id').prop('readonly',true);
</script>
<%}%>

<script>
    function changeNum(){
        var trade_type = document.getElementById("trade_type").value
        $.ajax({
            type:'POST',
            dataType:'text',
            url:'<%=ctxPath%>/Admin/query_id',
            data:{
                trade_type : trade_type
            },

            success:function(data){
                //解析json为数组
                var data = eval("("+data+")");
                var dataList = data.tasks;
                if (dataList!= null) { //如果没有这一步，js会报length null之类的
                        var MObj = dataList[0];
                        var trade_id = MObj.trade_id;
                        //进行添加到标签里
                        var value = document.getElementById("trade_type_id");
                        value.value = trade_id;
                }
            }
        });
    }
</script>

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
    $('#trade_id').blur(function () {
        var checks = document.getElementById("check");
        checks.value = "1";
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '编号不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('编号不能为空');
        } else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '编号不能多余20位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('编号不能多余20位');
        } else {
            //获取输入框中的值
            var u = document.getElementById("trade_id");
            var trade_id = u.value;
            //处理回调函数
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.status == 200 && xmlhttp.readyState == 4) {
                    var msg = xmlhttp.responseText;
                    if (msg == "true") {
                        u.nextElementSibling.innerHTML = '编号已被注册';
                        u.nextElementSibling.className = 'msg-error';
                    } else {
                        u.nextElementSibling.innerHTML = '编号可用';
                        u.nextElementSibling.className = 'msg-success';
                    }
                }
            }
            xmlhttp.open("get", "<%=ctxPath%>/checkId.do?trade_id=" + trade_id);
            xmlhttp.send();
        }
    });
    $('#trade_id').focus(function () {
        this.nextElementSibling.innerHTML = '长度10位之间';
        this.nextElementSibling.className = 'msg-default';
    });
</script>
<% }%>
<script>
    $('#trade_name').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '名称不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('名称不能为空');
        }
        else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '不能多于40位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('不能多于40位');
        }
        else {
            this.nextElementSibling.innerHTML = '名称格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#trade_name').focus(function () {
        this.nextElementSibling.innerHTML = '';
        this.nextElementSibling.className = 'msg-default';
    });
    $('#trade_value').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '价格不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('价格不能为空');
        }
        else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '不能多于20位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('价格多于20位');
        }
        else {
            this.nextElementSibling.innerHTML = '价格格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#trade_value').focus(function () {
        this.nextElementSibling.innerHTML = '';
        this.nextElementSibling.className = 'msg-default';
    });
    $('#trade_number').blur(function () {
        if (this.validity.valueMissing) {
            this.nextElementSibling.innerHTML = '数量不能为空';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('数量不能为空');
        }
        else if (this.validity.tooLong) {
            this.nextElementSibling.innerHTML = '不能多于20位';
            this.nextElementSibling.className = 'msg-error';
            this.setCustomValidity('不能多于20位');
        }
        else {
            this.nextElementSibling.innerHTML = '数量格式正确';
            this.nextElementSibling.className = 'msg-success';
            this.setCustomValidity('');
        }
    });
    $('#trade_number').focus(function () {
        this.nextElementSibling.innerHTML = '';
        this.nextElementSibling.className = 'msg-default';
    });
</script>
</body>

</html>


