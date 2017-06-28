<%--
  Created by IntelliJ IDEA.
  User: xinchen
  Date: 2017/6/28
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
登录
<form action="${pageContext.request.contextPath}/sys/login" method="post">
    <span>用户名：</span>
    <input type="text" name="username">
    <span>密码：</span>
    <input type="password" name="password" >
    <input type="submit" value="login in">
</form>
</body>
</html>
