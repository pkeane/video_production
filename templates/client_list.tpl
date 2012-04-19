{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<h1>Client List</h1>

<table class="table table-striped">
	<thead>
		<tr>
			<th>Name</th>
			<th>Primary Contact Name</th>
			<th>Primary Contact Email</th>
			<th>Primary Contact Phone</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		{foreach item=c from=$clients}
		<tr>
			<td>{$c->name}</td>
			<td>{$c->primary_contact_name}</td>
			<td>{$c->primary_contact_email}</td>
			<td>{$c->primary_contact_phone}</td>
			<td><a href="client/{$c->id}/edit" class="btn btn-mini btn-danger">edit</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>

{if $request->user->is_admin}
<a class="btn btn-primary" href="client/form">Add a Client &raquo;</a>
{/if}

{/block}
