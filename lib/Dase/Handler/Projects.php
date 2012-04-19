<?php

class Dase_Handler_Projects extends Dase_Handler
{
		public $resource_map = array(
				'/' => 'projects',
		);

		protected function setup($r)
		{
				$this->user = $r->getUser();
		}

		public function getProjects($r) 
		{
				$t = new Dase_Template($r);
				$t->assign('projects',Dase_DBO_Project::getList($this->db));
				$r->renderResponse($t->fetch('projects.tpl'));
		}

}

