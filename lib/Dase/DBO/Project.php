<?php

require_once 'Dase/DBO/Autogen/Project.php';

class Dase_DBO_Project extends Dase_DBO_Autogen_Project 
{
		public $collection;
		public $client;
		public $participants = array();
		public $staff = array();

		/*
		public static function getList($db)
		{
				$list = array();
				$dbh = $db->getDbh();
				$sql = "
						SELECT project.id,  project.title, project.project_identifier, project.subtitle,
						project.shoot_start_date, collection.name as collection, client.name as client
						FROM project, collection, client
						WHERE project.collection_id = collection.id
						AND project.client_id = client.id
						ORDER BY project.shoot_start_date DESC
						";
				$dbh = $db->getDbh();
				$sth = $dbh->prepare($sql);
				if (! $sth) {
						$errs = $dbh->errorInfo();
						if (isset($errs[2])) {
								print_r($errs); exit;
						}
				}
				$sth->execute();
				while ($row = $sth->fetch()) {
						$p = new Dase_DBO_Project($db);
						foreach ($row as $k => $v) {
								$p->$k = $v;
						}
						$list[] = $p;
				}
				return $list;
		}
		 */

		public static function getList($db)
		{
				//needs optimizing, but above SQL is no good
				//as project may not have client and coll

				$list = array();
				$ps = new Dase_DBO_Project($db);
				$ps->orderBy('shoot_start_date DESC');
				foreach ($ps->findAll(1) as $p) {
						$p->getCollection();
						$p->getClient();
						$list[] = $p;
				}
				return $list;
		}

		public function getCollection()
		{
				$c = new Dase_DBO_Collection($this->db);
				$c->load($this->collection_id);
				$this->collection = $c;
				return $c;
		}

		public function getClient()
		{
				$c = new Dase_DBO_Client($this->db);
				$c->load($this->client_id);
				$this->client = $c;
				return $c;
		}

		public function getParticipants()
		{
				$p = new Dase_DBO_Participant($this->db);
				$p->project_id = $this->id;
				$this->participants = $p->findAll(1);
				return $this->participants;
		}

		public function getStaff()
		{
				$pss = new Dase_DBO_ProjectStaff($this->db);
				$pss->project_id = $this->id;
				foreach ($pss->findAll(1) as $ps) {
						$staff = new Dase_DBO_User($this->db);
						$staff->load($ps->user_id);
						$this->staff[] = $staff;
				}
				return $this->staff;
		}
}
