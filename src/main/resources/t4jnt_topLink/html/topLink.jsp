<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>

<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="link" value="${currentNode.properties['j:link'].string}"/>
<c:set var="iconNode" value="${currentNode.properties['icon'].node}"/>
<c:url var="iconURL" value="${iconNode.url}" context="/"/>
<c:set var="classIcon" value="${empty title ? 'big' : ''}"/>

<li class="jtrial-adminBar_item">
    <a href="${link}" class="flexRow alignCenter">
        <c:if test="${not empty iconURL}">
            <img class="jtrial-adminBar_itemIcon ${classIcon}" src="${iconURL}"/>
        </c:if>
        <c:if test="${not empty title}">
            <span>${title}</span>
        </c:if>
    </a>
</li>