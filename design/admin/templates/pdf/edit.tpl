<form action={concat( 'pdf/edit/', $pdf_export.id )|ezurl} method="post" name="ExportPDF">

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'pdfexport'|icon( 'normal', 'PDF Export'|i18n( 'design/admin/pdf/edit' ) )}&nbsp;{'%pdf_export_title [PDF export]'|i18n( 'design/admin/pdf/edit',, hash( '%pdf_export_title', $pdf_export.title ) )|wash}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">
    {* Title. *}
    <div class="block">
        <label>{'Title'|i18n( 'design/admin/pdf/edit' )}:</label>
        <input class="box" type="text" name="Title" value="{$pdf_export.title|wash}" />
    </div>

    <fieldset>
    <legend>{'Frontpage'|i18n( 'design/admin/pdf/edit' )}</legend>

    {* Display frontpage. *}
    <div class="block">
        <label>{'Display frontpage'|i18n( 'design/admin/pdf/edit' )}:</label>
        <input type="checkbox" name="DisplayFrontpage" {section show=$pdf_export.show_frontpage|eq(1)}checked="checked"{/section} />
    </div>

    {* Intro text. *}
    <div class="block">
        <label>{'Intro text'|i18n( 'design/admin/pdf/edit' )}:</label>
        <textarea class="box" name="IntroText" cols="64" rows="3">{$pdf_export.intro_text|wash}</textarea>
    </div>

    {* Sub text. *}
    <div class="block">
        <label>{'Sub text'|i18n( 'design/admin/pdf/edit' )}:</label>
        <textarea class="box" name="SubText" cols="64" rows="3">{$pdf_export.sub_text|wash}</textarea>
    </div>
    </fieldset>

    {* Source node. *}
    <div class="block">
        <fieldset>
        <legend>{'Source node'|i18n( 'design/admin/pdf/edit' )}</legend>
        {section show=$pdf_export.source_node}
<table class="list" cellspacing="0">

<tr>
<th>{'Name'|i18n( 'design/admin/pdf/edit' )}</th>
<th>{'Type'|i18n( 'design/admin/pdf/edit' )}</th>
<th>{'Section'|i18n( 'design/admin/pdf/edit' )}</th>
</tr>
<tr>
<td>{$pdf_export.source_node.class_identifier|class_icon( small, $pdf_export.source_node.class_name )}&nbsp;{$pdf_export.source_node.name|wash}</td>
<td>{$pdf_export.source_node.class_name|wash}</td>
<td>{let section_object=fetch( section, object, hash( section_id, $pdf_export.source_node.object.section_id ) )}{section show=$section_object}{$section_object.name|wash}{section-else}<i>{'Unknown'|i18n( 'design/admin/notification/handler/ezsubtree/settings/edit' )}</i>{/section}{/let}</td>
</tr>

</table>
        {section-else}
        <p>{'There is no source node.'|i18n( 'design/admin/pdf/edit' )}</p>
        {/section}
        <input class="button" type="submit" name="ExportPDFBrowse" value="{'Browse'|i18n( 'design/admin/pdf/edit' )}" />
        <input type="hidden" name="SourceNode" value="{$pdf_export.source_node_id|wash}" />
        </fieldset>
    </div>

    {* Export structure. *}
    <div class="block">
        <label>{'Export structure'|i18n( 'design/admin/pdf/edit' )}:</label>
        <select name="ExportType">
        <option {section show=$pdf_export.export_structure|eq( 'tree' )|not()}selected="selected"{/section} value="node">{'Node'|i18n( 'design/admin/pdf/edit' )}</option>
        <option {section show=$pdf_export.export_structure|eq( 'tree' )}selected="selected"{/section} value="tree">{'Tree'|i18n( 'design/admin/pdf/edit' )}</option>
        </select>
    </div>

    {* Export classes. *}
    <div class="block">
        <label>{'Export classes (if exporting a tree)'|i18n( 'design/admin/pdf/edit' )}:</label>
        <select name="ClassList[]" multiple="multiple" size="8">
            {section var=class loop=$export_class_array}
                <option value="{$class.item.id}"
                {section show=$pdf_export.export_classes|contains($class.item.id)}
                    selected="selected"
                {/section}
                >{$class.item.name|wash}</option>
            {/section}
         </select>
    </div>

    {* Export destination. *}
    <div class="block">
        <label>{'Export type'|i18n( 'design/admin/pdf/edit' )}:</label>
        <select name="DestinationType">
        <option value="url" {section show=$export_type|eq( 2 )|not}selected="selected"{/section}>{'Generate once'|i18n( 'design/admin/pdf/edit' )}</option>
        <option value="download" {section show=$export_type|eq( 2 )}selected="selected"{/section}>{'Generate on the fly'|i18n( 'design/admin/pdf/edit' )}</option>
        </select>
    </div>
    <div class="block">
        <label>{'Filename (if generated on the fly)'|i18n( 'design/admin/pdf/edit' )}:</label>
        <input class="box" type="text" name="DestinationFile" value="{$pdf_export.pdf_filename|wash}" />
    </div>

</div>

{* DESIGN: Content END *}</div></div></div>

{* Buttons. *}
<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-tc"><div class="box-bl"><div class="box-br">
<div class="block">
    <input class="button" type="submit" name="ExportPDFButton" value="{'OK'|i18n( 'design/admin/pdf/edit' )}" />
    <input class="button" type="submit" name="DiscardButton" value="{'Cancel'|i18n( 'design/admin/pdf/edit' )}" />
</div>
{* DESIGN: Control bar END *}</div></div></div></div></div></div>
</div>

</div>

</form>
