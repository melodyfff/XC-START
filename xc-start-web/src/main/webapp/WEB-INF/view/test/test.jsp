<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Maven Demo</title>
    <script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<h1>所有的演示例子</h1>
<h3><a href="${pageContext.request.contextPath}/dao?id=1">[url=./dao.do?id=1]Dao正常错误[/url]</a></h3>
<h3><a href="${pageContext.request.contextPath}/dao?id=10">[url=./dao.do?id=10]Dao参数错误[/url]</a></h3>
<h3><a href="${pageContext.request.contextPath}/dao?id=">[url=./dao.do?id=]Dao未知错误[/url]</a></h3>


<h3>[url=./service.do?id=1]Service正常错误[/url]</h3>
<h3>[url=./service.do?id=10]Service参数错误[/url]</h3>
<h3>[url=./service.do?id=]Service未知错误[/url]</h3>


<h3>[url=./controller.do?id=1]Controller正常错误[/url]</h3>
<h3>[url=./controller.do?id=10]Controller参数错误[/url]</h3>
<h3>[url=./controller.do?id=]Controller未知错误[/url]</h3>


<h3>[url=./404.do?id=1]404错误[/url]</h3>
<h3 id="tess">ajaxTest</h3>
<script>
    $('#tess').click(function () {
        $.ajax({
            type:"GET",
            async:true,  //异步请求
            url:'http://localhost:8080/start/dao?id=1',
            success:function (data) {
                console.log(data);
            },
            error:function (data) {
                console.log("err"+data);
            }
        });
    });
</script>
</body>
</html>