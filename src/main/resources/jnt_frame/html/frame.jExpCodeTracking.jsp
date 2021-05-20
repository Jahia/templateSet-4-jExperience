<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            div.style.padding="20px";
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