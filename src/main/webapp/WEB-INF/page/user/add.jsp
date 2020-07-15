<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/7
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function addUser() {
            $.post("<%=request.getContextPath()%>/user/addUser",
                $("#fm").serialize(),
                function (data) {
                    if(data.code != 200){
                        alert(data.msg);
                        return;
                    }
                    alert("添加成功")
                    window.location.href ="<%=request.getContextPath()%>/user/toShow";
                })
        }
    </script>
</head>
<body>
    <form id="fm">
        用户名：<input type="text" name="userName"/><br/>
        密码：<input type="text" name="userPwd"/><br/>
        年龄：<input type="text" name="age"/><br/>
        性别：男：<input type="radio" name="sex" value="0"/>
            女：<input type="radio" name="sex" value="1"/><br/>
        爱好：打球：<input type="radio" name="hobby" value="0"/>
             游泳：<input type="radio" name="hobby" value="1"/>
             学习：<input type="radio" name="hobby" value="2"/><br/>
        住址：<input type="text" name="site"/><br/>
        <input type="button" value="添加" onclick="addUser()"/>
    </form>
</body>
</html>
