    <#include "/tmpl/lib/htmltag.ftl">
    <#assign cssFiles>
        <#--cssmerge_begin:welcome.css-->
        <link type="text/css" href="${cssRoot}/style/css/welcome.css" rel="stylesheet"/>
        <#--cssmerge_end:welcome.css-->
    </#assign>
    <@html title="首页-网易云简历" cm="welcome" bodyClass="p-welcome" cssFiles="${cssFiles}">
            
            <!-- banner区域 20130831 Zlj -->
            <#--
            -->
            <!-- 内容区 20130831 Zlj -->

        <script type="text/jqote2" id="js-tmp-timeline">
            <@viewMore/>
        </script>
        <script type="text/javascript" >
            var pFilters =  ${JSONObject.fromObject(filters!{})};
            require(["app/welcome"],function(test){
                test.init(pFilters,'${ipArea?trim!''}');
            });
      </script>
    </@html>
