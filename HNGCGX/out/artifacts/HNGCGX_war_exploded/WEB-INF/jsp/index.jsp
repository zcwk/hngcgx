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

    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>

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

    <%--分页--%>
    <link type="text/css" href="js/pagination/bootstrap-3.3.1/css/bootstrap.min.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8" src="js/pagination/bootstrap-3.3.1/js/bootstrap.min.js"></script>
    <link type="text/css" href="js/pagination/bootstrap-pagination.min.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8" src="js/pagination/bootstrap-pagination.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var demo3 = BootstrapPagination($(".demo3"),
                {
                    //记录总数。
                    total: ${project.allSize},
                    //分页尺寸。指示每页最多显示的记录数量。
                    pageSize: 9,
                    //当前页索引编号。从其开始（从0开始）的整数。
                    pageIndex: ${project.pageIndex},
                    //指示分页导航栏中最多显示的页索引数量。
                    pageGroupSize: 5,
                    //当分页更改后引发此事件。
                    pageChanged: function (pageIndex, pageSize) {
                        location.href = "/hngcgx/index/"+ pageIndex;
                    },
                });
        });
    </script>
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
                    <li><a
                            <c:choose>
                                <c:when test="${user==null}">
                                    href="user/goLogin"
                                </c:when>
                                <c:otherwise>
                                    href="user/goUserHomePage"
                                </c:otherwise>
                            </c:choose>
                    ><i class="fa fa-user fa-fw"></i> 个人信息</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="user/goLogin"><i class="fa fa-sign-out fa-fw"></i>
                            <c:choose>
                                <c:when test="${user==null}">
                                    登录
                                </c:when>
                                <c:otherwise>
                                    注销
                                </c:otherwise>
                            </c:choose>
                        </a>
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
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>办公建筑<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                            <li>
                                <a href="grid.html">亭台轩榭</a>
                            </li>
                            <li>
                                <a href="grid.html">亭台轩榭</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>

                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>商业酒店<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>住宅建筑<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>别墅建筑<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>景观小品<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>医疗建筑<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="grid.html">室内套装</a>
                            </li>
                            <li>
                                <a href="grid.html">共用设施</a>
                            </li>
                            <li>
                                <a href="grid.html">交通工具</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-files-o fa-fw"></i>其它<span class="fa arrow"></span></a>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>


    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12" style="margin-top: 15px">
                <%--空隙--%>
            </div>
        </div>

        <div class="row">
            <%--下载资料--%>
            <div class="col-lg-8">
                <%--推荐广告--%>
                <div class="" style="height: 400px">
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel" data-interval="2000">
                        <%--@*轮播指标*@--%>
                        <ol class="carousel-indicators">
                            <c:forEach var="ads" items="${ads}">
                                <c:choose>
                                    <c:when test="${ads.index==0}">
                                        <li data-target="#myCarousel1" data-slide-to="${ads.index}" class="active"></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li data-target="#myCarousel1" data-slide-to="${ads.index}"></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </ol>
                        <%--@*轮播项目*@--%>
                        <div class="carousel-inner">
                            <c:forEach var="ads" items="${ads}">
                            <c:choose>
                            <c:when test="${ads.index==0}">
                            <div class="item active">
                                </c:when>
                                <c:otherwise>
                                <div class="item">
                                    </c:otherwise>
                                    </c:choose>
                                    <img alt="first" src="${ads.image}" style="height: 400px"/>
                                    <div class="carousel-caption">${ads.project.projectTitle}</div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="carousel-control left" href="#myCarousel1"
                           data-slide="prev" style="height: 400px; margin-left: 15px">&lsaquo;</a>
                        <a class="carousel-control right" href="#myCarousel1"
                           data-slide="next" style="height: 400px;margin-right: 15px">&rsaquo;</a>
                    </div>

                    <div class="panel panel-default" style="margin-top: 10px">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 资料下载
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <!-- /.row -->
                            <c:forEach var="projectAll" items="${project.list}">
                                <div class="row">
                                    <c:forEach var="project" items="${projectAll}">
                                        <div class="col-lg-4">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                        ${project.projectTitle}
                                                </div>
                                                <div class="panel-body" >
                                                    <img src="${project.images}" style="width: 100%; height:100%"></img>
                                                </div>
                                                <div class="panel-footer">
                                                        ${project.projectDetail}
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <!-- 下面是控制分页控件，必须要是ul元素才行 -->
                            <nav>
                                <ul class="pagination demo3" data-total="101" data-pageindex="1" data-pagesize="20"
                                    data-pagegroupsize="5"
                                    data-leftformatestring="本页{count}条记录/共{total}条记录"
                                    data-rightformatestring="第{pageNumber}页/共{totalPages}页"
                                    data-pagenumberformatestring="{pageNumber}"
                                    data-pagesizelistformatestring="每页显示{pageSize}条记录"
                                    data-prevpagetext="上一页" data-nextpagetext="下一页"
                                    data-prevgrouppagetext="" data-nextgrouppagetext=""
                                    data-firstpagetext="首页" data-lastpagetext="尾页"
                                    data-pageinput-placeholder="GO" data-pageinput-timeout="800"
                                    data-pagesizelist="[5, 10, 20, 50, 100, 200]"
                                    data-pagechanged='function (pageIndex, pageSize) {alert("page changed. pageIndex:" + pageIndex + ",pageSize:" + pageSize);};'
                                    data-layoutscheme="lefttext,pagesizelist,firstpage,prevgrouppage,prevpage,pagenumber,nextpage,nextgrouppage,lastpage,pageinput,righttext">
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- 下载排行 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> 下载排行
                        </div>
                        <div class="panel-body">
                            <div class="list-group">
                                <c:forEach var="download" items="${download}">
                                    <a href="#" class="list-group-item">
                                        <i class="fa fa-comment fa-fw"></i>${download.projectTitle}
                                        <span class="pull-right text-muted small"><em>${download.createTime}</em>
                            </span>
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->

    </div>
    <!-- /.col-lg-4 -->
</div>
<!-- /.row -->
</div>

</div>
</body>

</html>

