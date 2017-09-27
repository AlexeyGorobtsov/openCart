<?php echo $header; ?><?php echo $content_top; ?>
    <div id="container">
      <div class="row">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
      </div>
      <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
      <?php } ?>
      <div class="content">
	    <article id="content" class="account-content">
		    <h1><?php echo $heading_title; ?></h1>
          <ul class="list-unstyled account-ul">
            <li><a href="<?php echo $edit; ?>"><i class="fa fa-info"></i><span><?php echo $text_edit; ?></span></a></li>
            <li><a href="<?php echo $password; ?>"><i class="fa fa-cogs"></i><span><?php echo $text_password; ?></span></a></li>
            <li><a href="<?php echo $address; ?>"><i class="fa fa-map-marker"></i><span><?php echo $text_address; ?></span></a></li>
            <li><a href="<?php echo $wishlist; ?>"><i class="fa fa-heart-o"></i><span><?php echo $text_wishlist; ?></span></a></li>
          </ul>
          <ul class="list-unstyled account-ul">
            <li><a href="<?php echo $newsletter; ?>"><i class="fa fa-envelope-o"></i><span><?php echo $text_newsletter; ?></span></a></li>
            <li><a href="<?php echo $order; ?>"><i class="fa fa-clock-o"></i><span><?php echo $text_order; ?></span></a></li>
            <li><a href="<?php echo $download; ?>"><i class="fa fa-download"></i><span><?php echo $text_download; ?></span></a></li>
            <li><a href="<?php echo $reward; ?>"><i class="fa fa-star-o"></i><span><?php echo $text_reward; ?></span></a></li>
          </ul>
          <ul class="list-unstyled account-ul last-account-ul">
            <li><a href="<?php echo $return; ?>"><i class="fa fa-reply"></i><span><?php echo $text_return; ?></span></a></li>
            <li><a href="<?php echo $transaction; ?>"><i class="fa fa-usd"></i><span><?php echo $text_transaction; ?></span></a></li>
            <li><a href="<?php echo $recurring; ?>"><i class="fa fa-money"></i><span><?php echo $text_recurring; ?></span></a></li>
            <li><a href="index.php?route=account/logout"><i class="fa fa-power-off"></i><span>Выйти \ Log Out</span></a></li>
          </ul>
          
           <Br /><Br />
		   <ul>
		  
		  </ul>
          </div>
        </article>
        <div class="clearfix"></div>
    </div><?php echo $content_bottom; ?>
<?php echo $footer; ?>