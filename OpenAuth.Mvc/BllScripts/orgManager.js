﻿$(function () {
    $("#ParentName").on("click", function () {
        parent.reload();
    });
});

//左边分类导航树
var ztree = function () {
    var url = '/OrgManager/LoadOrg';
    var setting = {
        view: { selectedMulti: false },
        data: {
            key: {
                name: 'Name',
                title: 'Name'
            },
            simpleData: {
                enable: true,
                idKey: 'Id',
                pIdKey: 'ParentId',
                rootPId: 'null'
            }
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                list.reload(treeNode.Id);
            }
        }
    };
    var load = function () {
        $.getJSON(url, function (json) {
            var zTreeObj = $.fn.zTree.init($("#orgtree"), setting, json);
            list.reload();
            zTreeObj.expandAll(true);
        });
    };
    load();

    return {
        reload: load
    }
}();

//grid列表模块
function MainGrid() {
    var url = '/OrgManager/LoadChildren?Id=';
    var selectedId = '00000000-0000-0000-0000-000000000000';  //ztree选中的模块
    this.maingrid = $('#maingrid')
        .jqGrid({
            colModel: [
                {
                    name: 'Id',
                    index: 'Id',
                    label: '流水号',
                    hidden: true
                },
                {
                    index: 'CascadeId',
                    name: 'CascadeId',
                    label: '节点语义ID'
                },
                {
                    index: 'Name',
                    name: 'Name',
                    label: '组织名称'
                },
                {
                    index: 'ParentName',
                    name: 'ParentName',
                    label: '父节点名称'
                },
                 {
                     index: 'ParentId',
                     name: 'ParentId',
                     hidden: true
                 },

                {
                    index: 'SortNo',
                    name: 'SortNo',
                    label: '排序号'

                }
            ],
            url: url + selectedId,
            datatype: "json",

            viewrecords: true,
            rowNum: 18,
            pager: "#grid-pager",
            altRows: true,
            height: 'auto',
            multiselect: true,
            multiboxonly: true,

            loadComplete: function () {
                var table = this;
                setTimeout(function () {
                    updatePagerIcons(table);
                },
                    0);
            }
        }).jqGrid('navGrid', "#grid-pager", {
            edit: false, add: false, del: false, refresh: false, search: false
        });

    this.reload = function (id) {
        if (id != undefined) selectedId = id;
        this.maingrid.jqGrid("setGridParam", {url: url + selectedId })
            .trigger("reloadGrid", [{ page: 1 }]);  //重载JQGrid

    };
};
MainGrid.prototype = new Grid();
var list = new MainGrid();
var vm = new Vue({
    el: '#editDlg'
});

//上级机构选择框
var parent = function () {   //ztree搜索框
    var zTreeObj;
    var setting = {
        view: { selectedMulti: false },
        data: {
            key: {
                name: 'Name',
                title: 'Name'
            },
            simpleData: {
                enable: true,
                idKey: 'Id',
                pIdKey: 'ParentId',
                rootPId: 'null'
            }
        },
        callback: {
            onClick: onClick
        }
    };
    var showMenu = function () {
        $("#menuContent").css({ left: "10px", top: $("#ParentName").outerHeight() + "px" }).slideDown("fast");
        $("body").bind("mousedown", onBodyDown);
    };
    function onClick(e, treeId, treeNode) {
        var nodes = zTreeObj.getSelectedNodes();

        for (var i = 0, l = nodes.length; i < l; i++) {
            vm.$set('ParentName', nodes[i].Name);
            vm.$set('ParentId', nodes[i].Id);
            break;
        }
        hideMenu();
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }
    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    return {
        reload: function () {
            var index = layer.load();
            $.getJSON("/OrgManager/LoadOrg", {
                page: 1, rows: 10000
            }, function (json) {
                layer.close(index);
                if (json.length == 0) {
                    vm.$set('ParentName', '');
                    vm.$set('ParentId', '');
                    return;
                }
                zTreeObj = $.fn.zTree.init($("#org"), setting, json);
                zTreeObj.expandAll(true);
                showMenu();
            });
        }
    }
}();

//添加（编辑）对话框
var editDlg = function () {
    var update = false;
    var show = function () {
        layer.open({
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            title: "用户管理", //不显示标题
            area: ['400px', '300px'], //宽高
            content: $('#editDlg'), //捕获的元素
            btn: ['保存', '关闭'],
            yes: function (index, layero) {
                $.post("/OrgManager/AddOrg", vm.$data, function (data) {
                    layer.msg(data.Message);
                    if (data.Status) {
                        list.reload();
                        ztree.reload();
                    }
                }, "json");
            },
            cancel: function (index) {
                layer.close(index);
            }
        });
    }
    return {
        add: function () {  //弹出添加
            update = false;
            show();
            vm.$set('$data', null);
            vm.$set('Id', '00000000-0000-0000-0000-000000000000');
        },
        update: function (ret) {  //弹出编辑框
            update = true;
            show();
            vm.$set('$data', ret);
        }
    };
}();

//删除
function del() {
    var selected = list.getSelectedObj();
    if (selected == null) return;

    $.post('/OrgManager/DelOrg?Id=' + selected.Id, function (data) {
        if (data.Status) {
            list.reload();
            ztree.reload();
        }
        else {
            layer.msg(data.Message);
        }
    }, "json");
}

//自定义的编辑按钮
function edit() {
    var selected = list.getSelectedObj();
    if (selected == null) {
        return;
    }
    editDlg.update(selected);
}

function add() {
    editDlg.add();
}

function refresh() {
    list.reload();
}

//@@ sourceURL=OrgManager.js