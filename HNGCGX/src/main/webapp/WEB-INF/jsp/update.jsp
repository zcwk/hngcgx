<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<%@include file="common/tag.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>


    <title>个人主页</title>
    <base href="<%=basePath%>"></base>

    <%@include file="common/head.jsp" %>

    <script type="text/javascript">
        function showImage() {
            var r = new FileReader();
            f = document.getElementById('image').files[0];
            r.readAsDataURL(f);
            r.onload = function (e) {
                document.getElementById('show').src = this.result;
            };
        }
    </script>
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="user/goUserHomePage">个人主页</a>
        </div>
        <!-- /.navbar-header -->

        <%@include file="common/user.jsp" %>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper">
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default" style="margin-top: 20px">
                    <div class="panel-heading">
                        修改资料
                    </div>

                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <form action="user/doUpdate/${project.id}" method="post" enctype="multipart/form-data">
                            <div class="form-group" style="margin-top: 10px">
                                <label for="title">项目类型</label>
                                <select class="form-control" name="projectType">
                                    <c:forEach var="list" items="${typeList}" varStatus="index">
                                        <option  <c:if
                                                test='${project.projectType.equals(list)}'> selected="true" </c:if>
                                        >${list}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="title">项目标题</label>
                                <input type="text" class="form-control" id="title" name="projectTitle"
                                       placeholder="项目标题"
                                       value="${project.projectTitle}">
                            </div>
                            <div class="form-group">
                                <label for="detail">项目介绍</label>
                                <textarea class="form-control" rows="3" id="detail" name="projectDetail"
                                          placeholder="介绍项目">${project.projectDetail}</textarea>
                            </div>
                            <c:if test="${project.images!=null}">
                                <div class="form-group">
                                    <img id="show" style="width: 100%;height: 300px" src="${project.images}">
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label for="image">选择照片</label>
                                <input type="file" id="image" onchange="showImage()" name="updateImage">
                                <p class="help-block">用于展示的照片.</p>
                            </div>

                            <div class="form-group">
                                <label for="file">选择文件</label>
                                <input type="file" id="file" name="updateFile">
                                <p class="help-block">
                                    文件格式*.zip;*.rar;*.doc;*.xls;*.docx;*.ppt;*.pptx;*.txt;*.pdf;*.dwg'</p>
                            </div>
                            <button type="submit" class="btn btn-default">提交修改</button>
                        </form>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<%@include file="common/foot.jsp" %>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
</script>

</body>

</html>
