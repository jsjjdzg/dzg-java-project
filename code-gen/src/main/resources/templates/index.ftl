<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>MyBatis代码生成平台</title>

    <#import "common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/codemirror/lib/codemirror.css">
    <link rel="stylesheet" href="${request.contextPath}/static/plugins/codemirror/addon/hint/show-hint.css">

</head>
<body class="hold-transition skin-blue layout-top-nav ">
<div class="wrapper">

    <#-- header -->
    <@netCommon.commonHeader />


    <#-- content -->
    <div class="content-wrapper">
        <div class="container">

            <section class="content">

                <div class="row">

                    <#-- left -->
                    <div class2="col-md-9">
                        <#-- 生成方式选择 -->
                        <div class="box box-default" id="CodeGenSelect">
                            <div class="box-header with-border">
                                <button type="button" class="btn btn-info btn-default pull-left"
                                        id="selectMybatisCodeGen">
                                    代码生成Mybatis代码
                                </button>
                                <div class="box-body "></div>
                                <button type="button" class="btn btn-info btn-default pull-left"
                                        id="selectMybatisPlusCodeGen">
                                    代码生成MybatisPlus代码
                                </button>
                            </div>
                        </div>
                        <#-- 各种式样 -->
                        <#-- Mybatis基于生成代码生成Java代码  -->
                        <div class="box box-default" id="mybatisCodeGen" style="display:none;">
                            <div class="box-header with-border">
                                <h4 class="pull-left">表结构信息</h4>
                            </div>
                            <div class="box-body">
                                <ul class="chart-legend clearfix">
                                    <li>
                                        <small class="text-muted">
                                            <textarea id="mybatisTableSql" placeholder="请输入表结构信息...">
CREATE TABLE `bocloud` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bocloud'
                                            </textarea>
                                        </small>
                                    </li>
                                </ul>
                            </div>
                            <div class="box-header with-border">
                                <button type="button" class="btn btn-info btn-default pull-left"
                                        id="mybatisCodeGenerate">
                                    生成Mybatis代码
                                </button>
                            </div>
                        </div>

                        <#-- MybatisPlus基于生成代码生成Java代码  -->
                        <div class="box box-default" id="mybatisPlusCodeGen" style="display:none;">
                            <div class="box-header with-border">
                                <h4 class="pull-left">表结构信息</h4>
                            </div>
                            <div class="box-body">
                                <ul class="chart-legend clearfix">
                                    <li>
                                        <small class="text-muted">
                                            <textarea id="mybatisPlusTableSql" placeholder="请输入表结构信息...">
CREATE TABLE `bocloud` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `time` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='bocloud'
                                            </textarea>
                                        </small>
                                    </li>
                                </ul>
                            </div>
                            <div class="box-header with-border">
                                <button type="button" class="btn btn-info btn-default pull-left"
                                        id="mybatisPlusCodeGenerate">
                                    生成MybatisPlus代码
                                </button>
                            </div>
                        </div>


                        <#-- 生成代码 -->
                        <div class="nav-tabs-custom">
                            <!-- Tabs within a box -->
                            <ul class="nav nav-tabs pull-right">
                                <li class="pull-left header">代码区</li>

                                <!--<li><a href="#grid_bean" data-toggle="tab">GirdBean</a></li>
                                <li><a href="#page_model" data-toggle="tab">PageModel</a></li> -->
                                <li><a href="#mybatis" data-toggle="tab">Mybatis</a></li>
                                <li><a href="#controller" data-toggle="tab">Controller</a></li>
                                <li><a href="#service_impl" data-toggle="tab">ServiceImpl</a></li>
                                <li><a href="#service" data-toggle="tab">Service</a></li>
                                <li><a href="#dao" data-toggle="tab">Dao</a></li>
                                <li><a href="#model" data-toggle="tab">Model</a></li>

                            </ul>
                            <div class="tab-content no-padding">
                                <div class="chart tab-pane active" id="model">
                                    <div class="box-body ">
                                        Model：<textarea id="model_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="dao">
                                    <div class="box-body">
                                        Dao：<textarea id="dao_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="service">
                                    <div class="box-body">
                                        Service：<textarea id="service_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="service_impl">
                                    <div class="box-body">
                                        ServiceImpl：<textarea id="service_impl_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="controller">
                                    <div class="box-body">
                                        Controller：<textarea id="controller_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="mybatis">
                                    <div class="box-body">
                                        Mybatis：<textarea id="mybatis_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="page_model">
                                    <div class="box-body">
                                        PageModel：<textarea id="page_model_ide"></textarea>
                                    </div>
                                </div>
                                <div class="chart tab-pane active" id="grid_bean">
                                    <div class="box-body">
                                        GridBean：<textarea id="grid_bean_ide"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <!-- footer -->
    <@netCommon.commonFooter />

</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/plugins/codemirror/lib/codemirror.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/addon/hint/show-hint.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/addon/hint/anyword-hint.js"></script>

<script src="${request.contextPath}/static/plugins/codemirror/addon/display/placeholder.js"></script>

<script src="${request.contextPath}/static/plugins/codemirror/mode/clike/clike.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/mode/sql/sql.js"></script>
<script src="${request.contextPath}/static/plugins/codemirror/mode/xml/xml.js"></script>

<script src="${request.contextPath}/static/js/index.js"></script>

</body>
</html>
