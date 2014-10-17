    <#include "lib/htmltag.ftl">
    <#include "pages/typelist.ftl">
    <#include "pages/detail.ftl">

    <!DOCTYPE html>
    <html>
    <!-- manifest="${contextPath}/misc/sp.manifest" -->
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes"/>
        <meta name="format-detection" content="telephone=no"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-status-bar-style" content="gray"/>
        <title>移动版</title>
        <!--cssmerge_begin:core.css-->
        <link href="bower_components/appjs/dist/app.css" rel="stylesheet" type="text/css"/>
        <link href="style/css/base.css" rel="stylesheet" type="text/css"/>
        <!--cssmerge_end:core.css-->
        <!--[if IE]>
        <script>
            document.createElement("header");
            document.createElement("footer");
            document.createElement("nav");
            document.createElement("article");
            document.createElement("section");
        </script>
        <![endif]-->

        <script src="http://10.240.136.154:9922/target/target-script-min.js#anonymous"></script>
        <!--
        <script src="http://10.240.136.154:35729/livereload.js"></script>
        <script src="http://jsconsole.com/remote.js?9C92D5FE-43C0-4A30-BA95-F531E46B9271"></script>
        -->
    </head>
    <body>
    <div class="w-loading" id="js-loading"></div>
    <div class="app-page" data-page="home">
        <div class="app-topbar">
            <div class="app-title">必应图片图库</div>
        </div>
        <div class="app-content">
            <div style="background-color: antiquewhite;padding: 15px;font-size: 18px;color: cadetblue;" >
必应缤纷桌面是微软必应（Bing）搜索推出的新一代桌面客户端。搜索从桌面开始！还可将必应美图设为桌面壁纸，精彩每一天！
版本号：1.3.825
支持Win XP/ Win7/ Win8
更新日期：2014年3月25日，9.4M
         </div>
            <!-- in your app-content -->
            <ul class="w-tiles js-tile-list">
                <li class="w-tile">
                    <span>类型1</span>
                    <img class="js-view-list"  data-target-args="2" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg" >
                </li>
                <li class="w-tile">
                    <span>类型1</span>
                    <img class="js-view-list"  data-target-args="2" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg" >
                </li>
                
            </ul>
        </div>
        <script type="text/_-template" id="js-type-list-tmpl">
            <li class="w-tile">
                <span><%=typeName%></span>
                <img class="js-view-list" data-target-args="<%=typeId%>" src="<%=typeIco|| 'http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg'%>" ></img>
            </li>
        </script>
    </div>

    <@typelist></@typelist>
    <@detail></@detail>

    
    <!--jsmerge_begin:c0.js-->
    <script type="text/javascript" src="bower_components/zeptojs/src/zepto.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/ajax.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/event.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/touch.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/data.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/callbacks.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/deferred.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/selector.js"></script>
    <script type="text/javascript" src="bower_components/appjs/dist/app.js"></script>
    <script type="text/javascript" src="bower_components/seajs/dist/sea.js"></script>
    <script type="text/javascript" src="bower_components/underscore/underscore.js"></script>

    <!--jsmerge_end:c0.js-->

    <!--jsmerge_begin:app.js-->
    <script type="text/javascript" src="${jsPath}/app/util.js"></script>
    <script type="text/javascript" src="${jsPath}/app/ajax.js"></script>
    <script type="text/javascript" src="${jsPath}/app/main.js"></script>
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
            <#if local || test>
                base: '${jsRoot}/js/',
            <#else>
                base: '${jsRoot}/dist/',
            </#if>

            // 文件编码
            charset: 'utf-8'
        });
        // 
        var gContextPath = "${contextPath}";
        // 加载入口模块
        $(function () {// onload
            seajs.use('app/main', function (_main) {

                _main.init();
            });
        })
    </script>
    </body>

    </html>
