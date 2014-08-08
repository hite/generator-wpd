    
  <#-- 列表页面 -->
  <#macro typelist>
    <div class="app-page" data-page="typelist">
        <div class="app-topbar">
            <div class="app-title js-type-title">类型1</div>
        </div>
        <div class="app-content">
            <div class="app-button" data-back>返回到类型选择</div>
            <ul class="w-image-list js-image-list">
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
        <script type="text/_-template" id="js-image-list-tmpl">
            <li><%=typeName%></li>
            <% for(var i=0;i< images.length;i++){%>
              <li class="w-image-viewer">
                <img class="js-view-detail" data-imageid="<%=images[i].id%>" src="<%=images[i].src%>">
              </li>
            <%}%>
        </script>
    </div>
  </#macro>