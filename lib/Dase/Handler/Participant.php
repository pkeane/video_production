<?php

class Dase_Handler_Participant extends Dase_Handler
{
		public $resource_map = array(
				'list' => 'list',
				'form' => 'form',
				'{id}' => 'participant',
				'{id}/edit' => 'edit_form',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function getList($r) 
		{
				$t = new Dase_Template($r);
				$projects = new Dase_DBO_Project($this->db);
				$project_list = $projects->findAll(1);
				$ps = new Dase_DBO_Participant($this->db);
				$participants = array();
				foreach ($ps->findAll(1) as $part) {
						$part->project = $project_list[$part->project_id];
						$participants[] = $part;
				}
				$t->assign('participants',$participants);
				$r->renderResponse($t->fetch('participant_list.tpl'));
		}

		public function deleteParticipant($r) 
		{
				$c = new Dase_DBO_Participant($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('participant/list');
				}
				if ($c->delete()) {
						$r->renderResponse('deleted participant');
				}
		}

		public function postToEditForm($r) 
		{
				$p = new Dase_DBO_Participant($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('participant/list');
				}
				$p->name = $r->get('name');
				$p->title = $r->get('title');
				$p->email = $r->get('email');
				$p->phone = $r->get('phone');
				if ($p->name) {
						$p->update();
				}
				$r->renderRedirect('participant/list');

		}

}

