<?php

/**
 *	Author:		Ryan Cotter
 *	Date:		<+$DATE$+>
 *	Module:		<+#MODULE_TITLE#+>
 *	Project:	<+#PROJECT_TITLE#+>
 *	File Name:	<+$FILENAME$+>
 *
 */

class <+$BASENAME$+> extends <+#SS_CLASS#+> {


	/**
	 *	1. DataBase Definitions
	 */

	private static $db = array(

	);

	private static $has_one = array(

	);

	private static $singular_name = "<+$BASENAME$+>";

	/**
	 *	2. CMS Field & Function Definitions
	 */

	public function getCMSFields() {
		$fields = parent::getCMSFields();

		return $fields;
	}

	/**
	 *	3. Getters & Setters
	 */

	/**
	 *	4. Output Formatting
	 */

	/**
	 *	5. Processing Methods
	 */


}

class <+$BASENAME$+>_Controller extends <+#SS_CLASS#+>_Controller {

}

