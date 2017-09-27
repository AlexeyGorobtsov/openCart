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
      <h2><i class="fa fa-map-marker"></i><?php echo $heading_title; ?></h1>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group">
            <label class="col-sm-6 control-label newsletter-label"><?php echo $entry_newsletter; ?></label>
            <div class="col-sm-6 newsletter-div">
              <?php if ($newsletter) { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" checked="checked" />
                <?php echo $text_yes; ?> </label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" />
                <?php echo $text_no; ?></label>
              <?php } else { ?>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="1" />
                <?php echo $text_yes; ?> </label>
              <label class="radio-inline">
                <input type="radio" name="newsletter" value="0" checked="checked" />
                <?php echo $text_no; ?></label>
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