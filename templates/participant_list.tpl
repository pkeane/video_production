{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<h1>Participant List</h1>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Title</th>
			<th>Email</th>
			<th>Phone</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		{foreach item=part from=$participants}
		<tr>
			<td>{$part->name}</td>
			<td>{$part->title}</td>
			<td>{$part->email}</td>
			<td>{$part->phone}</td>
			<td><a href="participant/{$part->id}/edit" class="btn btn-mini btn-danger">edit</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>

{if $request->user->is_admin}
<a class="btn btn-primary" href="participant/form">Add a Participant &raquo;</a>
{/if}




{/block}
