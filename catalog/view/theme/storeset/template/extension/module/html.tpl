

<?php 

	if(preg_match("|banner|", $html)) {
	    echo $html;
	} else {
		
		if($position == "column_left" OR $position == "column_right") { 
		
	    echo '
	            <div class="box">
	                '.$html.'
	            </div>';
	          
	          
	          
	    } else {
		   echo '
	            <div class="box-main">
	                '.$html.'
	            </div>'; 
		}      
	}
		
	
?>
