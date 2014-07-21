<#include "lib/htmltag.ftl">
<!DOCTYPE html>
<html>
<!-- manifest="${contextPath}/misc/sp.manifest" -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="gray"/>
    <title>页面smart版本</title>
    <link href="bower_components/GMU/dist/reset.css" rel="stylesheet" type="text/css"/>
    <link href="bower_components/GMU/dist/gmu.css" rel="stylesheet" type="text/css"/>
    <link href="style/base.css" rel="stylesheet" type="text/css"/>
    <!--[if IE]>
    <script>
        document.createElement("header");
        document.createElement("footer");
        document.createElement("nav");
        document.createElement("article");
        document.createElement("section");
    </script>
    <![endif]-->
    <script src="http://127.0.0.1:9922/target/target-script-min.js#anonymous"></script>
    <script src="http://localhost:35729/livereload.js"></script>
    <!--
    <script src="http://jsconsole.com/remote.js?9C92D5FE-43C0-4A30-BA95-F531E46B9271"></script>
    -->
</head>
<body>
<div>
    <header>

    </header>
    <div>
    your code run here!
    </div>
    <footer></footer>
</div>
<!--jsmerge_begin:c0.js-->
<script type="text/javascript" src="bower_components/GMU/dist/zepto.js"></script>
<script type="text/javascript" src="bower_components/GMU/dist/gmu.js"></script>
<script type="text/javascript" src="bower_components/seajs/dist/sea.js"></script>
<!--jsmerge_end:c0.js-->

<!--jsmerge_begin:app.js-->
<script type="text/javascript" src="js/app/util.js"></script>
<script type="text/javascript" src="js/app/ajax.js"></script>
<script type="text/javascript" src="js/app/main.js"></script>
<!--jsmerge_end:app.js-->


<script type="text/javascript">
    seajs.config({
        // 别名配置
        alias: {
        },

        // 路径配置
        paths: {
        },

        // 变量配置
        vars: {
        },

        // 映射配置
        map: [
        ],

        // 预加载项
        preload: [
        ],

        // 调试模式
        debug: true,

        // Sea.js 的基础路径
        base: '${contextPath}/js/',

        // 文件编码
        charset: 'utf-8'
    });
    //
    // 加载入口模块
    $(function () {// onload
        seajs.use('app/main', function (_router) {

            // console.log(_main);
        });
    })
</script>
</body>

</html>
