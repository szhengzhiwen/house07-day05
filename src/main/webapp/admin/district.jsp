<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="easyUI/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyUI/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyUI/css/demo.css">
    <script src="js/jquery-1.8.3.js"></script>
    <!--jquery.easyui.min.js包含了easyUI中的所有插件-->
    <script src="js/jquery.easyui.min.js"></script>
    <script language="JavaScript">
        $(function () {//加载事件
            $('#dg').datagrid({
                title:"区域信息",
                url:'getDistrictByPage',
                toolbar:"#tb",
                pagination:true,
                pageList:[3,5,7],
                pageSize:5,
                columns:[[
                    {field:'id',title:'编号',width:100},
                    {field:'name',title:'区域名称',width:100},
                ]]
            });
        });
        //点击添加按钮调用函数
        function add() {
            $("#AddDialog").dialog({
               title:"添加区域"
            });
            $("#AddDialog").dialog("open"); //打开
        }
        //关闭添加窗口
        function CloseDialog(id) {
            $("#"+id).dialog("close"); // close 关闭
        }

        //使用easyui的表单提交插件
        function SaveDialog() {
            $('#addForm').form('submit', {
                    url:"addDistrict",
            success:function(data){//获得的是json字符串
             //将json字符串转化为json对象
                data=$.parseJSON(data);
               if (data.result==1){
                   $("#dg").datagrid("reload");//刷新
                   $("#AddDialog").dialog("close");//关闭窗口
               } else {
                   $.messager.alert('错误信息','添加失败!','warning');
               }
            }
        });
        }

        /*打开修改的对话框*/
        function goupdata() {
            $("#upDialog").dialog({
                title:"修改区域"
            });
            $("#upDialog").dialog("open");//打开
        }
    </script>
</head>
<body>
<table id="dg"></table>

<!--工具栏-->
<div id="tb">
    <a href="javascript:add()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:goupdata()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
    <a href="javascript:DeleteByFruitName()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
</div>

<%--制作添加对话框--%>

<div id="AddDialog" class="easyui-dialog" buttons="#AddDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form action="" name="addForm" id="addForm" method="post">
        区域名称:<input type="text" id="name" name="name"><br/>

    </form>
</div>
<%--对话框按钮--%>
<div id="AddDialogButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:CloseDialog('AddDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

<%--制作修改对话框--%>

<div id="upDialog" class="easyui-dialog" buttons="#upDialogButtons"
     style="width: 280px; height: 250px; padding: 10px 20px;" closed="true">
    <form action="" name="upForm" id="upForm" method="post">
        区域名称:<input type="text" id="name" name="name"><br/>

    </form>
</div>
<%--对话框按钮--%>
<div id="upDialogButtons">
    <a href="javascript:SaveDialog()" class="easyui-linkbutton" iconCls="icon-ok">更新</a>
    <a href="javascript:CloseDialog('upDialog')" class="easyui-linkbutton" iconCls="icon-cancel">取消</a>
</div>

</body>
</html>
