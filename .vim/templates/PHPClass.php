<?php

/**
 *	Author:		Ryan Cotter
 *	Date:		<+$DATE$+>
 *	Module:		<+#MODULE_TITLE#+>
 *	Project:	<+#PROJECT_TITLE#+>
 *	File Name:	<+$FILENAME$+>
 *
 */

class <+$BASENAME$+> extends Page {

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $singular_name = "<+$BASENAME$+>";

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		return $fields;
	}


}

class <+$BASENAME$+>_Controller extends Page_Controller {

}

