<?php echo $header; ?><?php echo $content_top; ?>
<div id="container">
<div class="row">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
  <div class="content"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <article id="content" class="<?php echo $class; ?>">
     
     <div class="col-md-6">
	     
	     <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h3><?php echo $text_contact; ?></h3>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-9">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-9">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-9">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
           <?php if ($text_terms) { ?>
             <div class="form-group required">
               <label class="col-sm-3"></label>
               <div class="col-sm-9">
               <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" <?php if ($terms) { ?>checked="checked"<?php } ?>/>
               <?php if ($error_terms) { ?>
               <div class="text-danger"><?php echo $error_terms; ?></div>
               <?php } ?>
               </div>
             </div>
           <?php } ?>
          <?php if (isset($captcha)) { ?>
		  <div class="form-group">
            <div class="col-sm-12"><?php echo $captcha; ?></div>
          </div>
		    <?php } ?>
		    
          <div class="form-group buttons">
          <div class="col-sm-offset-3 col-sm-9 pull-left">
            <input class="button" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
        </fieldset>
        
      </form>

	     
	 </div>    
	 <div class="col-md-6">
		 <?php if ($storeset_yamap_texts !='') { echo "<div class=\"map-box\">" . $storeset_yamap_texts . "</div>"; } ?>
		  		 
	</div> 
	<div class="clearfix"></div>
	
	<?php if ($storeset_yamaps !='') { 
        echo "<div class=\"map-box\">" . $storeset_yamaps . "</div>";      
     } ?>
	</div>
     
      </article>
          <div class="clearfix">
      </div>
</div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>
