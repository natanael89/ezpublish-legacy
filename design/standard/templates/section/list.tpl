<a href={"/manual/user/everyday#Sections"|ezurl} target="_ezpublishmanual"><img src={"help.gif"|ezimage} align="right"> </a>
<form method="post" action={"/section/list/"|ezurl}>

<div class="maincontentheader">
    <h1>{"Section list"|i18n("design/standard/section")}</h1>
</div>

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th>{"ID"|i18n("design/standard/section")}</th>
    <th>{"Name"|i18n("design/standard/section")}</th>
    <th width="1">{"Edit"|i18n("design/standard/section")}</th>
    <th width="1">{"Assign"|i18n("design/standard/section")}</th>
    <th width="1">{"Remove"|i18n("design/standard/section")}</th>
</tr>
{section name=Section loop=$section_array sequence=array(bglight,bgdark)}
<tr class="{$Section:sequence}">
    <td>
        {$Section:item.id}
    </td>
    <td>
        {$Section:item.name}
    </td>
    <td>
        <a href={concat("/section/edit/",$Section:item.id,"/")|ezurl}><img src={"edit.png"|ezimage}/></a>
    </td>
    <td>
        <a href={concat("/section/assign/",$Section:item.id,"/")|ezurl}><img src={"attach.png"|ezimage}/></a>
    </td>
    <td width="1" align="right">
        <input type="checkbox" name="SectionIDArray[]" value="{$Section:item.id}" />
    </td>    
</tr>
{/section}
<tr>
    <td colspan="4">
        <input class="defaultbutton" type="submit" name="CreateSectionButton" value="{'New'|i18n('design/standard/section')}" />
    </td>
    <td width="1" align="right">
        <input type="image" name="RemoveSectionButton" value="{'Remove'|i18n('design/standard/section')}" src={"trash.png"|ezimage} />
    </td>
<tr>
</table>

{include name=navigator
         uri='design:navigator/google.tpl'
         page_uri=concat('/section/list/')
         item_count=$section_count
         view_parameters=$view_parameters
         item_limit=$limit}

</form>
