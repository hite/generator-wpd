<#assign root = "" />
<#assign local = local?default(true) />
<#assign test = test?default(false) />

<#if local>
	<#assign contextPath = "" />
	<#assign host = "http://demo.mail.163.com" />
<#elseif (test)>
	<#assign contextPath = "" />
	<#assign host = "http://clientpromotion.mail.163.com" />
<#else>
	<#assign contextPath = "/clientpromotion.mail.163.com/activity" />
	<#assign host = "https://ssl.mail.163.com" />
</#if>

<#assign mimgURLPrefix = "" >
<#if local>
	<#assign mimgURLPrefix = contextPath />
<#elseif (test)>
	<#assign mimgURLPrefix = "http://mimg.127.net/hxm/dashi/myact" />
<#else>
	<#assign mimgURLPrefix = "https://ssl.mail.126.com/mimg127/hxm/dashi/myact" >
</#if>

<#assign jsRoot = mimgURLPrefix />
<#assign jsPath = jsRoot + "/js" />
<#assign cssRoot = mimgURLPrefix />
<#assign stylePath = cssRoot + "/style" />
<#assign miscPath = cssRoot + "/misc" />

<#setting url_escaping_charset='UTF-8'>