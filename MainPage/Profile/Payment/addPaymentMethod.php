<?php
	// Do action for Finish
	// add payment method info to its correct payment method. Show alert confirming payment and successful creation of new job and go back to review jobs posted.
	
	
	// Do action for Cancel
	// delete job just posted because payment was not succesfull, go back to postNewJob.
     if($_POST){
        $PaymentMethod=$_POST['PaymentMethod'];
     }
?>