<#include "/tmpl/lib/const.ftl">

<#--
    解析保存的图片，获取正确尺寸的图片 .假设在保存的时候，顺序是L，M,S这样的顺序
-->
<#function getAvatar _imgurl _size = 'M'>
    <#local url = _imgurl!''>
    <#local size = _size?upper_case>
    <#local urls = url?split(',')>
    <#if (urls?size<3)>
        <#return url>
    <#else>
        <#if size == 'L'>
            <#return urls[0]>
        <#elseif size == 'M'>
            <#return urls[1]>
        <#else>
            <#return urls[2]>
        </#if>
    </#if>
</#function>

<#macro stepMonitor step = 0 >
	<div class="stepbar f-cb">
		<#local lst = ["1.模板选择&nbsp;&nbsp;","2.个人信息","3.教育背景","4.实习经历","5.完成"]>
		<#list lst as item>
			<span class="w-icon-normal icon-normal-<#if (0==item_index)>stepfst<#elseif item_has_next>step<#else>steplst</#if> <#if (step>item_index)>z-finished<#elseif step==item_index>z-selected<#else></#if>">
				${item}
			</span>
		</#list>
	</div>
</#macro>

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
            <script type="text/javascript" src="http://mimg.127.net/h/lib/crossdomain-201306211750.js"></script>
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
                // cross domain
                (function(){
                    // 初始化ajax跨域配置
                    // 加白名单
                    window.crossDomain.whitelist = ["*"];
                     
                    // 将crossdomain-proxy.html放到当前的app下面
                    // 注册本域跨域代理
                    var URL_REGEX = /[A-Za-z]+:\/{0,3}([^\/]+)/;   
                    var origin = location.href.match(URL_REGEX)[0];
                    window.crossDomain.ajaxRegisterDomain(
                        {domain:origin, proxyHtml : gContextPath + '/html/crossdomain-proxy.html'}
                    );
             
                })();
   
            </script>
            <#--jsmerge_begin:c0.js-->
            <script type="text/javascript" src="${jsRoot}/js/lib/require.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/require_config.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/allunivlist.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/arealist.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/industry.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/position.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/position_guolairen.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/db/certificate.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/hl/en_US.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/hl/zh_CN.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/jquery-1.7.1.min.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/jquery.form.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/jquery.jqote2.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/jquery.json-2.3.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/jquery.validate.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/text.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/lib/underscore.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/builder.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/config.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/dataprovider.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/event.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/factory.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/checkbox.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/checkboxgroup.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/field.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/radio.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/selector.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/validator.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/form/tightinput.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/csshelper.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/cookie.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/datahelper.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/detection.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/dock.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/eventhelper.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/popmenuhelper.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/helper/shortkey.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/i18n.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/plugins/avatar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/plugins/pydict.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/shark.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/button.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/buttongroup.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/cancelbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/combobutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/okbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/selectorbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/splitbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/strongbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/button/switchbutton.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/calendar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/contextmenu.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/contextmenutrigger.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/dropmenu.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/hinger.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/hovermenu.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/complexmenu/hovertrigger.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/component.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/container.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/dialogbox/basedialog.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/dialogbox/dialogbox.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/dialogbox/prompt.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/dragsort.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/list.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/mask.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/menuitem.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/menulist.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/menulistgroup.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/msgbox.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/mywidget.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/pageman.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/placeholder.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/popupwrap.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/preview.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/seperator.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/slider.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/suggestlist.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/toolbar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/sharkjs/widget/widget.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/common/avatar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/common/school.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/common/college.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/common/templateviewer.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/login.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/edit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/addition.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/additionedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/certificate.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/certificateedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/choosetemplatedialog.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/city.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/reftip.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/certpicker.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/date.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/education.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/educationedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/internship.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/internshipedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/languageability.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/languageabilityedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/personalinfo.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/projectexperience.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/projectexperienceedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/skill.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/skilledit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/schoolposition.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/schoolpositionedit.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/module/resumeinfolist.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/myresume/view.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/settings/changeavatar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/settings/changepwd.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/stepbystep/done.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/stepbystep/education.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/stepbystep/internship.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/stepbystep/stuff.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/stepbystep/template.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/favourite.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/topbar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/sidebar.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/welcome.js"></script>
            <script type="text/javascript" src="${jsRoot}/js/app/logger.js"></script>
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

