{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<table class="table table-striped">
	<thead>
		<tr>
			<th>Title</th>
			<th>Subtitle</th>
			<th>Project ID</th>
			<th>Shoot Start Date</th>
			<th>Collection</th>
			<th>Client</th>
			<th>Category</th>
			<th>Created By</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		{foreach item=p from=$projects}
		<tr>
			<td>{$p->title}</td>
			<td>{$p->subtitle}</td>
			<td>{$p->project_identifier}</td>
			<td>{$p->shoot_start_date}</td>
			<td>{$p->collection->name}</td>
			<td>{$p->client->name}</td>
			<td>{$p->itunes_u_category}</td>
			<td>{$p->created_by}</td>
			<td><a href="project/{$p->id}" class="btn btn-mini btn-info">view</a></td>
			<td><a href="project/{$p->id}/edit" class="btn btn-mini btn-danger">edit</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>


{if $request->user->is_admin}
<a class="btn btn-primary" href="project/form">Add a Project &raquo;</a>
{/if}


{/block}
