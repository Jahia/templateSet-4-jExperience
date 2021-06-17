<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<nav class="flexFluid">
    <ol class="flexRow alignCenter">
        <li class="flexRow alignCenter jtrial-adminBar_item">
            <img class="jtrial-adminBar_itemIcon_home" src="${url.context}/modules/templateSet-4-jExperience/img/assets/homeIcon.svg"/>
        </li>
        <li class="jtrial-adminBar_item">
            <a href="" class="flexRow alignCenter">
                <img class="jtrial-adminBar_itemIcon" src="${url.context}/modules/templateSet-4-jExperience/img/assets/targetIcon.svg"/>
                <span>Manage personalizations</span>
            </a>
        </li>
        <li class="jtrial-adminBar_item flexRow alignCenter">
            <a href="" class="flexRow alignCenter">
                <img class="jtrial-adminBar_itemIcon" src="${url.context}/modules/templateSet-4-jExperience/img/assets/mediaIcon.svg"/>
                <span>Manage media</span>
            </a>
        </li>
    </ol>
</nav>
<div class="jtrial-adminBar_userActions">
    <span class="jtrial-adminBar_user">${renderContext.user.name}</span>
    <div class="jtrial-adminBar_userMenu">
        <a href="${url.logout}" class="jtrial-adminBar_userMenuItem">Log out</a>
    </div>
</div>
