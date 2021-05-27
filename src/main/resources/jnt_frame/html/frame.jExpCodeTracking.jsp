<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>

<c:if test="${!renderContext.loggedIn || currentAliasUser.username eq 'guest'}">
    <div class="jtrial-banner">
        <ui:loginArea class="loginForm" onsubmit="loginButton.disabled = true; return true;">
            <h3><fmt:message key="jtrial.loginform.title"/></h3>
            <span><fmt:message key="jtrial.loginform.text"/></span>
            <ui:isLoginError var="loginResult">
                <span class="error"><fmt:message key="${loginResult == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/></span>
            </ui:isLoginError>
            <c:if test="${not empty param['loginError']}">
                <span class="error"><fmt:message key="${param['loginError'] == 'account_locked' ? 'message.accountLocked' : 'message.invalidUsernamePassword'}"/></span>
            </c:if>


            <p>
                <label for="username"><fmt:message key="label.username"/>:</label>
                <input type="text" value="" tabindex="1" maxlength="250" name="username" id="username"/>
            </p>

            <p>
                <label for="password"><fmt:message key="label.password"/>:</label>
                <input type="password" tabindex="2" maxlength="250" name="password" id="password" autocomplete="off"/>
            </p>

            <p>
                <input type="checkbox" id="rememberme" name="useCookie"/>
                <label for="rememberme" class="rememberLabel"><fmt:message key="jtrial.loginform.rememberMe.label"/></label>

            </p>

            <div class="divButton">
                <input type="submit" name="loginButton" class="jtrial-button" value="<fmt:message key='loginForm.loginbutton.label'/>"/>
            </div>
        </ui:loginArea>
    </div>
</c:if>

<c:if test="${renderContext.loggedIn &&  !(currentAliasUser.username eq 'guest')}">

    <c:set var="frameUrl"
           value="${url.context}/cms/editframe/default/en/sites/${renderContext.site.siteKey}.tracking-30-information.html#!/tracking-information"/>

    <div class="iframe-container">
        <iframe id="jExpCodeSnippet" src="${frameUrl}"
            style="display: block;visibility:hidden;" frameBorder="0" width="100%" onload="loadJExpCodeTracking(this)">
        </iframe>
    </div>

    <script type="text/javascript">
        const loadJExpCodeTracking= (iframe) => {
            //iframe contains script. we must wait until this script create the form element.
            // const iframe = document.getElementById("jExpCodeSnippet");

            if(!iframe.contentWindow){
                const h3 = document.createElement("h3");
                h3.textContent="<fmt:message key="jtrial.iframe.noContent"/>";
                iframe.replaceWith(h3);
                return;
            }

            const issue = iframe.contentWindow.document.querySelector("h3[message-key='wem.error.apacheUnomi']");
            if(issue){
                iframe.replaceWith(issue);
                return;
            }

            let body = iframe.contentWindow.document.getElementsByTagName("body")[0];

            const updateBody= (iframe,body) => {
                const form = iframe.contentWindow.document.forms["trackingInformationCtrl.settingsForm"];
                if(!form)
                    return setTimeout( () => {
                        updateBody(iframe,body);
                    },100);

                const textarea = form.getElementsByTagName("textarea")[0];
                const btn = form.getElementsByTagName("button")[0];
                btn.style.margin="0";

                const newBody = document.createElement("body");
                const div = document.createElement("div");
                // div.classList.add("jExpCodeSnippet-wrapper");
                div.setAttribute("id","jExpCodeSnippet-wrapper");
                div.style.overflow="hidden";
                div.style.padding="20px 0";
                div.style.background="#fff";
                div.append(textarea);
                div.append(btn);
                newBody.append(div);
                body.replaceWith(newBody);

                iframe.style.height = newBody.scrollHeight + 'px';
                iframe.style.visibility = "visible";
                return true;
            }

            return updateBody(iframe,body);
        }
    </script>
</c:if>