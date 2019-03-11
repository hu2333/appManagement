<%--
  Created by IntelliJ IDEA.
  User: 10420
  Date: 2019/3/9
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>app管理系统</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <script src="/resources/jquery/jquery-3.3.1.js"></script>
    <script src="/resources/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="/jsp/common/header.jsp"/>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <form class="layui-form" action="/app/add" method="post">

                <div class="layui-form-item">
                    <label class="layui-form-label">软件名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareName" lay-verify="softwareName" autocomplete="off" placeholder="请输入软件名称" class="layui-input">
                    </div>
                    <label class="layui-form-label">APK名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="APKName" lay-verify="APKName" autocomplete="off" placeholder="请输入APK名称" class="layui-input" >
                    </div>
                    <label class="layui-form-label">支持ROM</label>
                    <div class="layui-input-inline">
                        <input type="text" name="supportROM" lay-verify="supportROM" autocomplete="off" placeholder="请输入支持ROM" class="layui-input" >
                    </div>
                    <label class="layui-form-label">界面语言</label>
                    <div class="layui-input-inline">
                        <input type="text" name="interfaceLanguage" lay-verify="interfaceLanguage" autocomplete="off" placeholder="请输入界面语言" class="layui-input" >
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">软件大小</label>
                    <div class="layui-input-inline">
                        <input type="text" name="softwareSize" lay-verify="softwareSize" autocomplete="off" placeholder="请输入软件大小" class="layui-input" >
                    </div>
                    <label class="layui-form-label">APP状态</label>
                    <div class="layui-input-inline">
                        <select name="status" lay-filter="status">
                            <option value="0">-请选择-</option>
                            <c:forEach items="${appStatus}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">所属平台</label>
                    <div class="layui-input-inline">
                        <select name="flatformId" lay-filter="flatformId">
                            <option value="0">-请选择-</option>
                            <c:forEach items="${flatform}" var="obj">
                                <option value="${obj.valueId}">${obj.valueName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label class="layui-form-label">一级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel1.id" lay-filter="levelOne" id="levelOne">
                            <option value="0">-请选择-</option>
                            <c:forEach items="${levelOne}" var="obj">
                                <option value="${obj.id}">${obj.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">二级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel2.id" lay-filter="levelTwo" id="levelTwo">
                        </select>
                    </div>
                    <label class="layui-form-label">三级分类</label>
                    <div class="layui-input-inline">
                        <select name="categoryLevel3.id" lay-filter="levelThree" id="levelThree">
                        </select>
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">app简介</label>
                    <div class="layui-input-block">
                        <textarea name="appInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/jsp/common/footer.jsp"/>
</div>
<script>
    //JavaScript代码区域
    layui.use(['element','form','jquery'], function(){
        var element = layui.element;
        var form = layui.form;
        var $ = layui.jquery;
        //对form的监听必须在 layui特定的区域完成
        //对一级级监听===========================================================
        form.on('select(levelOne)',function () {
            //获取id
            var  levelOneId = $('#levelOne').val();
            if(levelOneId == 0){
                var html='<option value="0">-请选择-</option>';
                $('#levelTwo').html(html);
                form.render();
                return ;
            }else{
                $.ajax({
                    url:'/category/queryLevelTwoByLevelOne/'+levelOneId,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据重新渲染；
                        var html='<option value="0">-请选择-</option>';
                        var len = data.length;
                        var levelTwo = '${appInfoDTO.levelTwo}'

                        for(var i=0; i<len ;i++){
                            //将数据拼装成 html格式；
                            html  = html+'<option value="'+data[i].id+'"';
                            if(data[i].id == levelTwo){
                                html += 'selected ';
                            }
                            html += '>'+data[i].categoryName+'</option>';
                        }
                        $('#levelTwo').html(html);
                        form.render();
                    }
                })
            }
            // //选择二级的选择框
            // var html='<option>手机</option>'
            // $('#levelTwo').html(html);
            // //必须重新渲染 才能出下一个复选框；
            // form.render();
        })
        //对二级监听===========================================================
        form.on('select(levelTwo)',function () {
            //获取id
            var  levelTwoId = $('#levelTwo').val();
            if(levelTwoId == 0){
                var html='<option value="0">-请选择-</option>';
                $('#levelThree').html(html);
                form.render();
                return ;
            }else{
                $.ajax({
                    url:'/category//queryLevelThreeByLevelTwo/'+levelTwoId,
                    type:'get',
                    success:function (data) {
                        //根据data修改数据重新渲染；
                        var html='<option value="0">-请选择-</option>';
                        var len = data.length;
                        for(var i = 0; i < len ;i++){
                            //将数据拼装成 html格式；
                            html  = html+ '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>';
                        }
                        $('#levelThree').html(html);
                        form.render();
                    }
                })
            }
        })
    });
</script>
</body>
</html>
