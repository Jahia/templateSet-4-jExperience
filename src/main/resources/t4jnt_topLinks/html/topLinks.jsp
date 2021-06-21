<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>

<c:set var="items" value="${jcr:getChildrenOfType(currentNode, 't4jnt:topLink')}"/>

<nav class="flexFluid">
    <ol class="flexRow alignCenter">
        <c:forEach items="${items}" var="item" varStatus="status">
            <template:module node="${item}" />
        </c:forEach>
    </ol>
    <c:if test="${renderContext.editMode}">
        <%--
        As only one child type is defined no need to restrict
        if a new child type is added restriction has to be done
        using 'nodeTypes' attribute
        --%>
        <template:module path="*" />
    </c:if>
</nav>
<div class="jtrial-adminBar_userActions">
    <span class="jtrial-adminBar_user">${renderContext.user.name}</span>
    <div class="jtrial-adminBar_userMenu">
        <a href="${url.logout}" class="jtrial-adminBar_userMenuItem">Log out</a>
    </div>
</div>