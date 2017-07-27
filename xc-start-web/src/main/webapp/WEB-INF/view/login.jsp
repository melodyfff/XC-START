<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/plugins/sweetalert/sweetalert.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/lib/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/plugins/sweetalert/sweetalert.min.js"></script>
    <style>
        .my {
            padding-top: 5%;
            width: 50%;
            text-align: center;
        }
        .my-form-div{
            width: 60%;
            text-align: center;
            margin:0 auto;
        }
    </style>
</head>

<body>

<div class="container my">
    <h1>Demo</h1>
    <div class="my-form-div">
        <form action="${pageContext.request.contextPath}/sys/login" method="post">
            <div class="form-group">
                <label for="username"></label>
                <input type="text" name="username" class="form-control" id="username" placeholder="用户名">
            </div>
            <div class="form-group">
                <label for="password"></label>
                <input type="password" class="form-control" name="password" id="password" placeholder="密码">
            </div>
            <div class="form-group">
                <input id="commit" type="submit" class="btn btn-info" />
            </div>
        </form>
    </div>
</div>

<%--<script>--%>
    <%--$(function ($) {--%>
        <%--$('#commit').on('click', function () {--%>
            <%--var data = {--%>
                <%--username: $('#username').val(),--%>
                <%--password: $('#password').val()--%>
            <%--};--%>
            <%--$.ajax({--%>
                <%--type: "POST",--%>
                <%--url: "${pageContext.request.contextPath}/sys/login",--%>
                <%--data: data,--%>
                <%--dataType: "json",--%>
                <%--success: function (result) {--%>
                    <%--if (result.code == 0) {//登录成功--%>
                        <%--console.log(result);--%>
                        <%--swal({--%>
                            <%--title: '登录成功！',--%>
                            <%--text: '欢迎使用',--%>
                            <%--type: 'success',--%>
<%--//                        timer: 2000,--%>
                            <%--showConfirmButton: true,--%>
                            <%--showCancelButton: true,--%>
                            <%--cancelButtonText: '退出',--%>
                            <%--confirmButtonText: "进入主页"--%>
                        <%--}, function (isConfirm) {--%>
                            <%--if (isConfirm) {--%>
                                <%--location.href = '${pageContext.request.contextPath}/test/test';--%>
                            <%--} else {--%>
                                <%--location.reload();--%>
                            <%--}--%>
                        <%--});--%>
<%--//--%>
                    <%--} else {--%>
                        <%--swal("登录失败", result.msg, "warning")--%>
                    <%--}--%>
                <%--}--%>
            <%--});--%>
        <%--})--%>
    <%--});--%>
<%--</script>--%>

</body>
</html>
