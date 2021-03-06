<?php

require_once 'Dase/DBO.php';

/*
 * DO NOT EDIT THIS FILE
 * it is auto-generated by the
 * script 'bin/class_gen.php
 * 
 */

class Dase_DBO_Autogen_Client extends Dase_DBO 
{
	public function __construct($db,$assoc = false) 
	{
		parent::__construct($db,'client', array('name','created','created_by','primary_contact_name','primary_contact_email','primary_contact_phone'));
		if ($assoc) {
			foreach ( $assoc as $key => $value) {
				$this->$key = $value;
			}
		}
	}
}