{extends file="framework/bootstrap.tpl"}

{block name="content"}
<div class="sets_instructor">
	<h1>Users</h1>
	<ul class="unstyled" id="user_privs">
		{foreach item=u from=$users}
		<li>{$u->name}
		{if $u->is_admin}
		<a href="admin/user/{$u->id}/is_admin" class="delete btn btn-mini btn-danger">remove privileges</a> 
		{else}
		<a href="admin/user/{$u->id}/is_admin" class="put btn btn-mini btn-success">grant privileges</a> 
		{/if}
		{if $u->is_staff}
		<a href="admin/user/{$u->id}/is_staff" class="delete btn btn-mini btn-danger">remove is_staff</a>
		{else}
		<a href="admin/user/{$u->id}/is_staff" class="put btn btn-mini btn-success">set is_staff</a>
		{/if}
		</li>
		{/foreach}
	</ul>
</div>
{/block}
