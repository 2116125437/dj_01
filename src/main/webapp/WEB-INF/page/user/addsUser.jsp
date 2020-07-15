<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/7/8
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/res/jquery-1.12.4.js"></script>
    <script type="text/javascript">

        function batchAdd(){
            $.post("<%=request.getContextPath()%>/user/batchAdd",
                $("#fm").serialize(),
                function(data){
                    if(data.code != 200){
                        alert(data.msg);
                        return;
                    }
                    alert(data.msg);
                    window.location.href ="<%=request.getContextPath()%>/user/toShow";
                })
        }

        var i = 0;
        function addBatch(){
            i++;
            var html = "<div> <hr/>"
            html+="<input type = 'button' value='删除' onclick = 'delBatch(this)' /><br/>"
            html+="用户名：<input type='text' name='list["+i+"].userName'/><br/>"
            html+="密码：<input type='text' name='list["+i+"].userPwd'/><br/>"
            html+="年龄：<input type='text' name='list["+i+"].age'/><br/>"
            html+="性别：男：<input type='radio' name='list["+i+"].sex'value='0'/>"
            html+="女：<input type='radio' name='list["+i+"].sex' value='1'/><br/>"
            html+="爱好：打球：<input type='radio' name='list["+i+"].hobby' value='0'/>"
            html+="游泳：<input type='radio' name='list["+i+"].hobby' value='1'/>"
            html+="学习：<input type='radio' name='list["+i+"].hobby' value='2'/><br/>"
            html+=" 住址：<input type='text' name='list["+i+"].site'/><br/>"
            html+="</div>"
            $("#adds").append(html);
        }

        function delBatch(obj){
            $(obj).parent().remove();
        }
    </script>
</head>
<body>
<input type='button' value='新增' onclick = "addBatch()"/>

<form id="fm">
    用户名：<input type="text" name="list[0].userName"/><br/>
    密码：<input type="text" name="list[0].userPwd"/><br/>
    年龄：<input type="text" name="list[0].age"/><br/>
    性别：男：<input type="radio" name="list[0].sex" value="0"/>
    女：<input type="radio" name="list[0].sex" value="1"/><br/>
    爱好：打球：<input type="radio" name="list[0].hobby" value="0"/>
    游泳：<input type="radio" name="list[0].hobby" value="1"/>
    学习：<input type="radio" name="list[0].hobby" value="2"/><br/>
    住址：<input type="text" name="list[0].site"/><br/>

    <div id="adds"></div>
    <input type = "button" value = "添加" onclick = "batchAdd()"/>
</form>
</body>
</html>
