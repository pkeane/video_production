<?php

require_once 'Dase/DBO/Autogen/Project.php';

class Dase_DBO_Project extends Dase_DBO_Autogen_Project 
{
		public $collection;
		public $client;

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
}
