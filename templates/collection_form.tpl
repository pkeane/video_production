{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
	<div class="span4">
		<h1>Add a Collection/Series</h1>

		<ul class="unstyled">
			<li><h3>
				<a href="client/form">Add a Client</a> 
				<a href="client/list"><i class="icon-list"></i></a>
			</h3></li>
			<li><h3>
				<a href="collection/form" class="greyed">Add a Collection/Series</a> 
				<a href="collection/list"><i class="icon-list"></i></a>
			</h3></li>
			<li><h3>
				<a href="participant/form">Add a Participant</a> 
				<a href="participant/list"><i class="icon-list"></i></a>
			</h3></li>
			<li><h3>
				<a href="project/form">Add a Project</a> 
				<a href="project/list"><i class="icon-list"></i></a>
			</h3></li>
		</ul>
	</div>

	<div class="span6">
		<form id="collection_form" method="post" class="well form-horizontal">
			<div class="control-group">
				<label class="control-label" for="input-name">Name</label>
				<div class="controls">
					<input type="text" class="span4" name="name" id="input-name">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-short_name">Short Name</label>
				<div class="controls">
					<input type="text" class="span4" name="short_name" id="input-short_name">
				</div>
			</div>
			<div class="controls"><input type="submit" value="save" class="btn btn-primary">
			</div>
		</form>

	</div>
</div>

{/block}
