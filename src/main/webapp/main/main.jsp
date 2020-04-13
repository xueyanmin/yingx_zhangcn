<%@page pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>持明法州后台管理系统</title>
    <link rel="icon" href="${path}/bootstrap/img/arrow-up.png" type="image/x-icon">
    <link rel="stylesheet" href="${path}/bootstrap/css/bootstrap.css">

    <%--引入jqgrid中主题css--%>
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/css/css/hot-sneaks/jquery-ui-1.8.16.custom.css">
    <link rel="stylesheet" href="${path}/bootstrap/jqgrid/boot/css/trirand/ui.jqgrid-bootstrap.css">
    <%--引入js文件--%>
    <script src="${path}/bootstrap/js/jquery.min.js"></script>
    <script src="${path}/bootstrap/js/bootstrap.js"></script>
    <script src="${path}/bootstrap/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script src="${path}/bootstrap/jqgrid/boot/js/trirand/jquery.jqGrid.min.js"></script>
    <script src="${path}/bootstrap/js/ajaxfileupload.js"></script>

</head>
<body>
    <!--顶部导航-->
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">应学APP后台管理系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">欢迎：<span class="text text-primary">${admin.username}</span></a></li>
                    <li><a href="${path}/admin/logout">退出<span class="glyphicon glyphicon-log-out"/></a></li>

                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <!--栅格系统-->
    <div class="container-fluid">
        <div class="row">

            <!--左边手风琴部分-->
            <div class="col-sm-2">
                <div class="panel-group" id="accordion" role="tablist">
                    <div class="panel panel-danger text-center">
                        <div class="panel-heading" role="tab" id="headingOne">
                            <h4 class="panel-title" >
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    用户管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel">
                            <div class="panel-body">
                                <button class="btn btn-danger">
                                    <a href="javascript:$('#MainId').load('${path}/user/user.jsp')"> 用户展示</a>
                                </button><br/><br/>
                                <button class="btn btn-danger">用户统计</button><br/><br/>
                                <button class="btn btn-danger">用户分布</button><br/><br/>
                            </div>
                        </div>
                    </div>
                </div>
                    <div class="panel panel-success text-center">
                        <div class="panel-heading" role="tab" id="headingWar">
                            <h4 class="panel-title" >
                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseWar">
                                   分类管理
                                </a>
                            </h4>
                        </div>
                        <div id="collapseWar" class="panel-collapse collapse" role="tabpanel">
                            <div class="panel-body">
                                <button class="btn btn-danger">
                                    <a href="javascript:$('#MainId').load('${path}/category/category.jsp')">分类展示</a>
                                </button><br/><br/>
                            </div>
                        </div>
                     </div>
                  <div class="panel panel-warning text-center">
                    <div class="panel-heading" role="tab" id="headingTo">
                        <h4 class="panel-title" >
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTo">
                                视屏管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTo" class="panel-collapse collapse" role="tabpanel">
                        <div class="panel-body">
                            <button class="btn btn-warning">视屏展示</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-info text-center">
                    <div class="panel-heading" role="tab" id="headingSr">
                        <h4 class="panel-title" >
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSr">
                                日志管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseSr" class="panel-collapse collapse" role="tabpanel">
                        <div class="panel-body">
                            <button class="btn btn-info">日志展示</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary text-center">
                    <div class="panel-heading" role="tab" id="headingFive">
                        <h4 class="panel-title" >
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                反馈管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel">
                        <div class="panel-body">
                            <button class="btn btn-primary">反馈展示</button>
                        </div>
                    </div>
                </div>

            </div>

            <!--右边巨幕开始-->
            <div class="col-sm-9" id="MainId">
                <div class="jumbotron">
                    <h2>欢迎来到应学视屏APP后台管理系统</h2>
                </div>
                <!--右边轮播图部分-->
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- 轮播条数 -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <!-- 轮播内容 -->
                    <div class="carousel-inner" role="listbox" align="center">
                        <div class="item active">
                            <img src="${path}/bootstrap/img/6.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="${path}/bootstrap/img/pic2.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="${path}/bootstrap/img/pic3.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        <div class="item">
                            <img src="${path}/bootstrap/img/pic4.jpg" alt="...">
                            <div class="carousel-caption">
                                ...
                            </div>
                        </div>
                        ...
                    </div>

                    <!-- 控制前后轮播 -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

        </div>
    </div><hr>
    <!--页脚-->
    <div class="panel panel-footer">
        <div align="center">@百知教育zhangcn@zparkhr.com</div>
    </div>

</body>
</html>
