{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<h1>Collection/Series List</h1>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Short Name</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		{foreach item=c from=$collections}
		<tr>
			<td>{$c->name}</td>
			<td>{$c->short_name}</td>
			<td><a href="collection/{$c->id}/edit" class="btn btn-mini btn-danger">edit</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>

{if $request->user->is_admin}
<a class="btn btn-primary" href="collection/form">Add a Collection &raquo;</a>
{/if}

{/block}