<#macro chooseTemplate  templates = []>
    <div id="chooseTemplateDialog" class="w-maskdialog f-hide">
        <div class="w-mask"></div>
        <div class="w-dialog">
            <div class="m-choosetmpl m-choosetmpl-edit">
                <div class="head">
                    <div class="g-wrap f-cb">
                        <div class="f-fl"><%=this.templateName%></div>
                        <div class="f-fr">
                            <button class="w-blbtn js-w-use">使用</button>
                            <button class="w-grbtn js-w-cancel">取消</button>
                        </div>
                    </div>
                </div>
                <div class="body">
                    <div class="g-wrap">
                        <div class="left">
                            <!-- 其他模板改simple1后缀就可以(simple2/position1) -->
                            <span class="w-templatem w-templatem-<%=this.templateCls%> js-w-template-bg"></span>
                        </div>
                        <div class="right">
                            <div class="g-box">
                                <div class="w-title">模板设置</div>
                                <div class="tmplmenu">
                                    <div class="m-droplst m-droplst-tmpl js-w-filter">
                                        
                                    </div>
                                </div>
                                <div class="tmplcnt">
                                    <!-- 模板列表 20130912 Zlj -->
                                    <ul class="m-tmpllst f-cb">
                                        <#list templates as tmp>
                                            <#if tmp.id??>
                                                <li tid="${tmp.id}" class="all ${tmp.type} js-w-preview">
                                                    <div class="tmpl">
                                                        <span class="w-template w-template-${tmp.clsName!'simple1'}" data-type="${tmp.clsName!'simple1'}"></span>
                                                        <span class="bg"></span>
                                                    </div>
                                                    <div class="name">${tmp.name}</div>
                                                </li>
                                            </#if>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro infoList list = [] fullshot = true flag = false>
    
    <div class="m-infolst">
        <div class="lst-bd js-new-wrap">
            <#list list as tl >
                <#if tl??>
                    <#assign iconType = 'default'>
                    <#assign iconName = '信息'>
                    <#assign content = tl.digest!?trim >
                    <#assign typeLink = contextPath +"/welcome.do?tab="+tl.type >
                    <#if content?length == 0>
                        <#assign content = '点击标题查看详情...' >
                    </#if>

                    <#---   ：0表示全部收藏、1表示校园招聘、2表示宣讲会、3表示招聘会、4表示实习兼职、5表示职位推荐、
                     -->
                    <#if tl.type == 5>  
                        <#assign iconType = 'postrcmd'>
                        <#assign iconName = '职位推荐'>
                        <#assign content>
                            <p class="cnt">发布时间：${tl.startDate?number_to_datetime?string('yyyy-MM-dd')}</p>
                            <p class="cnt">公司：${tl.address!''}</p>
                        </#assign>
                    <#elseif tl.type == 2 >
                        <#assign iconType = 'teachin'>
                        <#assign iconName = '宣讲会'>
                        <#assign content>
                            <p class="cnt">时间：
                                <#if (tl.startDate==0 ||tl.startDate%86400000 == 57600000) >
                                    ${tl.startDate?number_to_datetime?string('yyyy-MM-dd')}
                                <#else>
                                    ${tl.startDate?number_to_datetime?string('yyyy-MM-dd HH:mm')}
                                </#if>
                                <#if (tl.endDate%86400000 == 57600000 || tl.endDate == 0)>
                                <#else>
                                    -
                                    ${tl.endDate?number_to_datetime?string('HH:mm')}
                                </#if>
                            </p>
                            <p class="cnt">地点：${tl.address!''}</p>
                        </#assign>
                    <#elseif tl.type == 1>
                        <#assign iconType = 'process'>
                        <#assign iconName = '校园招聘'>
                        <#assign content>
                            <p class="cnt">网申时间：
                            <#if tl.startDate%86400000 == 57600000 || tl.startDate==0>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd')}
                            <#else>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd HH:mm')}
                            </#if>
                            <#if tl.endDate == 0>
                                启动
                            <#else>
                                 -
                                <#if (tl.endDate%86400000 == 57600000)>
                                    ${tl.endDate?number_to_datetime?string('yyyy-MM-dd')}
                                <#else>
                                    ${tl.endDate?number_to_datetime?string('yyyy-MM-dd HH:mm')}
                                </#if>
                            </#if>
                            </p>
                            <p class="cnt">工作地点：${tl.address!''}</p>
                        </#assign>
                    <#elseif tl.type == 3 >
                        <#assign iconType = 'recruit'>
                        <#assign iconName = '招聘会'>
                        <#assign content>
                            <p class="cnt">时间：
                            <#if tl.startDate%86400000 == 57600000 || tl.startDate==0>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd')}
                            <#else>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd HH:mm')}
                            </#if>
                            </p>
                            <p class="cnt">地点：${tl.address!''}</p>
                        </#assign>
                    <#elseif tl.type == 4>
                        <#assign iconType = 'intern'>
                        <#assign iconName = '实习兼职'>
                        <#assign content>
                            <p class="cnt">发布时间：
                            <#if tl.startDate%86400000 == 57600000  || tl.startDate==0>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd')}
                            <#else>
                                ${tl.startDate?number_to_datetime?string('yyyy-MM-dd HH:mm')}
                            </#if>
                            </p>
                            <p class="cnt">工作地点：${tl.address!''}</p>
                        </#assign>
                    <#else>
                        <#assign iconType = 'famous'>
                        <#assign iconName = '名企策略'>
                    </#if>
                    <div class="item" tid="${tl.id}" typeid = "${tl.type}">
                        <a class="w-icon-normal icon-normal-${iconType}" href="${typeLink}"></a>
                        <div class="item-cnt">
                            <h3 class="w-title">
                                <a href="${tl.link}" target="_blank">[${iconName}]${tl.subject}</a>
                            </h3>
                            ${content}
                            <p class="cnt cnt-src">
                                来源：<a href="${tl.site}"  target="_blank">${tl.source}</a>
                            </p>
                        </div>
                        
                        <a class="item-act js-star open <#if tl.favour?? && tl.favour><#else>f-hide</#if>" hidefocu="true" href="javascript:;">
                            <span class="w-icon icon-star"></span>
                            <span class="txt">取消收藏</span>
                        </a>
                        <a class="item-act js-star <#if tl.favour?? && tl.favour>f-hide<#else></#if>" hidefocu="true" href="javascript:;">
                            <span class="w-icon icon-unstar"></span>
                            <span class="txt">收藏</span>
                        </a>
                    </div>
                    <#-- https://qa.mail.netease.com/new/issues/show/148262 -->
                    <#-- 可以合并 -->
                    <#-- 当天少于20，大于1, 需要补充前几天的数据到20个的情况-->
                    <#if flag && !fullshot && (infosNum<20 && infosNum-1==tl_index)>
                        <div class="hint">建议您完善求职设置，我们会为您提供更多更精准的求职信息。<a href="javascript:void(0)" class="js-set-immediately js-not-hide">立即设置</a></div>
                    </#if>
                </#if>
            </#list>
        </div>
        <#if infosNum gt 19>
        <!-- 正在加载 20130831 Zlj -->
        <div class="lst-foot js-lst-footer">
            <div class="loading f-hide js-loading">
                <span class="w-loading"></span> 正在加载
            </div>
            <a href="javascript:;" class="js-more" hidefocus="true">查看更多</a>
            <span class="js-no-more f-hide">没有更多信息了</span>
        </div>
        </#if>
    </div>
    
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