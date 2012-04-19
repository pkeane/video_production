{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
	<div class="span3">
			<h1>Add a Participant</h1>

		<ul class="unstyled">
	<li><h4>
		<a href="client/form">Add a Client</a> 
		<a href="client/list"><i class="icon-list"></i></a>
	</h4></li>
	<li><h4>
		<a href="collection/form">Add a Collection/Series</a> 
		<a href="collection/list"><i class="icon-list"></i></a>
	</h4></li>
	<li><h4>
		<a href="participant/form" class="greyed">Add a Participant</a> 
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
		 <input type="text" class="span4" name="name" value="{$participant->name}" id="input-name">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-title">Title</label>
   <div class="controls">
		 <input type="text" class="span4" name="title" value="{$participant->title}" id="input-title">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-email">Email</label>
   <div class="controls">
		 <input type="text" class="span4" name="email" value="{$participant->email}" id="input-email">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-phone">Phone</label>
   <div class="controls">
		 <input type="text" class="span4" name="phone" value="{$participant->phone}" id="input-phone">
   </div>
</div>
<div class="controls"><input type="submit" value="submit" class="btn btn-primary">
<a href="participant/{$participant->id}" class="delete btn btn-danger">delete</a>
</div>
</form>

	</div>
</div>

{/block}
