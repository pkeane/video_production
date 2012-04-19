{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
	<div class="span3">
		<h1>Add a Client</h1>

		<ul class="unstyled">
			<li><h4>
				<a href="client/form" class="greyed">Add a Client</a> 
				<a href="client/list"><i class="icon-list"></i></a>
			</h4></li>
			<li><h4>
				<a href="collection/form">Add a Collection/Series</a> 
				<a href="collection/list"><i class="icon-list"></i></a>
			</h4></li>
			<li><h4>
				<a href="participant/form">Add a Participant</a> 
				<a href="participant/list"><i class="icon-list"></i></a>
			</h4></li>
			<li><h4>
				<a href="project/form">Add a Project</a> 
				<a href="project/list"><i class="icon-list"></i></a>
			</h4></li>
		</ul>
	</div>
	<div class="span6">

		<form id="edit_form" method="post" class="well form-horizontal">
			<div class="control-group">
				<label class="control-label" for="input-name">Name</label>
				<div class="controls">
					<input type="text" class="span4" name="name" value="{$client->name}" id="input-name">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-primary_contact_name">Primary Contact Name</label>
				<div class="controls">
					<input type="text" class="span4" name="primary_contact_name" value="{$client->primary_contact_name}" id="input-primary_contact_name">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-primary_contact_email">Primary Contact Email</label>
				<div class="controls">
					<input type="text" class="span4" name="primary_contact_email" value="{$client->primary_contact_email}" id="input-primary_contact_email">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-primary_contact_phone">Primary Contact Phone</label>
				<div class="controls">
					<input type="text" class="span4" name="primary_contact_phone" value="{$client->primary_contact_phone}" id="input-primary_contact_phone">
				</div>
			</div>
			<div class="controls"><input type="submit" value="save" class="btn btn-primary">
				<a href="client/list" class="btn">cancel</a>
				<a href="client/{$client->id}" class="delete btn btn-danger">delete</a>
			</div>
		</form>
	</div>
</div>

{/block}
