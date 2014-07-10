<#include "/tmpl/lib/const.ftl">

<#macro header module="">
    <div class="g-hd">
        <#if nested>
            <div class="m-head">
                <div class="logowrap">
                    <h1 class="logo"><a href="${contextPath}/welcome.do">网易云简历</a></h1>
                </div>
                <#if module != "">
                    <ul class="nav">
                        <li class="item <#if module == "welcome">item-selected</#if>"><a href="${contextPath}/welcome.do">首页</a></li>
                        <li class="item <#if module == "myhome">item-selected</#if>"><a href="${contextPath}/myresume/view.do">我的简历</a></li>
                        <li class="item <#if module == "myfav">item-selected</#if>"><a href="${contextPath}/myfavour.do">我的收藏</a></li>
                    </ul>
                </#if>
            </div>
        <#else>
            <div class="g-wrap">
                <div class="m-head f-cb">
                    <h1 class="logo f-fl"><a href="${contextPath}/welcome.do">网易云简历</a></h1>
                    <#if module != "">
                    <ul class="nav f-fl">
                        <li class="item <#if module == "welcome">item-selected</#if>"><a href="${contextPath}/welcome.do">首页</a></li>
                        <li class="item <#if module == "myhome">item-selected</#if>"><a href="${contextPath}/myresume/view.do">我的简历</a></li>
                        <li class="item <#if module == "myfav">item-selected</#if>"><a href="${contextPath}/myfavour.do">我的收藏</a></li>
                    </ul>
                        <div class="userinfo f-fr ">
                            <div class="username js-userinfo">
                                <div class="inner">
                                        <#if user?? && user.image?? && user.image !=''>
                                            <img id="topbarAvatar"  class="img" src="${getAvatar(user.image,'s')}">
                                        <#else>
                                            <img id="topbarAvatar"  class="img" src="${miscPath+'/img/avatar/32.png'}">
                                        </#if>
                                    <span class="txt js-nickname">${(user.name?html)!'(无昵称)'}</span>
                                </div>
                            </div>
                        </div>
                    <#else>
                        <#if uid?? && uid !=''>
                        <div class="userinfo f-fr">
                            <div class="m-logout f-cb">
                                <div class="account">${uid!}</div>
                                <a href="javascript:void(0)" class="logout js-topbar-logout">退出</a>
                            </div>
                        </div>
                        </#if>
                    </#if>
                </div>
            </div>
        </#if>
    </div>

</#macro>

<#macro footer >
    <div class="g-ft">
        <div class="m-footer">
            <div class="intro">
                <div class="logo"></div>
                <div class="wrap">
                    <div class="title">关于我们：</div>
                    <div class="cnt">
                        <p>网易云简历，一个面向大学生的专业求职网站。</p>
                        <p>我们提供丰富的简历模板，并向您推荐靠谱的职位信息。</p>
                    </div>
                </div>
                <div class="wrap">
                    <div class="title">友情链接：</div>
                    <div class="cnt">
                        <ul class="links">
                            <li>·<a target="_blank" href="http://www.51job.com/">前程无忧</a></li>
                            <li>·<a target="_blank" href="http://www.chinahr.com/">中华英才网</a></li>
                            <li>·<a target="_blank" href="https://cn.linkedin.com/">领英</a></li>
                            <li>·<a target="_blank" href="http://www.yingjiesheng.com/">应届生求职网</a></li>
                            <li>·<a target="_blank" href="http://www.zhaopin.com/">智联招聘</a></li>
                            <li>·<a target="_blank" href="http://www.jjoobb.cn/">九博人才网</a></li>
                            <li>·<a target="_blank" href="http://www.hiall.com.cn/">HiAll</a></li>
                            <li>·<a target="_blank" href="http://www.dajie.com/">大街网</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cmpinfo">
                <a target="_blank" href="http://corp.163.com/index_gb.html">关于网易</a>
                <span class="sep">|</span>
                <a target="_blank" href="http://help.163.com">客户服务</a>
                <span class="sep">|</span>
                <a target="_blank" href="http://corp.163.com/gb/legal/legal.html">隐私政策</a>
                <span class="sep">|</span>
                <span class="copyright">网易公司版权所有&copy;1997-<script src="http://mimg.127.net/copyright/year.js" type="text/javascript"></script></span>
            </div>
        </div>
    </div>
