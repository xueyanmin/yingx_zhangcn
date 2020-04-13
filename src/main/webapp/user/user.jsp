<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>

    //懒加载
    $(function () {

        //初始化表格
        $("#userTable").jqGrid(
            {
                url: "${path}/user/queryByPage",
                editurl: "${path}/user/edit",   //位表格设置发送请求的url地址
                datatype: "json",
                rowNum: 2,
                rowList: [2, 4, 20, 30],
                pager: '#userPage',   //工具栏
                viewrecords: true,  //是否显示总条数
                styleUI: "Bootstrap",
                height: "auto",
                autowidth: true,
                colNames: ['ID', '用户名', '手机号', '头像', '签名', '微信', '状态', '注册时间'],
                colModel: [
                    {name: 'id', width: 35},
                    {name: 'username', width: 60, editable: true, align: "center"},
                    {name: 'phone', width: 60, editable: true, align: "center"},
                    {name: 'headImg', width: 150, editable: true, align: "center", edittype: "file",
                        formatter: function (cellvalue, options, rowObject) {
                            //参数作用：列的值，操作，行对象
                            return "<img src='${path}/upload/photo/" + cellvalue + "' width='150px' height='100px'/>";

                        }
                    },
                    {name: 'sign', width: 80, editable: true, align: "right"},
                    {name: 'wechat', width: 50, editable: true, align: "right"},
                    {
                        name: 'status', width: 80,
                        //参数作用：列的值,操作，行对象
                        formatter: function (cellvalue, options, rowObject) {
                            if (cellvalue == 1) {
                                return "<button onclick='updateStatus(\""+rowObject.id+"\",\""+cellvalue+"\")' class='btn btn-success' >冻结</button>";
                            } else {
                                return "<button onclick='updateStatus(\""+rowObject.id+"\",\""+cellvalue+"\")' class='btn btn-danger' >解除冻结</button>";
                            }
                        }
                    },

                    {name: 'createDate', width: 80, sortable: false}
                ]

            });

        //表格工具栏
        $("#userTable").jqGrid('navGrid', '#userPage', {
                edit: true,
                add: true,
                del: true,
                addtext: "添加",
                deltext: "删除",
                edittext: "修改"
            },
            {
                closeAfterEdit: true,   //关闭对话框
                //修改文件上传,在afterSubmit提交之后做出体格响应
                afterSubmit:function (response) {
                    $.ajaxFileUpload({
                        url:"${path}/user/uploadUser",//请求路径
                        type:"post",            //请求方式
                        dataType:"text",       //控制页面返回刷新
                        fileElementId: "headImg",   //图片路径
                        data: {id: response.responseText},  //图片修改后的路径
                        success: function () {             //如果提交成功
                            $("#userTable").trigger("reloadGrid");
                        }
                    });
                    //关闭对话框
                    return "hello";
                }
            },//修改之后额外操作
            {
                closeAfterAdd: true,  //关闭对话框


                // 添加文件上传  接收对象
                afterSubmit: function (response) {


                    /* 1：数据的入库 遗留问题：图片路径不对+文件没有上传
                     *  2：在提交之后文件上传到本地
                     *  3：修给图片路径
                     *  4：修改图片路径 获取图片id，图片路径
                     */

                    //fileElementId 需要上传的文件域的ID。ji<input type="file">的Id
                    //responseText: "aa3f80ee-f6c9-44ae-8fac-9e12505c4cda"


                    //需要配至的属性
                    $.ajaxFileUpload({   //异步文件上传,上传之后页面不知道 需要刷新表单
                        url: "${path}/user/saveUser",     //专门做图片文件上传
                        type: "post",
                        dataType: "text",              //控制页面刷新
                        fileElementId: "headImg",      //要上传的文件域ID
                        data: {id: response.responseText},
                        success: function () {

                            //reloadGrid:刷新表单
                            $("#userTable").trigger("reloadGrid");
                        }
                    })

                    //关闭对话框,必须有返回值
                    return "hello";
                }
            },//添加
            {
                //文件上传 afterSubmit在提交之后要做体格响应
                closeAfterDel: true,   //关闭对话框
                //
                afterSubmit:function(response){
                    $.ajax({
                        url:"${path}/user/deleteUser",
                        type:"post",
                        datatype:"text",
                        success: function () {
                            $("#userTable").trigger("reloadGrid");
                        }
                    });
                    //关闭对话框
                    return "hello";
                }

            }//删除
        );

    });

    /**状态修给*/
    function updateStatus(id,status) {

        if (status==1){

            $.ajax({
                url:"${path}/user/edit",
                type:"post",
                data:{"id":id,"status":"0","oper":"edit"},
                success:function () {
                 $("#userTable").trigger("reloadGrid");
                }
            })
        } else {
            $.ajax({
                url:"${path}/user/edit",
                type:"post",
                data:{"id":id,"status":"1","oper":"edit"},
                success:function () {
                    $("#userTable").trigger("reloadGrid");
                }
            });
        }

    }
</script>

<%--初始化一个面板--%>
<div class="panel panel-info">

    <%--表头--%>
    <div class="panel panel-heading">
        <h5>用户信息</h5>
    </div>

    <%--标签页--%>
    <div class="nav nav-tabs">
        <li class="active"><a href="">用户信息</a></li>
    </div>


    <%--按钮--%>
    <button class="btn btn-success">导出用户信息</button>

    <%--初始化表单--%>
    <table id="userTable"/>

    <%--分页工具栏--%>
    <div id="userPage"/>
</div>