<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册界面</title>
    <base href="<%=basePath%>"></base>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="register/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="register/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="register/css/form-elements.css">
    <link rel="stylesheet" href="register/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="register/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="register/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="register/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="register/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="register/ico/apple-touch-icon-57-precomposed.png">

    <script language="javascript">
        function keywordfocus() {
            document.getElementById('error-show').style.display = 'none';
        }


        function checkMobile() {
            var p = document.getElementById('form-first-phone');
            var phone = p.value;
            if (!(/^1[34578]\d{9}$/.test(phone))) {
                p.value = '手机号码有误，请重填';
                p.focus();
            }
        }
    </script>
</head>

<body>

<c:forEach items="${errors}" var="error">
    <div id="error-show" class="alert alert-danger" role="alert">
            ${error}
    </div>
</c:forEach>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>HNGCGX</strong> 新用户注册</h1>
                    <div class="description">
                        <p>
                            网站介绍。。。
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">

                    <form role="form" action="user/addUser" class="registration-form">

                        <fieldset>
                            <div class="form-top">
                                <div class="form-top-left">
                                    <p>Tell us who you are:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <div class="form-group">
                                    <label class="sr-only" for="form-first-name">用户名</label>
                                    <input type="text" oninput="keywordfocus();" name="userName" placeholder="请输入用户名..."
                                           class="form-first-name form-control" id="form-first-name">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-first-phone">手机号码</label>
                                    <input type="text" oninput="keywordfocus();" onblur="checkMobile()" name="userPhone"
                                           placeholder="请输入手机号码..."
                                           class="form-first-phone form-control" id="form-first-phone">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">密码</label>
                                    <input type="password" oninput="keywordfocus();" name="userPwd" placeholder="密码..."
                                           class="form-password form-control" id="form-password">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-repeat-password">确认密码</label>
                                    <input type="password" oninput="keywordfocus();" name="userPwd2"
                                           placeholder="确认密码..."
                                           class="form-repeat-password form-control" id="form-repeat-password">
                                </div>
                                <button type="submit" class="btn" >注册</button>

                                <a href="user/goLogin" style="float: right; margin-top: 20px">有账号了直接登录</a>
                            </div>
                        </fieldset>

                    </form>

                </div>
            </div>
        </div>
    </div>

</div>


<!-- Javascript -->
<script src="register/js/jquery-1.11.1.min.js"></script>
<script src="register/bootstrap/js/bootstrap.min.js"></script>
<script src="register/js/jquery.backstretch.min.js"></script>
<script src="register/js/retina-1.1.0.min.js"></script>
<script src="register/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="register/js/placeholder.js"></script>
<![endif]-->

</body>

</html>