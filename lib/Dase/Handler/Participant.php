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
				$ps = new Dase_DBO_Participant($this->db);
				$t->assign('participants',$ps->findAll(1));
				$r->renderResponse($t->fetch('participant_list.tpl'));
		}

		public function getForm($r) 
		{
				$t = new Dase_Template($r);
				$r->renderResponse($t->fetch('participant_form.tpl'));
		}

		public function postToForm($r) 
		{
				$p = new Dase_DBO_Participant($this->db);
				$p->name = $r->get('name');
				$p->title = $r->get('title');
				$p->email = $r->get('email');
				$p->phone = $r->get('phone');
				$p->created = date(DATE_ATOM);
				$p->created_by = $this->user->eid;
				if ($p->name) {
						$p->insert();
				}
				$r->renderRedirect('participant/list');
		}

		public function getEditForm($r) 
		{
				$p = new Dase_DBO_Participant($this->db);
				if (!$p->load($r->get('id'))) {
						$r->renderRedirect('participant/list');
				}
				$t = new Dase_Template($r);
				$t->assign('participant',$p);
				$r->renderResponse($t->fetch('participant_edit.tpl'));
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

