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

</head>

<body>

<!-- Top menu -->
<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Bootstrap Multi Step Registration Form Template</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->

    </div>
</nav>

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

                    <form role="form" action="" method="post" class="registration-form">

                        <fieldset>
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Step 1 / 2</h3>
                                    <p>Tell us who you are:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-user"></i>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <div class="form-group">
                                    <label class="sr-only" for="form-first-name">用户名</label>
                                    <input type="text" name="form-first-name" placeholder="用户名..."
                                           class="form-first-name form-control" id="form-first-name">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-password">密码</label>
                                    <input type="password" name="form-password" placeholder="密码..."
                                           class="form-password form-control" id="form-password">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-repeat-password">确认密码</label>
                                    <input type="password" name="form-repeat-password" placeholder="确认密码..."
                                           class="form-repeat-password form-control" id="form-repeat-password">
                                </div>
                                <button type="button" class="btn btn-next">下一步</button>
                            </div>
                        </fieldset>

                        <fieldset>
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Step 2 / 2</h3>
                                    <p>Set up your account:</p>
                                </div>
                                <div class="form-top-right">
                                    <i class="fa fa-key"></i>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <div class="form-group">
                                    <label class="sr-only" for="form-email">Email</label>
                                    <input type="email" name="form-email" placeholder="邮箱..."
                                           class="form-email form-control" id="form-email">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-email">Phone</label>
                                    <input type="text" name="form-email" placeholder="电话..."
                                           class="form-email form-control" id="form-phone">
                                </div>
                                <div class="form-group">
                                    <label class="sr-only" for="form-about-yourself">自我介绍</label>
                                    <textarea name="form-about-yourself" placeholder="自我介绍..."
                                              class="form-about-yourself form-control"
                                              id="form-about-yourself"></textarea>
                                </div>
                                <button type="button" class="btn btn-previous">上一步</button>
                                <button type="submit" class="btn">注册</button>
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