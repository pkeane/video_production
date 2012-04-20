<?php

require_once 'Dase/DBO/Autogen/Participant.php';

class Dase_DBO_Participant extends Dase_DBO_Autogen_Participant 
{
		public $project;

		public function getProject()
		{
				$p = new Dase_DBO_Project($this->db);
				if ( $p->load($this->project_id)) { 
						$this->project = $p;
				}
				return $this->project;
		}
}
