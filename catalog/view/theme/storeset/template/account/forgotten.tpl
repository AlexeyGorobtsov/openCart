<?php echo $header; ?><?php echo $content_top; ?>
    <div id="container">
      <div class="row">
        <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul>
      </div>
      <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
      <?php } ?>
      <div class="content">
        <article id="content" class="account-content">
          <h2><i class="fa fa-lock"></i><?php echo $heading_title; ?></h2>
          <p><?php echo $text_email; ?></p>
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
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
          <div class="clearfix"></div>
    </div></div>
          <?php echo $content_bottom; ?>
<?php echo $footer; ?>