<%@ page contentType="text/html; charset=utf-8" %>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <li>
                <a href="user/goUserHomePage"><i class="fa fa-dashboard fa-fw"></i> 昵称：${user.userName}</a>
            </li>
            <li>
                <a><i class="fa fa-table fa-fw"></i> 电话：${user.userPhone}</a>
            </li>
            <li>
                <a><i class="fa fa-edit fa-fw"></i>
                    个性签名：${user.userDetail}</a>
            </li>
        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
