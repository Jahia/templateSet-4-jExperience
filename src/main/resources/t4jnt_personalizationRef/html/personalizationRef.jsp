<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<jsp:useBean id="random" class="java.util.Random" scope="application" />

<c:set var="targetId" value="code_${fn:replace(random.nextInt(),'-','_')}"/>

<%--${url.context}--%>
<c:set var="perso" value="${currentNode.properties.personalization.node}"/>
<c:set var="codeUrl"
       value="/sites/${renderContext.site.siteKey}/contents/${perso.name}"/>
<c:set var="code" value="<div data-jtracker-personalization=\"${codeUrl}\"></div>"/>


<pre class="jtrial-pre" id="${targetId}">
${fn:escapeXml(code)}
</pre>

<button class="jtrial-button icon-copy" onclick="jtrialCopyMe('${targetId}')">Copy text</button>
