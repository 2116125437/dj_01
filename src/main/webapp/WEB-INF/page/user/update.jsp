<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/7
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        function updateUser() {
            $.post("<%=request.getContextPath()%>/user/updateUser",
                $("#fm").serialize(),
                function (data) {
                    if(data.code == 200){
                        alert("修改成功");
                        window.location.href ="<%=request.getContextPath()%>/user/toShow";
                    }
                })
        }
    </script>
</head>
<body>
    <form id="fm">
        <input type="hidden" name="id" value="${user.id}"/>
        用户名：<input type="text" name="userName" value="${user.userName}"/><br/>
        密码：<input type="text" name="userPwd" value="${user.userPwd}"/><br/>
        年龄：<input type="text" name="age" value="${user.age}"/><br/>
        性别：男：<input type="radio" name="sex" value="0" <c:if test="${user.sex == 0}">checked</c:if>/>
        女：<input type="radio" name="sex" value="1" <c:if test="${user.sex == 1}">checked</c:if>/><br/>
        爱好：打球：<input type="radio" name="hobby" value="0" <c:if test="${user.hobby == 0}">checked</c:if>/>
        游泳：<input type="radio" name="hobby" value="1" <c:if test="${user.hobby == 1}">checked</c:if>/>
        学习：<input type="radio" name="hobby" value="2" <c:if test="${user.hobby == 2}">checked</c:if>/><br/>
        住址：<input type="text" name="site" value="${user.site}"/><br/>
        <input type="button" value="修改" onclick="updateUser()"/>
    </form>
</body>
</html>
