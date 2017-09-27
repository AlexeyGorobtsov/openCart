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

      <h2><i class="fa fa-certificate"></i><?php echo $heading_title; ?></h2>

      <p><?php echo $text_description; ?></p>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">

        <div class="form-group required">

          <label class="col-sm-3 control-label" for="input-to-name"><?php echo $entry_to_name; ?></label>

          <div class="col-sm-9">

            <input type="text" name="to_name" value="<?php echo $to_name; ?>" id="input-to-name" class="form-control" />

            <?php if ($error_to_name) { ?>

            <div class="text-danger"><?php echo $error_to_name; ?></div>

            <?php } ?>

          </div>

        </div>

        <div class="form-group required">

          <label class="col-sm-3 control-label" for="input-to-email"><?php echo $entry_to_email; ?></label>

          <div class="col-sm-9">

            <input type="text" name="to_email" value="<?php echo $to_email; ?>" id="input-to-email" class="form-control" />

            <?php if ($error_to_email) { ?>

            <div class="text-danger"><?php echo $error_to_email; ?></div>

            <?php } ?>

          </div>

        </div>

        <div class="form-group required">

          <label class="col-sm-3 control-label" for="input-from-name"><?php echo $entry_from_name; ?></label>

          <div class="col-sm-9">

            <input type="text" name="from_name" value="<?php echo $from_name; ?>" id="input-from-name" class="form-control" />

            <?php if ($error_from_name) { ?>

            <div class="text-danger"><?php echo $error_from_name; ?></div>

            <?php } ?>

          </div>

        </div>

        <div class="form-group required">

          <label class="col-sm-3 control-label" for="input-from-email"><?php echo $entry_from_email; ?></label>

          <div class="col-sm-9">

            <input type="text" name="from_email" value="<?php echo $from_email; ?>" id="input-from-email" class="form-control" />

            <?php if ($error_from_email) { ?>

            <div class="text-danger"><?php echo $error_from_email; ?></div>

            <?php } ?>

          </div>

        </div>

        <div class="form-group required">

          <label class="col-sm-3 control-label"><?php echo $entry_theme; ?></label>

          <div class="col-sm-9">

            <?php foreach ($voucher_themes as $voucher_theme) { ?>

            <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>

            <div class="radio">

              <label>

                <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />

                <?php echo $voucher_theme['name']; ?></label>

            </div>

            <?php } else { ?>

            <div class="radio">

              <label>

                <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" />

                <?php echo $voucher_theme['name']; ?></label>

            </div>

            <?php } ?>

            <?php } ?>

            <?php if ($error_theme) { ?>

            <div class="text-danger"><?php echo $error_theme; ?></div>

            <?php } ?>

          </div>

        </div>

        <div class="form-group">

          <label class="col-sm-3 control-label" for="input-message"><span data-toggle="tooltip" title="<?php echo $help_message; ?>"><?php echo $entry_message; ?></span></label>

          <div class="col-sm-9">

            <textarea name="message" cols="40" rows="5" id="input-message" class="form-control"><?php echo $message; ?></textarea>

          </div>

        </div>

        <div class="form-group">

          <label class="col-sm-3 control-label" for="input-amount"><span data-toggle="tooltip" title="<?php echo $help_amount; ?>"><?php echo $entry_amount; ?></span></label>

          <div class="col-sm-9">

            <input type="text" name="amount" value="<?php echo $amount; ?>" id="input-amount" class="form-control" size="5" />

            <?php if ($error_amount) { ?>

            <div class="text-danger"><?php echo $error_amount; ?></div>

            <?php } ?>

          </div>

        </div>
        <?php if ($text_terms) { ?>
          <div class="form-group required">
            <label class="col-sm-3"></label>
            <div class="col-sm-9 text-left">
              <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width:auto;height:auto;display:inline-block;margin: 0;" <?php if ($terms) { ?>checked="checked"<?php } ?>/>
              <?php if ($error_terms) { ?>
              <div class="text-danger"><?php echo $error_terms; ?></div>
              <?php } ?>
            </div>
          </div>
        <?php } ?>
        <div class="buttons clearfix">

          <div> <div class="reg-text"><?php echo $text_agree; ?>

            <?php if ($agree) { ?>

            <input type="checkbox" name="agree" value="1" checked="checked" /></div>

            <?php } else { ?>

            <input type="checkbox" name="agree" value="1" /></div>

            <?php } ?>

            &nbsp;

            <input type="submit" value="<?php echo $button_continue; ?>" class="button" />

          </div>

        </div>

      </form>

      </article>

      <div class="clearfix"></div>

  </div></div>

      <?php echo $content_bottom; ?>

<?php echo $footer; ?>