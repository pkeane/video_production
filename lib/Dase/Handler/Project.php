<?php

class Dase_Handler_Project extends Dase_Handler
{
		public $resource_map = array(
				'list' => 'list',
				'form' => 'form',
				'{id}' => 'project',
				'{id}/edit' => 'edit_form',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function getForm($r) 
		{
				$t = new Dase_Template($r);

				$clients = new Dase_DBO_Client($this->db);
				$t->assign('clients',$clients->findAll(1));

				$collections = new Dase_DBO_Collection($this->db);
				$t->assign('collections',$collections->findAll(1));


				$r->renderResponse($t->fetch('project_form.tpl'));
		}

		public function postToForm($r) 
		{
				$project = new Dase_DBO_Project($this->db);
				$project->title = $r->get("title");
				$project->project_identifier = $r->get("project_identifier");
				$project->idt_account = $r->get("idt_account");
				$project->subtitle = $r->get("subtitle");
				$project->collection_id = $r->get("collection_id");
				$project->client_id = $r->get("client_id");
				$project->contact_name = $r->get("contact_name");
				$project->contact_phone = $r->get("contact_phone");
				$project->contact_email = $r->get("contact_email");
				$project->shoot_start_date = $r->get("shoot_start_date");
				$project->shoot_location = $r->get("shoot_location");
				$project->author = $r->get("author");
				$project->internal_description = $r->get("internal_description");
				$project->external_description = $r->get("external_description");
				$project->rights = $r->get("rights");
				$project->path_to_av_server_files = $r->get("path_to_av_server_files");
				$project->path_to_media_server_files = $r->get("path_to_media_server_files");
				$project->destination = $r->get("destination");
				$project->created = date(DATE_ATOM);
				$project->created_by = $this->user->eid;
				$project->itunes_u_category = $r->get("itunes_u_category");
				$project->can_reuse_videos = $r->get("can_reuse_videos");
				$project->client_provides_storage = $r->get("client_provides_storage");
				$project->can_delete_raw_when_complete = $r->get("can_delete_raw_when_complete");
				if ($project->title) {
						$project->insert();
				}
				$r->renderRedirect('projects');
		}

		public function getProject($r) 
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				$p->getCollection();
				$p->getClient();
				$t = new Dase_Template($r);

				$t->assign('project',$p);
				$r->renderResponse($t->fetch('project.tpl'));
		}

		public function getEditForm($r) 
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				$p->getCollection();
				$p->getClient();
				$t = new Dase_Template($r);
				$clients = new Dase_DBO_Client($this->db);
				$t->assign('clients',$clients->findAll(1));

				$collections = new Dase_DBO_Collection($this->db);
				$t->assign('collections',$collections->findAll(1));

				$t->assign('project',$p);
				$r->renderResponse($t->fetch('project_edit.tpl'));
		}

		public function deleteProject($r) 
		{
				$c = new Dase_DBO_Project($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				if ($c->delete()) {
						$r->renderResponse('deleted project');
				}
		}

		public function postToEditForm($r) 
		{
				$project = new Dase_DBO_Project($this->db);
				if (!$project->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}

				$project->title = $r->get("title");
				$project->project_identifier = $r->get("project_identifier");
				$project->idt_account = $r->get("idt_account");
				$project->subtitle = $r->get("subtitle");
				$project->collection_id = $r->get("collection_id");
				$project->client_id = $r->get("client_id");
				$project->contact_name = $r->get("contact_name");
				$project->contact_phone = $r->get("contact_phone");
				$project->contact_email = $r->get("contact_email");
				$project->shoot_start_date = $r->get("shoot_start_date");
				$project->shoot_location = $r->get("shoot_location");
				$project->author = $r->get("author");
				$project->internal_description = $r->get("internal_description");
				$project->external_description = $r->get("external_description");
				$project->rights = $r->get("rights");
				$project->path_to_av_server_files = $r->get("path_to_av_server_files");
				$project->path_to_media_server_files = $r->get("path_to_media_server_files");
				$project->destination = $r->get("destination");
				$project->itunes_u_category = $r->get("itunes_u_category");
				$project->can_reuse_videos = $r->get("can_reuse_videos");
				$project->client_provides_storage = $r->get("client_provides_storage");
				$project->can_delete_raw_when_complete = $r->get("can_delete_raw_when_complete");

				if ($project->title) {
						$project->update();
				}
				$r->renderRedirect('projects');
		}

}

