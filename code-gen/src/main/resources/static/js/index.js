$(function () {

    /**
     * 初始化 table sql
     */
    var tableSqlIDE;

    function initTableSql(sqlInfo) {
        tableSqlIDE = CodeMirror.fromTextArea(document.getElementById(sqlInfo), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-sql",
            lineWrapping: false,
            readOnly: false,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        tableSqlIDE.setSize('auto', 'auto');
    }

    /**
     * 初始化 code area
     */

    var controller_ide;
    var service_ide;
    var service_impl_ide;
    var dao_ide;
    var mybatis_ide;
    var model_ide;
    var page_model_ide;
    var grid_bean_ide;

    function initCodeArea() {

        // controller_ide
        controller_ide = CodeMirror.fromTextArea(document.getElementById("controller_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        controller_ide.setSize('auto', 'auto');

        // service_ide
        service_ide = CodeMirror.fromTextArea(document.getElementById("service_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        service_ide.setSize('auto', 'auto');

        // service_impl_ide
        service_impl_ide = CodeMirror.fromTextArea(document.getElementById("service_impl_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        service_impl_ide.setSize('auto', 'auto');

        // dao_ide
        dao_ide = CodeMirror.fromTextArea(document.getElementById("dao_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        dao_ide.setSize('auto', 'auto');

        // mybatis_ide
        mybatis_ide = CodeMirror.fromTextArea(document.getElementById("mybatis_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/html",
            lineWrapping: true,
            readOnly: true
        });
        mybatis_ide.setSize('auto', 'auto');

        // model_ide
        model_ide = CodeMirror.fromTextArea(document.getElementById("model_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true,
            foldGutter: true,
            gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        model_ide.setSize('auto', 'auto');

        // page_model_ide
        page_model_ide = CodeMirror.fromTextArea(document.getElementById("page_model_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true
        });
        page_model_ide.setSize('auto', 'auto');

        // grid_bean_ide
        grid_bean_ide = CodeMirror.fromTextArea(document.getElementById("grid_bean_ide"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping: true,
            readOnly: true
        });
        grid_bean_ide.setSize('auto', 'auto');
    }

    initCodeArea();

    /**
     * 选择生成页面
     */
    $('#selectMybatisCodeGen').click(function () {
        $('#mybatisCodeGen').show();
        initTableSql("mybatisTableSql");
        $('#mybatisPlusCodeGen').hide();
        $('#mybatisLinkGen').hide();
        $('#mybatisPlusLinkGen').hide();
    });

    /**
     * 生成代码
     */
    $('#mybatisCodeGenerate').click(function () {

        var tableSql = tableSqlIDE.getValue();

        $.ajax({
            type: 'POST',
            url: base_url + "/codeGenerate",
            data: {
                "tableSql": tableSql
            },
            dataType: "json",
            success: function (data) {
                if (data.code == 200) {
                    controller_ide.setValue(data.data.controller_code);
                    controller_ide.setSize('auto', 'auto');

                    service_ide.setValue(data.data.service_code);
                    service_ide.setSize('auto', 'auto');

                    service_impl_ide.setValue(data.data.service_impl_code);
                    service_impl_ide.setSize('auto', 'auto');

                    dao_ide.setValue(data.data.dao_code);
                    dao_ide.setSize('auto', 'auto');

                    mybatis_ide.setValue(data.data.mybatis_code);
                    mybatis_ide.setSize('auto', 'auto');

                    model_ide.setValue(data.data.model_code);
                    model_ide.setSize('auto', 'auto');

                    page_model_ide.setValue(data.data.page_model_code);
                    page_model_ide.setSize('auto', 'auto');

                    grid_bean_ide.setValue(data.data.grid_bean_code);
                    grid_bean_ide.setSize('auto', 'auto');
                } else {
                    layer.open({
                        icon: '2',
                        content: (data.msg || '代码生成失败')
                    });
                }
            }
        });

    });

});