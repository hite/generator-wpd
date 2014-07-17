<#assign root = "" />
<#assign contextPath = "" />
<#assign mimgURLPrefix = "http://mimg.127.net" >
<#if local?default(true)>
	<#assign root = contextPath />
<#else>
	<#assign root = "${mimgURLPrefix}/hxm" />
</#if>
<#assign jsRoot = root />
<#assign jsPath = jsRoot + "/js" />
<#assign cssRoot = root />
<#assign nested = nested!false />
<#assign stylePath = cssRoot + "/style" />
<#if local?default(true)>
	<#assign miscPath = cssRoot + "/misc" />
<#else>
	<#assign miscPath = cssRoot + "/jianli/misc" />
</#if>
<#setting url_escaping_charset='UTF-8'>