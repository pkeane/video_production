{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<h1>Video Project: {$project->title}</h1>

		<table class="table table-striped table-bordered table-condensed"><tbody>
				<tr><th scope="row">Title</th><td>{$project->title}</td></tr>
				<tr><th scope="row">Project ID</th><td>{$project->project_identifier}</td></tr>
				<tr><th scope="row">IDT Account #</th><td>{$project->idt_account}</td></tr>
				<tr><th scope="row">Subtitle</th><td>{$project->subtitle}</td></tr>
				<tr><th scope="row">Collection</th><td>{$project->collection->name}</td></tr>
				<tr><th scope="row">Client</th><td>{$project->client->name}</td></tr>
				<tr>
					<th scope="row">Participants</th>
					<td>
						<ul class="unstyled">
							{foreach from=$project->participants item=part}
							<li>{$part->name} ({$part->title})</li>
							{/foreach}
						</ul>
					</td>
				</tr>
				<tr><th scope="row">Contact Name</th><td>{$project->contact_name}</td></tr>
				<tr><th scope="row">Contact Phone</th><td>{$project->contact_phone}</td></tr>
				<tr><th scope="row">Contact Email</th><td>{$project->contact_email}</td></tr>
				<tr><th scope="row">Shoot Start Date</th><td>{$project->shoot_start_date}</td></tr>
				<tr><th scope="row">Shoot Location</th><td>{$project->shoot_location}</td></tr>
				<tr><th scope="row">Author</th><td>{$project->author}</td></tr>
				<tr><th scope="row">Internal Description</th><td>{$project->internal_description}</td></tr>
				<tr><th scope="row">External Description</th><td>{$project->external_description}</td></tr>
				<tr><th scope="row">Notes</th><td>{$project->notes}</td></tr>
				<tr><th scope="row">Rights</th><td>{$project->rights}</td></tr>
				<tr><th scope="row">Path To Av Server Files</th><td>{$project->path_to_av_server_files}</td></tr>
				<tr><th scope="row">Path To Media Server Files</th><td>{$project->path_to_media_server_files}</td></tr>
				<tr><th scope="row">Destination</th><td>{$project->destination}</td></tr>
				<tr><th scope="row">Created</th><td>{$project->created}</td></tr>
				<tr><th scope="row">Created By</th><td>{$project->created_by}</td></tr>
				<tr><th scope="row">Itunes U Category</th><td>{$project->itunes_u_category}</td></tr>
				<tr><th scope="row">Staff Credit</th>
					<td>
						{foreach from=$project->staff item=s}
						<div>{$s->name}</div>
						{/foreach}
					</td>
				</tr>
				<tr><th scope="row">Can Reuse Videos</th><td>{$project->can_reuse_videos|replace:'0':'no'|replace:'1':'yes'}</td></tr>
				<tr><th scope="row">Client Provides Storage</th><td>{$project->client_provides_storage|replace:'0':'no'|replace:'1':'yes'}</td></tr>
				<tr><th scope="row">Can Delete Raw When Complete</th><td>{$project->can_delete_raw_when_complete|replace:'0':'no'|replace:'1':'yes'}</td></tr>
		</tbody></table>

			<a href="project/{$project->id}/edit" class="btn btn-danger">edit project</a>
{/block}
