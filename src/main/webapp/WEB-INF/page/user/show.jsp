<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/7
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        var proids = null;

         $(function () {
             $("#pageNo").val(1);
             search();
         })

        function search1() {
            $("#pageNo").val(1);
            search();
        }

         //赋选中复选框的值
         function selectedValue() {
             proids = $('input[name="proids"]:checked');
             var chk_value = [];
             $.each(proids,function(){
                 chk_value.push($(this).val());
             })
             $("#findByIds").val(chk_value);
             //alert(chk_value);
             return chk_value;
         }

        function search() {
            $.post("<%=request.getContextPath()%>/user/show",
                $("#fm").serialize(),
                function (data) {
                    var html = "";
                    var pageInfo = "";
                    for (var i = 0; i < data.data.list.length; i++) {
                         var user = data.data.list[i];
                         html += "<tr>"
                         html += "<td><input type = 'checkbox' name = 'proids' value = '"+user.id+"'/></td>"
                         html += "<td>"+user.id+"</td>"
                         html += "<td>"+user.userName+"</td>"
                         html += "<td>"+user.userPwd+"</td>"
                         html += "<td>"+user.age+"</td>"
                         if (user.sex == 0){
                             html += "<td>男</td>"
                         } else {
                             html += "<td>女</td>"
                         }
                         if (user.hobby == 0){
                             html += "<td>打球</td>"
                         } else if (user.hobby == 1){
                             html += "<td>游泳</td>"
                         } else {
                             html += "<td>学习</td>"
                         }
                         html += "<td>"+user.site+"</td>"
                         html += "<td>"+user.createTime+"</td>"
                         html += "<td>"
                         html += "<input type='button' value='删除' onclick='delUser("+user.id+")'/>"
                         html += "<input type='button' value='修改' onclick='updUser("+user.id+")'/>"
                         html += "</td>"
                         html += "</tr>"
                    }
                    $("#tb").html(html);
                    pageInfo += "<input type='button' value='上一页' onclick='page(0,"+data.data.pages+")'/>";
                    pageInfo += "<input type='button' value='下一页' onclick='page(1,"+data.data.pages+")'/>";

                    $("#pageInfo").html(pageInfo);
                })
        }

        /**
         *分页
         */
         function page(s,pages){
             var pa =$("#pageNo").val();
             if(s == 0){
                 if((parseInt(pa) - 1) < 1){
                     alert("已到首页");
                     return;
                 }
                 $("#pageNo").val(parseInt(pa) - 1);
             }
             if(s == 1){
                 if(parseInt(pa) + 1 > pages){
                     alert("已到尾页");
                     return;
                 }
                 $("#pageNo").val(parseInt(pa) + 1);
             }
             search();
         }

        /**
         *新增
         */
        function addUser() {
            window.location.href ="<%=request.getContextPath()%>/user/toAdd";
        }

        /**
         *删除
         */
         function delUser(id) {
             $.post("<%=request.getContextPath()%>/user/delUser",
                 {"id":id},
                 function (data) {
                     if(data.code == 200){
                         alert("删除成功")
                         window.location.href ="<%=request.getContextPath()%>/user/toShow";
                     }
                 })
         }

        /**
         * 修改
         */
         function updUser(id) {
             window.location.href ="<%=request.getContextPath()%>/user/toUpdUser?id="+id;
         }


        /**
         * 批量删除
         */
        function deleteUser(){
            if(selectedValue().length == 0){
                alert("无法进行删除操作");
                return;
            }
            $.post("<%=request.getContextPath()%>/user/deleteUser",
                {"ids":selectedValue()},
                function(data){
                    if(data.code == 200){
                        alert("删除成功");
                        window.location.href ="<%=request.getContextPath()%>/user/toShow";
                    }
                })
        }

        /**
         * 批量新增
         */
        function addUsers() {
            window.location.href ="<%=request.getContextPath()%>/user/toAddUsers";
        }
    </script>
</head>
<body>
    <input type="button" value="新增" onclick="addUser()"/>
    <input type="button" value="批量删除" onclick="deleteUser()"/>
    <input type="button" value="批量新增" onclick="addUsers()"/><br/>
    <form id="fm">
        <input type="hidden" name="pageNo" id="pageNo" value="1">
        姓名模糊查：<input type="text" name="userName"/>
        性别：男<input type="radio" name="sex" value="0"/>
             女<input type="radio" name="sex" value="1"/>
        打球:<input type = "checkbox" name = "hobby" value = "0"/>
        游泳:<input type = "checkbox" name = "hobby" value = "1"/>
        学习:<input type = "checkbox" name = "hobby" value = "2"/>
        <input type="button" value="查询" onclick="search1()"/><br/>
    </form>
<table>
    <tr>
        <td></td>
        <td>id</td>
        <td>用户名</td>
        <td>密码</td>
        <td>年龄</td>
        <td>性别</td>
        <td>爱好</td>
        <td>住址</td>
        <td>创建时间</td>
    </tr>
    <tbody id="tb"></tbody>
</table>
    <div id = "pageInfo"></div>
</body>
</html>
