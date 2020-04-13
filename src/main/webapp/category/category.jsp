<%@page pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>

    //初始化表格加载
    $(function () {
        pageInit();
    });

    //初始化一个表格
    function pageInit() {

        //初始化以一个为表格的方法
        $("#cateTable").jqGrid({
            url: "${path}/category/queryByOnePage",
            datatype: "json",
            rowNum: 8,
            styleUI: "Bootstrap",
            height: "auto",
            autowidth: true,
            rowList: [8, 10, 20, 30],
            pager: '#catePage',
            viewrecords: true,
            colNames: ['Id', '类别名', '级别'],
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {name: 'cateName',editable:true, index: 'invdate', width: 90},
                {name: 'levels', index: 'name', width: 100}
            ],
            subGrid: true,  //是否开启子表格
            //1.subgrid_id   点击一行时会在父表格中创建一个div，用来容纳子表格，subgrid_id就是div的id
            //2.row_id   点击行的id
            subGridRowExpanded: function (subgridId, rowId) {  //设置子表格相关的属性
                //复制子表格内容
                addSubGrid(subgridId, rowId);
            }
        });

        //父表格分页工具栏
        $("#cateTable").jqGrid('navGrid', '#catePage', {add: true, edit: true, del: true,
        addtext:"添加",edittext:"修改",deltext:"删除"},
            {
                closeAfterEdit:true  //关闭对话框
            },
            {
                closeAfterAdd:true  //关闭对话框
            },
            {
                closeAfterDel:true  //关闭对话框
            }
            );
    }

    /*子表格*/
    function addSubGrid(subgridId, rowId) {


        var subgridTableId = subgridId + "Table";  //定义子表格 Table的id
        var pagerId = subgridId + "Page";   //定义子表格工具栏id

        //在子表格容器中创建子表格和子表格分页工具栏
        $("#" + subgridId).html("<table id='" + subgridTableId + "' ><div id='" + pagerId + "'>");

        //子表格
        $("#" + subgridTableId).jqGrid({
            url: "${path}/category/queryByTwoPage?parentId=" + rowId,
            datatype: "json",
            rowNum: 8,
            styleUI: "Bootstrap",
            height: "auto",
            autowidth: true,
            rowList: [8, 10, 20, 30],
            pager: "#" + pagerId,
            viewrecords: true,
            colNames: ['Id', '类别名', '级别', '上级类别id'],
            colModel: [
                {name: 'id', index: 'id', width: 55},
                {name: 'cateName', index: 'invdate', width: 90},
                {name: 'levels', index: 'name', width: 100},
                {name: 'parentId', index: 'name', width: 100}
            ]
        });

        //子表格分页工具栏
        jQuery("#" + subgridTableId).jqGrid('navGrid', "#" + pagerId,
            {edit: true, add: true, del: true,edittext:"修改",addtext:"添加",deltext:"删除"},
            {
                closeAfterEdit:true  //关闭对话框
            },
            {
                closeAfterAdd:true  //关闭对话框
            },
            {
                closeAfterDel:true  //关闭对话框
            }
            );

    }
</script>

<%--初始化面板--%>
<div class="panrl panel-success">

    <%--面板头--%>
    <div class="panel panel-heading">
        分类信息
    </div>

    <%--标签页--%>
    <div class="nav nav-tabs">
        <li class="cative"><a href="">信息展示</a></li>
    </div>

    <%--警告框--%>
    <div id="deleteMsg" class="alert alert-warning alert-dismissible" role="alert" style="width: 300px;display: none">
        <span id="showMsg"/>
    </div>

    <%--按钮组--%>
    <div class="panel panel-body">
        <button id="delBtn" class="btn btn-info">删除类别</button>
    </div>

    <%--初始化表格--%>
    <table id="cateTable"/>

    <%--分页工具栏--%>
    <div id="catePage"/>
</div>