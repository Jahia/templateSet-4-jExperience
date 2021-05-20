<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>
</head>
<script type="text/javascript">
    const myFunction= () => {
        const iframe = document.getElementById("jExpCodeSnippet");
        let elmnt = iframe.contentWindow.document.getElementsByTagName("body")[0];
        const form = iframe.contentWindow.document.forms["trackingInformationCtrl.settingsForm"];

        const newBody = document.createElement("body");
        newBody.append(form);
        <%--newBody.innerHTML = "${currentNode.properties['description'].string}";--%>
        elmnt.replaceWith(newBody);

        iframe.style.visibility = "visible";

    }
</script>

<body>
<h1>Et voila !</h1>
<div class="bodywrapper"><!--start bodywrapper-->
<%--    ${renderContext.UILocale.language}--%>
    <iframe id="jExpCodeSnippet" src="${url.context}/cms/editframe/default/en/sites/${renderContext.site.siteKey}.tracking-30-information.html"
            style="display: block;visibility:hidden;" frameBorder="0" width="100%" height="100%" onload="myFunction()"></iframe>

    <template:area path="pagecontent"/>
</div>
<!--stop bodywrapper-->

<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css" />
</c:if>
<template:addResources type="css" resources="960.css,01web.css"/>
<template:theme/>

</body>
</html>