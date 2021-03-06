{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
	<div class="span3">
		<h1>Add a Project</h1>

	</div>
	<div class="span6">


		<form method="post" class="well form-horizontal">
			<div class="control-group">
				<label class="control-label" for="input-title">Title</label>
				<div class="controls">
					<input type="text" class="span4" name="title" id="input-title">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-subtitle">Subtitle</label>
				<div class="controls">
					<input type="text" class="span4" name="subtitle" id="input-subtitle">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-project_identifier">Project Identifier</label>
				<div class="controls">
					<input type="text" class="span4" name="project_identifier" id="input-project_identifier">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-idt_account">IDT Account Number</label>
				<div class="controls">
					<input type="text" class="span4" name="idt_account" id="input-idt_account">
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="input-collection_id">Collection</label>
				<div class="controls">
					<select name="collection_id">
						<option value="0">select one:</option>
						{foreach item=c from=$collections}
						<option value="{$c->id}">{$c->name}</option>
						{/foreach}
					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="input-client_id">Client</label>
				<div class="controls">
					<select name="client_id">
						<option value="0">select one:</option>
						{foreach item=cl from=$clients}
						<option value="{$cl->id}">{$cl->name}</option>
						{/foreach}
					</select>
				</div>
			</div>

			<!--
			<div class="control-group">
				<label class="control-label" for="input-contact_name">Contact Name</label>
				<div class="controls">
					<input type="text" class="span4" name="contact_name" id="input-contact_name">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-contact_phone">Contact Phone</label>
				<div class="controls">
					<input type="text" class="span4" name="contact_phone" id="input-contact_phone">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-contact_email">Contact Email</label>
				<div class="controls">
					<input type="text" class="span4" name="contact_email" id="input-contact_email">
				</div>
			</div>
			-->

			<div class="control-group">
				<label class="control-label" for="input-shoot_start_date">Shoot Start Date</label>
				<div class="controls">
					<input type="text" class="input-small datepicker" name="shoot_start_date" value="{$smarty.now|date_format:"%Y-%m-%d"}"  id="input-shoot_start_date">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-shoot_location">Shoot Location</label>
				<div class="controls">
					<input type="text" class="span4" name="shoot_location" id="input-shoot_location">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-author">Author</label>
				<div class="controls">
					<input type="text" class="span4" name="author" value="College of Liberal Arts, The University of Texas at Austin"  id="input-author">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-internal_description">Internal Description</label>
				<div class="controls">
					<textarea class="span4" name="internal_description" id="input-internal_description"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-external_description">External Description</label>
				<div class="controls">
					<textarea class="span4" name="external_description" id="input-external_description"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-notes">Notes</label>
				<div class="controls">
					<textarea class="span4" name="notes" id="input-notes"></textarea>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-rights">Rights</label>
				<div class="controls">
					<input type="text" class="span4" name="rights" value="The University of Texas at Austin"  id="input-rights">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-path_to_av_server_files">Path To Av Server Files</label>
				<div class="controls">
					<input type="text" class="span4" name="path_to_av_server_files" id="input-path_to_av_server_files">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-path_to_media_server_files">Path To Media Server Files</label>
				<div class="controls">
					<input type="text" class="span4" name="path_to_media_server_files" id="input-path_to_media_server_files">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-destination">Destination</label>
				<div class="controls">
					<input type="text" class="span4" name="destination" id="input-destination">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-itunes_u_category">iTunes U Category</label>
				<div class="controls">
					<select name="itunes_u_category">
						<option value="">Select One:</option>
						<option>Business</option>
						<option>Engineering</option>
						<option>Fine Arts</option>
						<option>Health & Medicine</option>
						<option>History</option>
						<option>Humanities</option>
						<option>Language</option>
						<option>Literature</option>
						<option>Mathematics</option>
						<option>Science</option>
						<option>Social Science</option>
						<option>Society</option>
						<option>Teaching & Education</option>
					</select>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="input-staff_credit">Staff Credits</label>
				<div class="controls">
					<ul class="unstyled">
						{foreach from=$staff item=s}
						<li><input type="checkbox" value="{$s->id}" class="span4" name="staff[]" id="input-staff_credit">
						{$s->name}</li>
						{/foreach}
					</ul>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label" for="input-can_reuse_videos">Can Reuse Videos (iTunesU, YouTube, etc.)</label>
				<div class="controls">
					<input type="checkbox" value="1" class="span4" name="can_reuse_videos" id="input-can_reuse_videos">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-client_provides_storage">Client Provides Storage</label>
				<div class="controls">
					<input type="checkbox" value="1" class="span4" name="client_provides_storage" id="input-client_provides_storage">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-can_delete_raw_when_complete">Can Delete Raw When Complete</label>
				<div class="controls">
					<input type="checkbox" value="1" class="span4" name="can_delete_raw_when_complete" id="input-can_delete_raw_when_complete">
				</div>
			</div>
			<div class="form-actions">
				<input type="submit" value="save project" class="btn btn-primary">
				<a href="projects" class="btn">cancel</a>
			</div>
		</form>

	</div>
</div>

{/block}
