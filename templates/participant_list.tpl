{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<h1>Participant List</h1>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Title</th>
			<th>Project</th>
		</tr>
	</thead>
	<tbody>
		{foreach item=part from=$participants}
		<tr>
			<td>{$part->name}</td>
			<td>{$part->title}</td>
			<td><a href="project/{$part->project->id}">{$part->project->title}</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>



{/block}
