<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HNGCGX首页</title>
    <base href="<%=basePath%>"></base>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        .carousel-inner img {
            width: 100%;
        }
    </style>
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">HNGCGX</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="user/login"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="flot.html">Flot Charts</a>
                            </li>
                            <li>
                                <a href="morris.html">Morris.js Charts</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                    </li>
                    <li>
                        <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="panels-wells.html">Panels and Wells</a>
                            </li>
                            <li>
                                <a href="buttons.html">Buttons</a>
                            </li>
                            <li>
                                <a href="notifications.html">Notifications</a>
                            </li>
                            <li>
                                <a href="typography.html">Typography</a>
                            </li>
                            <li>
                                <a href="icons.html"> Icons</a>
                            </li>
                            <li>
                                <a href="grid.html">Grid</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span
                                class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">Second Level Item</a>
                            </li>
                            <li>
                                <a href="#">Second Level Item</a>
                            </li>
                            <li>
                                <a href="#">Third Level <span class="fa arrow"></span></a>
                                <ul class="nav nav-third-level">
                                    <li>
                                        <a href="#">Third Level Item</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Item</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Item</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level Item</a>
                                    </li>
                                </ul>
                                <!-- /.nav-third-level -->
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="blank.html">Blank Page</a>
                            </li>
                            <li>
                                <a href="login.html">Login Page</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
        <%--<div class="row">--%>
        <%--<div class="col-lg-12">--%>
        <%--<h1 class="page-header">Dashboard</h1>--%>
        <%--</div>--%>
        <%--<!-- /.col-lg-12 -->--%>
        <%--</div>--%>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-3 col-md-6" style="margin-top: 20px">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">26</div>
                                <div>住宅建筑</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" style="margin-top: 20px">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tasks fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">12</div>
                                <div>商业建筑</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" style="margin-top: 20px">
                <div class="panel panel-yellow">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-shopping-cart fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">124</div>
                                <div>桥梁道路</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" style="margin-top: 20px">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-support fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">13</div>
                                <div>园艺盆栽</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">

                <%--推荐广告--%>
                <div class="" style="height: 400px">
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel" data-interval="2000">
                        <%--@*轮播指标*@--%>
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel1" data-slide-to="1"></li>
                            <li data-target="#myCarousel1" data-slide-to="2"></li>
                            <li data-target="#myCarousel1" data-slide-to="3"></li>
                        </ol>
                        <%--@*轮播项目*@--%>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img alt="first" src="img/index/che1.jpg" style="height: 400px;"/>
                                <div class="carousel-caption">标题 1</div>
                            </div>
                            <div class="item">
                                <img alt="first" src="img/index/che2.jpg" style="height: 400px"/>
                                <div class="carousel-caption">标题 2</div>
                            </div>
                            <div class="item">
                                <img alt="first" src="img/index/che3.jpeg" style="height: 400px"/>
                                <div class="carousel-caption">标题 3</div>
                            </div>
                            <div class="item">
                                <img alt="first" src="img/index/che4.jpeg" style="height: 400px"/>
                                <div class="carousel-caption">标题 4</div>
                            </div>
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="carousel-control left" href="#myCarousel1"
                       data-slide="prev" style="height: 400px; margin-left: 15px">&lsaquo;</a>
                    <a class="carousel-control right" href="#myCarousel1"
                       data-slide="next" style="height: 400px;margin-right: 15px">&rsaquo;</a>
                    <script>
                        $(function () {
                            $('#myCarousel1').carousel({
                                interval: 2000
                            });
                        })
                    </script>
                </div>


                <!-- /.panel 资料展示-->
                <div class="panel panel-default" style="margin-top: 20px">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> 共享资料下载区
                    </div>
                    <div class="container-fluid">

                        <%
                            if (10 % 3 == 0) {
                                for (int i = 0; i < 10 / 3; i++) {
                        %>
                        <div class="row" style="margin-top: 15px">
                            <%
                                for (int j = 0; j < 3; j++) {
                            %>

                            <div class="col-xs-6 col-md-4">
                                <% if (j == 0) {%>
                                <div class="panel panel-default">
                                    <% } else if (j == 1) {%>
                                    <div class="panel panel-primary">
                                        <% } else if (j == 2) {%>
                                        <div class="panel panel-success">
                                            <% }%>
                                    <div class="panel-heading">
                                        Default Panel
                                    </div>
                                    <div class="panel-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt
                                            est
                                            vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et,
                                            fringilla augue.</p>
                                    </div>
                                    <div class="panel-footer">
                                        Panel Footer
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <%
                            }
                        } else {
                            for (int i = 0; i < (10 / 3) + 1; i++) {
                        %>
                        <div class="row" style="margin-top: 15px">
                            <%
                                for (int j = 0; j < (10 - (i * 3) > 3 ? 3 : 10 - (i * 3)); j++) {
                            %>

                            <div class="col-xs-6 col-md-4">
                                <% if (j == 0) {%>
                                <div class="panel panel-default">
                                    <% } else if (j == 1) {%>
                                    <div class="panel panel-primary">
                                        <% } else if (j == 2) {%>
                                        <div class="panel panel-success">
                                            <% }%>
                                    <div class="panel-heading">
                                        Default Panel
                                    </div>
                                    <div class="panel-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt
                                            est
                                            vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et,
                                            fringilla augue.</p>
                                    </div>
                                    <div class="panel-footer">
                                        Panel Footer
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <%
                                }
                            }
                        %>

                        <%--<div class="row" style="margin-top: 15px">--%>
                        <%--<div class="col-xs-6 col-md-4" >--%>
                        <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                        <%--Default Panel--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt--%>
                        <%--est--%>
                        <%--vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et,--%>
                        <%--fringilla augue.</p>--%>
                        <%--</div>--%>
                        <%--<div class="panel-footer">--%>
                        <%--Panel Footer--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<!-- /.col-lg-4 -->--%>
                        <%--<div class="col-xs-6 col-md-4" >--%>
                        <%--<div class="panel panel-primary">--%>
                        <%--<div class="panel-heading">--%>
                        <%--Primary Panel--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt--%>
                        <%--est--%>
                        <%--vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et,--%>
                        <%--fringilla augue.</p>--%>
                        <%--</div>--%>
                        <%--<div class="panel-footer">--%>
                        <%--Panel Footer--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<!-- /.col-lg-4 -->--%>
                        <%--<div class="col-xs-6 col-md-4" >--%>
                        <%--<div class="panel panel-success">--%>
                        <%--<div class="panel-heading">--%>
                        <%--Success Panel--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                        <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt--%>
                        <%--est--%>
                        <%--vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et,--%>
                        <%--fringilla augue.</p>--%>
                        <%--</div>--%>
                        <%--<div class="panel-footer">--%>
                        <%--Panel Footer--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<!-- /.col-lg-4 -->--%>
                        <%--</div>--%>
                    </div>
                    <nav aria-label="..." style="text-align: center">
                        <ul class="pagination">
                            <li class="disabled">
                              <span>
                                <span aria-hidden="true">&laquo;</span>
                              </span>
                            </li>
                            <li class="active">
                                <span>1 <span class="sr-only">(current)</span></span>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-bell fa-fw"></i> Notifications Panel
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="list-group">
                            <a href="#" class="list-group-item">
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-tasks fa-fw"></i> New Task
                                <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small"><em>11:32 AM</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                                <span class="pull-right text-muted small"><em>11:13 AM</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-warning fa-fw"></i> Server Not Responding
                                <span class="pull-right text-muted small"><em>10:57 AM</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                                <span class="pull-right text-muted small"><em>9:49 AM</em>
                                    </span>
                            </a>
                            <a href="#" class="list-group-item">
                                <i class="fa fa-money fa-fw"></i> Payment Received
                                <span class="pull-right text-muted small"><em>Yesterday</em>
                                    </span>
                            </a>
                        </div>
                        <!-- /.list-group -->
                        <a href="#" class="btn btn-default btn-block">View All Alerts</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<script src="data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>

</body>

</html>

