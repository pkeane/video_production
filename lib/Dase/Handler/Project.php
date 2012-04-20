<?php

class Dase_Handler_Project extends Dase_Handler
{
		public $resource_map = array(
				'list' => 'list',
				'form' => 'form',
				'{id}' => 'project',
				'{id}/edit' => 'edit_form',
				'{id}/participants' => 'participants',
				'{id}/participant/{pid}' => 'participant',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function postToParticipants($r)
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				$part = new Dase_DBO_Participant($this->db);
				$part->project_id = $p->id;
				$part->name = $r->get('name');
				$part->title = $r->get('title');
				$part->created = date(DATE_ATOM);;
				$part->created_by = $this->user->eid;
				if ($part->name) {
						$part->insert();
				}
				$r->renderRedirect('project/'.$p->id.'/edit');
		}

		public function postToParticipant($r)
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				$part = new Dase_DBO_Participant($this->db);
				if (!$part->load($r->get('pid'))) {
						$r->renderRedirect('project/{$p->id}/edit');
				}
				$part->project_id = $p->id;
				$part->name = $r->get('name');
				$part->title = $r->get('title');
				if ($part->name) {
						$part->update();
				}
				$r->renderRedirect('project/'.$p->id.'/edit');
		}

		public function deleteParticipant($r)
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}
				$part = new Dase_DBO_Participant($this->db);
				if (!$part->load($r->get('pid'))) {
						$r->renderRedirect('project/{$p->id}/edit');
				}
				$part->delete();
				$r->renderRedirect('project/'.$p->id.'/edit');
		}

		public function getList($r)
		{
				$r->renderRedirect('projects');
		}

		public function getForm($r) 
		{
				$t = new Dase_Template($r);

				$clients = new Dase_DBO_Client($this->db);
				$t->assign('clients',$clients->findAll(1));

				$collections = new Dase_DBO_Collection($this->db);
				$t->assign('collections',$collections->findAll(1));

				$staff = new Dase_DBO_User($this->db);
				$staff->is_staff = 1;
				$t->assign('staff',$staff->findAll(1));


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

				if ($project->client_id) {
						$client = new Dase_DBO_Client($this->db);
						$client->load($project->client_id);
						$project->contact_name = $client->primary_contact_name;
						$project->contact_phone = $client->primary_contact_phone;
						$project->contact_email = $client->primary_contact_email;
				}

				$project->shoot_start_date = $r->get("shoot_start_date");
				$project->shoot_location = $r->get("shoot_location");
				$project->author = $r->get("author");
				$project->internal_description = $r->get("internal_description");
				$project->external_description = $r->get("external_description");
				$project->notes = $r->get("notes");
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
				foreach ($r->get('staff',1) as $staff_id) {
						$ps = new Dase_DBO_ProjectStaff($this->db);
						$ps->project_id = $project->id;
						$ps->user_id = $staff_id;
						$ps->insert();
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
				$p->getStaff();
				$p->getParticipants();
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
				$p->getParticipants();
				$t = new Dase_Template($r);
				$clients = new Dase_DBO_Client($this->db);
				$t->assign('clients',$clients->findAll(1));

				$collections = new Dase_DBO_Collection($this->db);
				$t->assign('collections',$collections->findAll(1));

				$staff = new Dase_DBO_User($this->db);
				$staff->is_staff = 1;
				$t->assign('staff',$staff->findAll(1));

				$current_staff = array();
				foreach ($p->getStaff() as $cs) {
						$current_staff[] = $cs->id;
				}
				$t->assign('current_staff',$current_staff); 

				$t->assign('project',$p);
				$r->renderResponse($t->fetch('project_edit.tpl'));
		}

		public function deleteProject($r) 
		{
				$p = new Dase_DBO_Project($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('projects');
				}

				$parts = new Dase_DBO_Participant($this->db);
				$parts->project_id = $p->id;
				foreach ($parts->findAll(1) as $doomed_part) {
						$doomed_part->delete();
				}

				$ps = new Dase_DBO_ProjectStaff($this->db);
				$ps->project_id = $p->id;
				foreach ($ps->findAll(1) as $doomed_ps) {
						$doomed_ps->delete();
				}

				if ($p->delete()) {
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

				if ($project->client_id && !$r->get('contact_name')) {
						$client = new Dase_DBO_Client($this->db);
						$client->load($project->client_id);
						$project->contact_name = $client->primary_contact_name;
						$project->contact_phone = $client->primary_contact_phone;
						$project->contact_email = $client->primary_contact_email;
				} else {
						$project->contact_name = $r->get("contact_name");
						$project->contact_phone = $r->get("contact_phone");
						$project->contact_email = $r->get("contact_email");
				}
				$project->shoot_start_date = $r->get("shoot_start_date");
				$project->shoot_location = $r->get("shoot_location");
				$project->author = $r->get("author");
				$project->internal_description = $r->get("internal_description");
				$project->external_description = $r->get("external_description");
				$project->notes = $r->get("notes");
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
				$doomed = new Dase_DBO_ProjectStaff($this->db);
				$doomed->project_id = $project_id;
				foreach ($doomed->findAll(1) as $d) {
						$d->delete();
				}
				foreach ($r->get('staff',1) as $staff_id) {
						$ps = new Dase_DBO_ProjectStaff($this->db);
						$ps->project_id = $project->id;
						$ps->user_id = $staff_id;
						$ps->insert();
				}
				$r->renderRedirect('project/'.$project->id);
		}

}

