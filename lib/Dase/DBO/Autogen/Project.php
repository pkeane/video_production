<?php

require_once 'Dase/DBO.php';

/*
 * DO NOT EDIT THIS FILE
 * it is auto-generated by the
 * script 'bin/class_gen.php
 * 
 */

class Dase_DBO_Autogen_Project extends Dase_DBO 
{
	public function __construct($db,$assoc = false) 
	{
		parent::__construct($db,'project', array('title','project_identifier','idt_account','subtitle','collection_id','client_id','contact_name','contact_phone','contact_email','shoot_start_date','shoot_location','author','internal_description','external_description','notes','rights','path_to_av_server_files','path_to_media_server_files','destination','created','created_by','itunes_u_category','can_reuse_videos','client_provides_storage','can_delete_raw_when_complete'));
		if ($assoc) {
			foreach ( $assoc as $key => $value) {
				$this->$key = $value;
			}
		}
	}
}