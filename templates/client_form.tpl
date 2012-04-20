{extends file="framework/bootstrap.tpl"}

{block name="title"}{$main_title}{/block}

{block name="content"}

<div class="row">
<div class="span3">
	<h1>Add a Client</h1>
</div>
<div class="span6">

<form method="post" class="well form-horizontal">
<div class="control-group">
<label class="control-label" for="input-name">Name</label>
   <div class="controls">
      <input type="text" class="span4" name="name" id="input-name">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-primary_contact_name">Primary Contact Name</label>
   <div class="controls">
      <input type="text" class="span4" name="primary_contact_name" id="input-primary_contact_name">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-primary_contact_email">Primary Contact Email</label>
   <div class="controls">
      <input type="text" class="span4" name="primary_contact_email" id="input-primary_contact_email">
   </div>
</div>
<div class="control-group">
<label class="control-label" for="input-primary_contact_phone">Primary Contact Phone</label>
   <div class="controls">
      <input type="text" class="span4" name="primary_contact_phone" id="input-primary_contact_phone">
   </div>
</div>
<div class="form-actions">
	<input type="submit" value="save" class="btn btn-primary">
	<a href="clients" class="btn">cancel</a>
</div>
</form>
</div>
</div>

{/block}
