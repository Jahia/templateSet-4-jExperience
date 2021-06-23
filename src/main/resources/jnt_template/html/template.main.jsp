<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<html lang="${fn:substring(renderContext.request.locale,0,2)}">
    <head>
        <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="preconnect" href="https://fonts.gstatic.com" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;1,100;1,300;1,400&display=swap"
        />
        <%--<c:if test="${renderContext.editMode}">--%>
        <%--    <template:addResources type="css" resources="edit.css" />--%>
        <%--</c:if>--%>
        <template:addResources type="css" resources="style.css"/>
        <c:if test="${renderContext.editMode}">
            <template:addResources type="css" resources="edit.css"/>
        </c:if>
        <%--<template:theme/>--%>
        <template:addResources type="javascript" resources="main.js" async="true"/>
    </head>

    <body>
        <c:if test="${renderContext.loggedIn && !(currentAliasUser.username eq 'guest')}">
            <div class="jtrial-adminBar flexRow alignCenter ${renderContext.editMode ? "edit" : ""}">
                <template:area path="admincontent"/>
            </div>
        </c:if>
        <header class="jtrial-site-header alignCenter flexRow_between">
            <template:area path="headercontent"/>
        </header>
        <main class="jtrial-main">
            <template:area path="pagecontent"/>
        </main>
    </body>
</html>