<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 10420
  Date: 2019/3/7
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <br>
        <form class="layui-form" action="/app/query" method="post">
            <div class="layui-form-item">
            <label class="layui-form-label">软件名称</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="pageNum" lay-verify="title" autocomplete="off" value="1" class="layui-input">
                </div>
            <div class="layui-input-inline">
                <input type="text" name="softwareName" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="${appInfoDTO.softwareName}">
            </div>
            <label class="layui-form-label">APP状态</label>
            <div class="layui-input-inline">
                <select name="appStatus" lay-filter="aihao">
                    <option value="0">-请选择-</option>
                    <c:forEach items="${appStatus}" var="obj">
                        <option value="${obj.valueId}" <c:if test="${obj.valueId eq appInfoDTO.appStatus}">selected</c:if>>${obj.valueName}</option>
                    </c:forEach>
                </select>
            </div>
            <label class="layui-form-label">所属平台</label>
            <div class="layui-input-inline">
                <select name="appFlatForm" lay-filter="aihao">
                    <option value="0">-请选择-</option>
                    <c:forEach items="${flatform}" var="obj">
                        <option value="${obj.valueId}" <c:if test="${obj.valueId eq appInfoDTO.appFlatForm}">selected</c:if>>${obj.valueName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
            <div class="layui-form-item">
                <label class="layui-form-label">一级分类</label>
                <div class="layui-input-inline">
                    <select name="levelOne" lay-filter="levelOne" id="levelOne">
                        <option value="0">-请选择-</option>
                        <c:forEach items="${levelOne}" var="obj">
                            <option value="${obj.id}" <c:if test="${obj.id eq appInfoDTO.levelOne}">selected</c:if>>${obj.categoryName}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                <label class="layui-form-label">二级分类</label>
                <div class="layui-input-inline">
                    <select name="levelTwo" lay-filter="levelTwo" id="levelTwo">
                    </select>
                </div>
                <label class="layui-form-label">三级分类</label>
                <div class="layui-input-inline">
                    <select name="levelThree" lay-filter="levelThree" id="levelThree">
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                </div>
            </div>
        </form>
        <div class="layui-input-block">
            <a class="layui-btn" href="/app/toAdd">新增APP信息</a>
        </div>
        <div style="padding: 15px;">
            <table class="layui-table">
                <thead>
                <tr>
                    <th>软件名称</th>
                    <th>APK名称</th>
                    <th>软件大小</th>
                    <th>所属平台</th>
                    <th>所属分类</th>
                    <th>状态</th>
                    <th>下载次数</th>
                    <th>最新版本号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="obj">
                    <tr>
                        <td>${obj.softwareName}</td>
                        <td>${obj.APKName}</td>
                        <td>${obj.softwareSize}</td>
                        <td>
                            <c:if test="${obj.flatformId eq 1}">
                                手机
                            </c:if>
                            <c:if test="${obj.flatformId eq 2}">
                                平板
                            </c:if>
                            <c:if test="${obj.flatformId eq 3}">
                                 PC
                            </c:if>
                        </td>
                        <td>
                            ${obj.categoryLevel1.categoryName}->${obj.categoryLevel2.categoryName}->${obj.categoryLevel3.categoryName}
                        </td>
                        <td>${obj.status}</td>
                        <td>${obj.downloads}</td>
                        <td>${obj.newAppVersion.versionNo}</td>
                        <td>
                            <a href="/app/queryAll/${obj.id}" class="layui-btn layui-btn-sm"><i class="layui-icon">&#xe615;</i></a>
                            <a href="/app/toUpdata/${obj.id}" class="layui-btn layui-btn-sm layui-btn-normal"><i class="layui-icon">&#xe642;</i></a>
                            <a href="/app/delete/${obj.id}" class="layui-btn layui-btn-danger layui-btn-sm"><i class="layui-icon">&#xe640;</i></a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>
                        共${page.total} 条记录 第${page.pageNum}/ ${page.pages}页
                    </td>
                    <td>
                        <a href="javascript:void(0);" page="first">首页</a>
                        <a href="javascript:void(0);" page="prev">上页</a>
                        <a href="javascript:void(0);" page="next">下页</a>
                        <a href="javascript:void(0);" page="last">末页</a>
                    </td>
                </tr>
                </tbody>
            </table>
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
        //分页=================================================================
        $('a[page]').click(function () {
            var currPage = '${page.pageNum}';
            var pageNum = 1 ;
            var v = $(this).attr('page');
            switch (v){
                case "first":
                    pageNum = 1;
                    break;
                case "prev":
                    pageNum = currPage - 1;
                    if (pageNum < 1){
                        pageNum = 1;
                    }
                    break;
                case "next":
                    pageNum = parseInt(currPage) + 1;
                    if(pageNum > ${page.pages}){
                        pageNum = ${page.pages};
                    }
                    break;
                case "last":
                    pageNum = ${page.pages};
                    break;
            }
            //更新表单中隐藏域的 pagenum
            $('input[name=pageNum]').val(pageNum);
            //更新表单
            $('form').submit();
        })
        //对form表单上传的信息进行保存，使其在能刷新后自动填充；=================================
        $(function () {
            //取出一级分类信息
            var levelOne = $('#levelOne').val();
            if(levelOne !=0  && levelOne != null && levelOne != undefined){
                var levelTwo = '${appInfoDTO.levelTwo}';
                if(levelTwo  !=0  && levelTwo  != null && levelTwo  != undefined){
                    //二级曾经选过；
                    //需要再次更改为一级曾经提交的数据，才能触发二级的修改；
                    $.ajax({
                        url:'/category/queryLevelTwoByLevelOne/'+levelOne,
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
                    var levelThree = '${appInfoDTO.levelThree}';
                    if(levelThree !=0  && levelThree  != null && levelThree  != undefined){
                        //三级曾经选过；
                        //需要再次更改为一级曾经提交的数据，才能触发三级的修改；
                        $.ajax({
                            url:'/category/queryLevelTwoByLevelOne/'+levelTwo,
                            type:'get',
                            success:function (data) {
                                //根据data修改数据重新渲染；
                                var html='<option value="0">-请选择-</option>';
                                var len = data.length;
                                var levelThree = '${appInfoDTO.levelThree}'

                                for(var i=0; i<len ;i++){
                                    //将数据拼装成 html格式；
                                    html  = html+'<option value="'+data[i].id+'"';
                                    if(data[i].id == levelThree){
                                        html += 'selected ';
                                    }
                                    html += '>'+data[i].categoryName+'</option>';
                                }
                                $('#levelThree').html(html);
                                form.render();
                            }
                        })
                    }
                }
            }
        })
    });
</script>
</body>
</html>
