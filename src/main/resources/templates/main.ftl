<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="text" name="text" placeholder="Enter the text"/>
            <input type="text" name="tag" placeholder="Tag"/>
            <input type="file" name="file">
            <button type="submit">Add the message</button>
        </form>
    </div>

    <div>List of messages</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter?ifExists}"/>
        <button type="submit">Search</button>
    </form>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <span>${message.text}</span>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}">
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
    <div>
        <@l.logout/>
        <span><a href="/user">users</a></span>
    </div>
</@c.page>