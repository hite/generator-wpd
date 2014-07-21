<#include "const.ftl">

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

<#macro liveTextarea html = ''>
    ${html?html?replace('\n','<br/>','rmi')}
</#macro>