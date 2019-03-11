<%--
  Created by IntelliJ IDEA.
  User: 10420
  Date: 2019/3/6
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>开发者登录</title>
    <script src="/resources/jquery/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <script src="/resources/layui/layui.js"></script>
    <style>
        form{
            margin-left: 45%;
            margin-top: 15%;
        }
    </style>
    <style type="text/css">
        body{
            background-image: url(/resources/picture/1.jpg);
            background-size:cover;
        }
    </style>
</head>
<body>
<div class="layui-container">
    <form action="/dev/login" method="post" class="layui-form">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="devCode" required lay-verify="required" placeholder="请输入账户" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="password" name="devPassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
