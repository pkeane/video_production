<?php

class Dase_Handler_Client extends Dase_Handler
{
		public $resource_map = array(
				'list' => 'list',
				'form' => 'form',
				'{id}' => 'client',
				'{id}/edit' => 'edit_form',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function getList($r) 
		{
				$t = new Dase_Template($r);
				$c = new Dase_DBO_Client($this->db);
				$t->assign('clients',$c->findAll(1));
				$r->renderResponse($t->fetch('client_list.tpl'));
		}


		public function getForm($r) 
		{
				$t = new Dase_Template($r);
				$r->renderResponse($t->fetch('client_form.tpl'));
		}

		public function postToForm($r) 
		{
				$cl = new Dase_DBO_Client($this->db);
				$cl->name = $r->get('name');
				$cl->primary_contact_name = $r->get('primary_contact_name');
				$cl->primary_contact_email = $r->get('primary_contact_email');
				$cl->primary_contact_phone = $r->get('primary_contact_phone');
				$cl->created = date(DATE_ATOM);
				$cl->created_by = $this->user->eid;
				if ($cl->name) {
						$cl->insert();
				}
				$r->renderRedirect('client/list');
		}

		public function getEditForm($r) 
		{
				$c = new Dase_DBO_Client($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('client/list');
				}
				$t = new Dase_Template($r);
				$t->assign('client',$c);
				$r->renderResponse($t->fetch('client_edit.tpl'));
		}

		public function deleteClient($r) 
		{
				$c = new Dase_DBO_Client($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('client/list');
				}
				if ($c->delete()) {
						$r->renderResponse('deleted client');
				}
		}

		public function postToEditForm($r) 
		{
				$c = new Dase_DBO_Client($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('client/list');
				}
				$c->name = $r->get('name');
				$c->primary_contact_name = $r->get('primary_contact_name');
				$c->primary_contact_email = $r->get('primary_contact_email');
				$c->primary_contact_phone = $r->get('primary_contact_phone');
				if ($c->name) {
						$c->update();
				}
				$r->renderRedirect('client/list');

		}

}

