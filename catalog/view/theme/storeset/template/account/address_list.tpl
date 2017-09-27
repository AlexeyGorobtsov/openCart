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
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="content">
	  <article id="content" class="account-content">
      <h2><i class="fa fa-map-marker"></i><?php echo $text_address_book; ?></h2>
      <?php if ($addresses) { ?>
      <div class="table-div">
      <table class="table table-bordered table-hover">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?><a href="<?php echo $result['update']; ?>" class="button-back"><?php echo $button_edit; ?></a> </td>
          <td class="text-right"><a href="<?php echo $result['delete']; ?>" class="button-back no-mt"><?php echo $button_delete; ?><i class="fa fa-times"></i></a></td>
        </tr>
        <?php } ?>
      </table>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div><a href="<?php echo $back; ?>" class="button-back"><?php echo $button_back; ?></a></div>
        <div><a href="<?php echo $add; ?>" class="button"><i class="fa fa-plus-circle"></i><?php echo $button_new_address; ?></a></div>
      </div>
      </article>
      </div>
      <div class="clearfix"></div>
    </div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>