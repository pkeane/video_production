{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}
{if $request->user->is_admin}
<a class="btn btn-primary" href="project/form">Add a Project &raquo;</a>
{/if}


<table class="table table-striped">
	<thead>
		<tr>
			<th>Title</th>
			<th>Subtitle</th>
			<th>Project ID</th>
			<th>Shoot Start Date</th>
			<th>Collection</th>
			<th>Client</th>
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
			<td>{$p->collection}</td>
			<td>{$p->client}</td>
			<td><a href="project/{$p->id}/edit" class="btn btn-mini btn-danger">edit</a></td>
		</tr>
		{/foreach}
	</tbody>
</table>



{/block}
