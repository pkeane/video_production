{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="well">
	<dl id="project" class="dl-horizontal">
		{foreach key=att item=val from=$project}
		<dt>{$att}</dt>
		<dd>{$val|default:'-'}</dd>
		{/foreach}
	</dl>
	<div class="clear"></div>
</div>

{/block}
