{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
<div class="span3">
	<h1>Edit Project</h1>

	<!--
<ul class="unstyled">
	<li><h3>
		<a href="client/form">Add a Client</a> 
		<a href="client/list"><i class="icon-list"></i></a>
	</h3></li>
	<li><h3>
		<a href="collection/form">Add a Collection/Series</a> 
		<a href="collection/list"><i class="icon-list"></i></a>
	</h3></li>
	<li><h3>
		<a href="participant/form">Add a Participant</a> 
		<a href="participant/list"><i class="icon-list"></i></a>
	</h3></li>
	<li><h3>
		<a href="project/form" class="greyed">Add a Project</a> 
		<a href="project/list"><i class="icon-list"></i></a>
	</h3></li>
</ul>
-->
</div>
<div class="span6">


<form id="edit_form" method="post" class="well form-horizontal">
<div class="control-group">
<label class="control-label" for="input-title">Title</label>
   <div class="controls">
		 <input type="text" class="span4" name="title" value="{$project->title}"  id="input-title">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-subtitle">Subtitle</label>
   <div class="controls">
		 <input type="text" class="span4" name="subtitle" value="{$project->subtitle}"  id="input-subtitle">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-project_identifier">Project Identifier</label>
   <div class="controls">
		 <input type="text" class="span4" name="project_identifier" value="{$project->project_identifier}"  id="input-project_identifier">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-idt_account">IDT Account Number</label>
   <div class="controls">
		 <input type="text" class="span4" name="idt_account" value="{$project->idt_account}"  id="input-idt_account">
   </div>
</div>

<div class="control-group">
<label class="control-label" for="input-collection_id">Collection</label>
   <div class="controls">
		 <select name="collection_id">
			 <option value="">select one:</option>
			 {foreach item=c from=$collections}
			 <option value="{$c->id}" {if $project->collection_id == $c->id}selected{/if}>{$c->name}</option>
			 {/foreach}
		 </select>
   </div>
</div>

<div class="control-group">
<label class="control-label" for="input-client_id">Client</label>
   <div class="controls">
		 <select name="client_id">
			 <option value="">select one:</option>
			 {foreach item=cl from=$clients}
			 <option value="{$cl->id}" {if $project->client_id == $cl->id}selected{/if}>{$cl->name}</option>
			 {/foreach}
		 </select>
   </div>
</div>

<div class="control-group">
<label class="control-label" for="input-contact_name">Contact Name</label>
   <div class="controls">
		 <input type="text" class="span4" name="contact_name" value="{$project->client->primary_contact_name}" id="input-contact_name">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-contact_phone">Contact Phone</label>
   <div class="controls">
		 <input type="text" class="span4" name="contact_phone" value="{$project->client->primary_contact_phone}" id="input-contact_phone">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-contact_email">Contact Email</label>
   <div class="controls">
		 <input type="text" class="span4" name="contact_email" value="{$project->client->primary_contact_email}" id="input-contact_email">
   </div>
</div>

<div class="control-group">
<label class="control-label" for="input-shoot_start_date">Shoot Start Date</label>
   <div class="controls">
		 <input type="text" class="input-small datepicker" name="shoot_start_date" value="{$project->shoot_start_date}"  id="input-shoot_start_date">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-shoot_location">Shoot Location</label>
   <div class="controls">
		 <input type="text" class="span4" name="shoot_location" value="{$project->shoot_location}"  id="input-shoot_location">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-author">Author</label>
   <div class="controls">
		 <input type="text" class="span4" name="author" value="College of Liberal Arts, The University of Texas at Austin" value="{$project->author}"   id="input-author">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-internal_description">Internal Description</label>
   <div class="controls">
		 <textarea class="span4" name="internal_description" id="input-internal_description">{$project->internal_description}</textarea>
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-external_description">External Description</label>
   <div class="controls">
		 <textarea class="span4" name="external_description" id="input-external_description">{$project->external_description}</textarea>
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-rights">Rights</label>
   <div class="controls">
		 <input type="text" class="span4" name="rights" value="The University of Texas at Austin" value="{$project->rights}"  id="input-rights">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-path_to_av_server_files">Path To Av Server Files</label>
   <div class="controls">
		 <input type="text" class="span4" name="path_to_av_server_files" value="{$project->path_to_av_server_files}" id="input-path_to_av_server_files">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-path_to_media_server_files">Path To Media Server Files</label>
   <div class="controls">
      <input type="text" class="span4" name="path_to_media_server_files"  value="{$project->path_to_media_server_files}" id="input-path_to_media_server_files">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-destination">Destination</label>
   <div class="controls">
		 <input type="text" class="span4" name="destination" value="{$project->destination}" id="input-destination">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-itunes_u_category">iTunes U Category</label>
   <div class="controls">
		 <select name="itunes_u_category">
			 <option value="">Select One:</option>
			 <option {if $project->itunes_u_category == 'Business'}selected{/if}>Business</option>
			 <option {if $project->itunes_u_category == 'Engineering'}selected{/if}>Engineering</option>
			 <option {if $project->itunes_u_category == 'Fine Arts'}selected{/if}>Fine Arts</option>
			 <option {if $project->itunes_u_category == 'Health Business Medicine'}selected{/if}>Health & Medicine</option>
			 <option {if $project->itunes_u_category == 'History'}selected{/if}>History</option>
			 <option {if $project->itunes_u_category == 'Humanities'}selected{/if}>Humanities</option>
			 <option {if $project->itunes_u_category == 'Language'}selected{/if}>Language</option>
			 <option {if $project->itunes_u_category == 'Literature'}selected{/if}>Literature</option>
			 <option {if $project->itunes_u_category == 'Mathematics'}selected{/if}>Mathematics</option>
			 <option {if $project->itunes_u_category == 'Science'}selected{/if}>Science</option>
			 <option {if $project->itunes_u_category == 'Social Science'}selected{/if}>Social Science</option>
			 <option {if $project->itunes_u_category == 'Society'}selected{/if}>Society</option>
			 <option {if $project->itunes_u_category == 'Teaching Business Education'}selected{/if}>Teaching & Education</option>
		 </select>
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-can_reuse_videos">Can Reuse Videos (iTunesU, YouTube, etc.)</label>
   <div class="controls">
		 <input type="checkbox" value="1" class="span4" name="can_reuse_videos" id="input-can_reuse_videos" {if $project->can_reuse_videos}checked{/if}>
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-client_provides_storage">Client Provides Storage</label>
   <div class="controls">
      <input type="checkbox" value="1"class="span4" name="client_provides_storage" id="input-client_provides_storage" {if $project->client_provides_storage}checked{/if}>
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-can_delete_raw_when_complete">Can Delete Raw When Complete</label>
   <div class="controls">
		 <input type="checkbox" value="1" class="span4" name="can_delete_raw_when_complete" id="input-can_delete_raw_when_complete" {if $project->can_delete_raw_when_complete}checked{/if}>
   </div>
</div>
<div class="controls"><input type="submit" value="save" class="btn btn-primary">
				<a href="projects" class="btn">cancel</a>
				<a href="project/{$project->id}" class="delete btn btn-danger">delete</a>
</div>
</form>

</div>
</div>

{/block}
