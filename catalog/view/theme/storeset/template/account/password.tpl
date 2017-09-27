<?php echo $header; ?><?php echo $content_top; ?>
<div id="container">
  <div class="row">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
  </div>
  <div class="content">
	  <article id="content" class="account-content">
      <h1><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><i class="fa fa-lock"></i><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-9">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-9">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div><a href="<?php echo $back; ?>" class="button-back"><?php echo $button_back; ?></a></div>
          <div>
            <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
          </div>
        </div>
      </form>
      </article>
      </div>
      <div class="clearfix"></div>
</div>
      <?php echo $content_bottom; ?>
<?php echo $footer; ?>