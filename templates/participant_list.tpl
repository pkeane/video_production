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

{if $request->user->is_admin}
<a class="btn btn-primary" href="participant/form">Add a Participant &raquo;</a>
{/if}




{/block}