</#macro>
<#---
主体模板
-->
<#macro html title bodyClass="" cm="" cssFiles="" hasHeader=true hasFooter=true >
    <#assign isLogin = uid??>
    <#assign domain = domain!"">
    <#assign uid = uid!"">
    <!DOCTYPE html>
    <html lang="zh_CN"> 
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta http-equiv="Content-type" content="text/html;charset=utf-8">
            <title>${title!"网易云简历"}</title>
            <meta http-equiv="Content-Style-Type" content="text/css">
            <meta http-equiv="Content-Script-Type" content="text/javascript">
            <meta name="Author" content="netease">
            <meta name="Version" content="1.0">
            <#--cssmerge_begin:core.css-->
            <link type="text/css" href="${cssRoot}/style/css/global.css" rel="stylesheet"/>
            <link rel="shortcut icon" href="${miscPath}/favicon.ico"  type="image/x-icon" />
            <#--cssmerge_end:core.css-->
            ${cssFiles}
            <script type="text/javascript">
                var gUid = "${uid}",gDomain = "${domain}",gContextPath = "${contextPath}", gCssRoot = "${cssRoot}", gStylePath = "${cssRoot}/style",gIsLogin = ${isLogin?string},gHost = '${host!"jianli.mail.163.com"}',gMiscPath = '${miscPath}';
                var gAjaxErrorMapping = {
                    400:"参数格式不合法或缺少必须参数",
                    401:"未登录",
                    403:"非法访问",
                    404:"请求处理的对象不存在",
                    409:"请求处理的对象已存在",
                    500:"服务端错误"
                };
                var formatDate = function(value, fmt){
                    if (typeof(value) == "number" || typeof(value) == "string"){
                        value = new Date(value);
                    }
                    var o = {
                        "y+": value.getFullYear(), // 年份      
                        "M+": value.getMonth() + 1, //月份        
                        "d+": value.getDate(), //日        
                        "h+": value.getHours() % 12 == 0 ? 12 : value.getHours() % 12, //小时        
                        "H+": value.getHours(), //小时        
                        "m+": value.getMinutes(), //分        
                        "s+": value.getSeconds(), //秒        
                        //"q+" : Math.floor((value.getMonth()+3)/3), //季度        
                        "S": value.getMilliseconds() //毫秒        
                    };
                    var week = {
                        "0": "\u65e5",
                        "1": "\u4e00",
                        "2": "\u4e8c",
                        "3": "\u4e09",
                        "4": "\u56db",
                        "5": "\u4e94",
                        "6": "\u516d"
                    };
                    if (/(y+)/.test(fmt)) {
                        fmt = fmt.replace(RegExp.$1, (value.getFullYear() + "").substr(4 - RegExp.$1.length));
                    }
                    if (/(E+)/.test(fmt)) {
                        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + week[value.getDay() + ""]);
                    }
                    for (var k in o) {
                        if (new RegExp("(" + k + ")").test(fmt)) {
                            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                        }
                    }
                    return fmt;
                };
                var escapeHTML = function (_html) {
                    if (!_html) {
                        return '';
                    }
                    return _html.replace(/[\u0000]/g, "").replace(/&/g, '&amp;').replace(/>/g, '&gt;').replace(/</g, '&lt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
                };
                var liveTextarea = function(_html){
                    var html = _html || '';
                    return html.replace(/\n/g,'<br/>');
                };
   
            </script>
            <#--jsmerge_begin:c0.js-->
            <script type="text/javascript" src="${jsRoot}/js/lib/require.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/require_config.js"></script>


            <script type="text/javascript" src="${jsRoot}/js/app/welcome.js"></script>
            <#--jsmerge_end:c0.js-->
        </head>
        <body <#if nested>class="g-iframe"</#if>>
            <div class="g-doc">
                <#if hasHeader>
                    <@header module=cm/>
                </#if>
                <div class="g-bd ${bodyClass!''}">
                    <#nested>
                    <#if !nested && hasFooter>
                        <@footer />
                    </#if>
                </div>
            </div>
            <!-- 回到顶部 20130901 Zlj-->
            <div class="w-sideact">
                <a class="w-icon-normal icon-normal-gototop js-w-gototop" style="display:none;" hidefocus="true" href="javascript:;" title="返回顶部"></a>
                <a class="w-icon-normal icon-normal-feedback js-add-feedback" hidefocus="true" href="javascript:;" title="反馈意见"></a>
            </div>
            <#if !nested>
            <div class="w-ietip">
                <span>为了更好的使用网易云简历，建议您升级浏览器版本或使用其它浏览器。</span>
                <a target="_blank" href="https://www.google.com/intl/zh-CN/chrome/browser/">下载谷歌Chrome浏览器</a>
            </div>
            </#if>
            <script type="text/javascript">
            $(document).delegate('.m-input','focus',function(){
                $(this).addClass('m-input-focus');
            }).delegate('.m-input','blur',function(){
                $(this).removeClass('m-input-focus');    
            });
            //
            </script>
        </body>
    </html>
</#macro>


<#macro viewMore>
        <#-- \$\{tl\.(.+?)\} -->
        <#-- <%=this.\1%> -->
    <div class="item" tid="<%=this.id%>" typeid = "<%=this.type%>">
        <a class="w-icon-normal icon-normal-<%=this.iconType%>" href="<%=this.typeLink||""%>"></a>
        <div class="item-cnt">
            <h3 class="w-title">
                <a href="<%=this.link%>" target="_blank">[<%=this.iconName%>]<%=this.subject%></a>
            </h3>
            <%=this.content%>
            <p class="cnt cnt-src">
                来源：<a href="<%=this.site%>"  target="_blank"><%=this.source%></a>
            </p>
        </div>
        
        <a class="item-act js-star open <%if(!this.favour){%>f-hide<%}%>" hidefocu="true" href="javascript:;">
            <span class="w-icon icon-star"></span>
            <span class="txt">取消收藏</span>
        </a>
        <a class="item-act js-star <%if(this.favour){%>f-hide<%}%>" hidefocu="true" href="javascript:;">
            <span class="w-icon icon-unstar"></span>
            <span class="txt">收藏</span>
        </a>
    </div>
</#macro>

<#macro liveTextarea html = ''>
    ${html?html?replace('\n','<br/>','rmi')}
</#macro>