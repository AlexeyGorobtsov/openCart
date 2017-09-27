<?php echo $header; ?>
	<div class="content row"><?php echo $column_left; ?><?php echo $column_right; ?>
	    <?php if ($column_left && $column_right) { ?>
	    <?php $class = 'col-sm-6'; ?>
	    <?php } elseif ($column_left || $column_right) { ?>
	    <?php $class = 'col-sm-9'; ?>
	    <?php } else { ?>
	    <?php $class = 'col-sm-12'; ?>
	    <?php } ?>
	    <article id="content" class="<?php echo $class; ?>">
		    <?php echo $content_top; ?>
			<?php echo $content_bottom; ?>
		</article>
   	</div>
   	<?php if ($column_left && $column_right) { ?>
		<script>
			    var portraitWidth = $(window).width();
			    console.log(portraitWidth);
			    if (portraitWidth <= '992'){
				    $("#content").removeClass("col-sm-9");
			        $("#content").addClass("col-sm-12");
			    }
			    
			    window.addEventListener("resize", function() {
			    	var portraitWidth = $(window).width();
			        
			        if (portraitWidth <= '1024' && portraitWidth > '768'){
			            $("#content").removeClass("col-sm-12");
			            $("#content").addClass("col-sm-9");
			        } else if (portraitWidth <= '768'){
			            $("#content").removeClass("col-sm-9");
			            $("#content").addClass("col-sm-12");
			        }
				
			    }, false);
		</script>
<?php } ?>
<?php echo $footer; ?>