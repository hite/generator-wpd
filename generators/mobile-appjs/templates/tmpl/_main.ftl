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
        <title>移动版</title>
        <link href="bower_components/appjs/dist/app.css" rel="stylesheet" type="text/css"/>
        <link href="style/css/base.css" rel="stylesheet" type="text/css"/>
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
    <div class="app-page" data-page="home">
        <div class="app-topbar">
            <div class="app-title">2014何塞摄影作品展</div>
        </div>
        <div class="app-content">
            <!-- in your app-content -->
            <ul class="w-tiles">
                <li class="w-tile">
                    <span>类型1</span>
                    <img class="js-view-list"  data-target-args="2" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg" >
                </li><li class="w-tile">
                <span>类型1</span>
                <img class="js-view-list"  data-target-args="2" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg" >
            </li><li class="w-tile">
                <span>类型1</span>
                <img class="js-view-list"  data-target-args="2" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280871236906281.jpg" >
            </li>
            </ul>
        </div>
    </div>

    <div class="app-page" data-page="typelist">
        <div class="app-topbar">
            <div class="app-title">类型1</div>
        </div>
        <div class="app-content">
            <div class="app-button" data-back>返回到类型选择</div>
            <ul class="w-image-list">
                <li>Cats</li>
                <li class="w-image-viewer">
                    <img class="js-view-detail" data-imageid="3" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280862180778375.jpg">
                </li>
                <li>Apples</li>
                <li class="w-image-viewer">
                    <img class="js-view-detail" data-imageid="3" src="http://img.guancha.cn/guancha/News/big/2014/02/15/635280861539617249.jpg">
                </li>
                <li>Oranges</li>
                <li class="w-image-viewer">
                    <img class="js-view-detail" data-imageid="3" src="http://i.ssimg.cn/guancha/News/2014/02/15/635280854772325363.jpg">
                </li>
            </ul>
        </div>
    </div>

    <div class="app-page" data-page="detail">
        <div class="app-topbar">
            <div class="app-button" data-back>返回到列表选择</div>
        </div>
        <div class="app-content">
            <p>
                John Stanmeyer：当代热点类单幅一等奖——信号：2013年2月26日晚，吉布提的海岸，非洲移民举起手机接收来自索马里的廉价信号来联系海外的亲人。吉布提是索马里、埃塞俄比亚和厄立特里亚移民的中转站，移民们想到欧洲和中东寻求更好的生活。国家地理美国籍摄影师John Stanmeyer
            </p>
            <div class="b-original-img-wrap">
                <img src="http://i.ssimg.cn/guancha/News/2014/02/15/635280854772325363.jpg">
            </div>
        </div>
    </div>
    <!--jsmerge_begin:c0.js-->
    <script type="text/javascript" src="bower_components/zeptojs/src/zepto.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/ajax.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/event.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/touch.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/data.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/deferred.js"></script>
    <script type="text/javascript" src="bower_components/zeptojs/src/selector.js"></script>
    <script type="text/javascript" src="bower_components/appjs/dist/app.js"></script>
    <script type="text/javascript" src="bower_components/seajs/dist/sea.js"></script>
    <script type="text/javascript" src="bower_components/underscore/underscore.js"></script>

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
            seajs.use('app/main', function (_main) {

                _main.init();
            });
        })
    </script>
    </body>

    </html>
