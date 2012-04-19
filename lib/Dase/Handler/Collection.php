<?php

class Dase_Handler_Collection extends Dase_Handler
{
		public $resource_map = array(
				'list' => 'list',
				'form' => 'form',
				'{id}' => 'collection',
				'{id}/edit' => 'edit_form',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function getList($r) 
		{
				$t = new Dase_Template($r);
				$c = new Dase_DBO_Collection($this->db);
				$t->assign('collections',$c->findAll(1));
				$r->renderResponse($t->fetch('collection_list.tpl'));
		}

		public function deleteCollection($r) 
		{
				$c = new Dase_DBO_Collection($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('collection/list');
				}
				if ($c->delete()) {
						$r->renderResponse('deleted collection');
				}
		}

		public function getEditForm($r) 
		{
				$c = new Dase_DBO_Collection($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('collection/list');
				}
				$t = new Dase_Template($r);
				$t->assign('collection',$c);
				$r->renderResponse($t->fetch('collection_edit.tpl'));
		}

		public function postToEditForm($r) 
		{
				$c = new Dase_DBO_Collection($this->db);
				if (!$c->load($r->get('id'))) {
						$r->renderRedirect('collection/list');
				}
				$c->name = $r->get('name');
				$c->short_name = $r->get('short_name');
				if ($c->name) {
						$c->update();
				}
				$r->renderRedirect('collection/list');

		}

		public function getForm($r) 
		{
				$t = new Dase_Template($r);
				$r->renderResponse($t->fetch('collection_form.tpl'));
		}

		public function postToForm($r) 
		{
				$c = new Dase_DBO_Collection($this->db);
				$c->name = $r->get('name');
				$c->short_name = $r->get('short_name');
				$c->created = date(DATE_ATOM);
				$c->created_by = $this->user->eid;
				if ($c->name) {
						$c->insert();
				}
				$r->renderRedirect('collection/list');
		}

}

