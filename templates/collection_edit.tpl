{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
	<div class="span4">
		<h1>Edit Collection/Series</h1>
	</div>

	<div class="span6">
		<form id="edit_form" method="post" class="well form-horizontal">
			<div class="control-group">
				<label class="control-label" for="input-name">Name</label>
				<div class="controls">
					<input type="text" class="span4" name="name" value="{$collection->name}" id="input-name">
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input-short_name">Short Name</label>
				<div class="controls">
					<input type="text" class="span4" name="short_name" value="{$collection->short_name}" id="input-short_name">
				</div>
			</div>
			<div class="form-actions"><input type="submit" value="save" class="btn btn-primary">
				<a href="collection/list" class="btn">cancel</a>
				<div class="pull-right">
					<a href="collection/{$collection->id}" class="delete btn btn-danger">delete</a>
				</div>
			</div>
		</form>

	</div>
</div>

{/block}
