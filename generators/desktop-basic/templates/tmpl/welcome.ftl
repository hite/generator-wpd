    <#include "lib/htmltag.ftl">
    <#assign cssFiles>
        <#--cssmerge_begin:welcome.css-->
        <link type="text/css" href="${cssRoot}/style/css/welcome.css" rel="stylesheet"/>
        <#--cssmerge_end:welcome.css-->
    </#assign>
    <@html title="首页-网易云简历" cm="welcome" bodyClass="p-welcome" cssFiles="${cssFiles}">

    <div class="g-bdc">
    <!-- banner区域 20130831 Zlj -->
    <!-- 内容区 20130831 Zlj -->
    <div class="g-bdct">
    <div class="g-wrap f-cb">
    <!-- 主内容区 20130831 Zlj -->
    <div class="g-mn">
    <!-- 筛选条件区 20130831 Zlj -->
    <div class="g-asbox">
        <!-- 筛选条件展示 20130831 Zlj -->
        <div class="filter f-cb">
            <div class="flt-label">筛选条件：</div>
            <ul class="flt-cnt">
                <li><span class="w-icon icon-location"></span>浙江省杭州市</li>
                <li>地区不限</li>
                <li>行业不限</li>
                <li>职位不限</li>
                <li>月薪不限</li>
            </ul>
            <a href="javascript:void(0)" class="flt-action f-ribs">
                <span class="w-icon icon-setting"></span>
                <span class="f-ib">编辑</span>
            </a>
            <div class="m-ppnl m-ppnl-hasarrow m-ppnl-intention">
                <div class="ppnl-ct">
                    <div class="cnt">同学，快来设置你的求职意向，我们将为你推送个性化的求职信息。</div>
                    <div class="w-arrow w-arrow-top">
                        <span class="arrow-bgc"></span>
                        <span class="arrow-bdc"></span>
                    </div>
                </div>
                <div class="ppnl-act">
                    <a title="关闭" class="w-icon icon-ppnlclose" hidefocus="true" href="javascript:;"></a>
                </div>
            </div>
        </div>
    </div>

    <ul class="m-tabs">
        <li class="tab tab-selected"><a href="javascript:;" hidefocus="true">今日推送</a></li>
        <li class="tab"><a href="javascript:;" hidefocus="true">校园招聘</a></li>
        <li class="tab"><a href="javascript:;" hidefocus="true">宣讲会</a></li>
        <li class="tab"><a href="javascript:;" hidefocus="true">招聘会</a></li>
        <li class="tab"><a href="javascript:;" hidefocus="true">实习兼职</a></li>
        <li class="tab"><a href="javascript:;" hidefocus="true">职位推荐</a></li>
    </ul>

    <!-- 资讯列表区 20130831 Zlj -->
    <div class="g-box">
        <div class="m-infolst">
            <div class="lst-bd">
                <div class="item">
                    <span class="w-icon-normal icon-normal-process"></span>
                    <div class="item-cnt">
                        <h3 class="w-title">
                            <a href="#">[校园招聘] 网易公司校园招聘武汉站</a>
                        </h3>
                        <p class="cnt">截止时间：2014-04-30 14:00</p>
                        <p class="cnt">工作地点：杭州</p>
                        <p class="cnt cnt-src">
                            来源：<a href="#">智联招聘</a>
                        </p>
                    </div>
                    <a href="javascript:;" hidefocus="true" class="item-act">
                        <span class="w-icon icon-unstar"></span>
                        <span class="txt">收藏</span>
                    </a>
                </div>
                <div class="item">
                    <span class="w-icon-normal icon-normal-teachin"></span>
                    <div class="item-cnt">
                        <h3 class="w-title">
                            <a href="#">[宣讲会] 网易杭州网络有限公司</a>
                            <span class="w-famousent">名企</span>
                        </h3>
                        <p class="cnt">时间：2014-04-30 14:00</p>
                        <p class="cnt">地点：浙江大学（杭州市黄龙体育中心）</p>
                        <p class="cnt cnt-src">
                            来源：<a href="#">智联招聘</a>
                        </p>
                    </div>
                    <a href="javascript:;" hidefocus="true" class="item-act">
                        <span class="w-icon icon-unstar"></span>
                        <span class="txt">收藏</span>
                    </a>
                </div>
                <div class="item">
                    <span class="w-icon-normal icon-normal-recruit"></span>
                    <div class="item-cnt">
                        <h3 class="w-title">
                            <a href="#">[招聘会] 网易公司春季校园招聘</a>
                        </h3>
                        <p class="cnt">时间：2014-04-30 14:00</p>
                        <p class="cnt">地点：杭州市黄龙体育中心</p>
                        <p class="cnt cnt-src">
                            来源：<a href="#">智联招聘</a>
                        </p>
                    </div>
                    <a href="javascript:;" hidefocus="true" class="item-act">
                        <span class="w-icon icon-unstar"></span>
                        <span class="txt">收藏</span>
                    </a>
                </div>
                <div class="item">
                    <span class="w-icon-normal icon-normal-intern"></span>
                    <div class="item-cnt">
                        <h3 class="w-title">
                            <a href="#">[实习兼职]网易招聘产品策划助理实习生</a>
                        </h3>
                        <p class="cnt">发布时间：2014-04-30 14:00</p>
                        <p class="cnt">工作地点：杭州</p>
                        <p class="cnt cnt-src">
                            来源：<a href="#">智联招聘</a>
                        </p>
                    </div>
                    <a href="javascript:;" hidefocus="true" class="item-act">
                        <span class="w-icon icon-unstar"></span>
                        <span class="txt">收藏</span>
                    </a>
                </div>
                <div class="hint">建议您完善求职设置，我们会为您提供更多更精准的求职信息。<a href="javascript:void(0)">立即设置</a></div>
                <div class="item">
                    <span class="w-icon-normal icon-normal-postrcmd"></span>
                    <div class="item-cnt">
                        <h3 class="w-title">
                            <a href="#">[职位推荐] 互联网产品经理</a>
                        </h3>
                        <p class="cnt">发布时间：2014-04-30 14:00</p>
                        <p class="cnt">工作地点：杭州</p>
                        <p class="cnt cnt-src">
                            来源：<a href="#">智联招聘</a>
                        </p>
                    </div>
                    <a href="javascript:;" hidefocus="true" class="item-act">
                        <span class="w-icon icon-star"></span>
                        <span class="txt">取消收藏</span>
                    </a>
                </div>
            </div>

            <!-- 正在加载 20130831 Zlj -->
            <div class="lst-foot">
                <a hidefocus="true" href="javascript:;">点击加载更多&gt;&gt;</a>
            </div>
        </div>
    </div>
    </div>

    <!-- 侧栏 20130831 Zlj -->
    <div class="g-sd">
        <!-- 我的简历 20130831 Zlj -->
        <div class="g-asbox">
            <h2 class="w-title">我的简历</h2>
            <div class="myresume f-cb">
                <div class="w-icon-normal icon-normal-resumecmpl f-fl">
                    <div class="percent">
                        <span class="num">30</span>%
                    </div>
                    <div class="txt">
                        简历完成度
                    </div>
                </div>
                <div class="userinfo f-fl">
                    <div class="name">司徒小君</div>
                    <div class="gender">女性</div>
                    <div class="age">25岁</div>
                    <button class="w-blbtn">完善资料</button>
                </div>
            </div>
        </div>

        <!-- 收藏列表 20140428 Zlj -->
        <div class="g-sdbox">
            <div class="m-sdcnt m-sdcnt-collect">
                <div class="cnt-hd">
                    <h2 class="w-title">我的收藏</h2>
                </div>
                <div class="cnt-bd">
                    <ul class="list">
                        <li class="item"><a href="#">[面试技巧]你现在感兴趣的是什么东西啊啊啊啊</a></li>
                        <li class="item"><a href="#">[行业资讯]南京新增</a></li>
                        <li class="item"><a href="#">[招聘会]绍兴市两区春季大型招聘会即将在设呢什么什么</a></li>
                        <li class="item"><a href="#">[宣讲会]网易公司将在什么学校举行什么宣讲会</a></li>
                        <li class="item"><a href="#">[宣讲会]网易春季招聘宣讲</a></li>
                    </ul>
                    <div class="more">
                        <a href="javascript:;">更多&gt;&gt;</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
    </div>
    </div>
    </div>

        <script type="text/jqote2" id="js-tmp-timeline">
            <@viewMore/>
        </script>
        <script type="text/javascript" >
            var pFilters =  ${filters!};
            require(["app/welcome"],function(test){
                test.init(pFilters,'${ipArea?trim!''}');
            });
      </script>
    </@html>
