<?php echo $header; ?>
<?php echo $content_top; ?>
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
    <article id="content" class="<?php echo $class; ?> reviews-content">
      <h2 class="reviewspage-header"><?php echo $heading_title; ?></h2>
      <div class="store-rating">
        <?php echo $text_store_rating; ?>
      </div>
      <br/>
      <div class="form-group required">
        <div class="well well-sm">
          <div class="text-left">
            <a class="btn btn-primary" id="write-review"><i class="fa fa-comment-o" aria-hidden="true"></i> <?php echo $button_write_review; ?></a>
          </div>            
          <div class="row" id="review-block" style="display:none;">
            <div class="col-md-12">
              <form class="form-review form-horizontal" id="form-review">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="author" value="" id="input-author" class="form-control">
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-review"><?php echo $entry_review; ?></label>
                  <div class="col-sm-10">
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <?php if ($text_terms) { ?>
                  <div class="form-group required">
                    <label class="col-sm-2"></label>
                    <div class="col-sm-10">
                      <?php echo $text_terms; ?> <input type="checkbox" name="terms" value="1" style="width: auto;" />
                    </div>
                  </div>
                <?php } ?>
                <?php if ($subjects) { ?>
                <?php foreach ($subjects as $subject) { ?>
                <div class="form-group required">
                  <label class="col-sm-2 control-label"><?php echo $subject['name']; ?></label>
                  <div class="col-sm-10">
                    <div class="review-rating" id="block-rev-<?php echo $subject['oct_sreview_subject_id']; ?>">
                      <input id="rating-star-1-<?php echo $subject['oct_sreview_subject_id']; ?>" type="radio" name="rating[<?php echo $subject['oct_sreview_subject_id']; ?>]" value="1" checked><label class="rating-stars rating-star<?php echo $subject['oct_sreview_subject_id']; ?> active" for="rating-star-1-<?php echo $subject['oct_sreview_subject_id']; ?>"><i class="fa fa-star"></i></label>
                      <input id="rating-star-2-<?php echo $subject['oct_sreview_subject_id']; ?>" type="radio" name="rating[<?php echo $subject['oct_sreview_subject_id']; ?>]" value="2"><label class="rating-stars rating-star<?php echo $subject['oct_sreview_subject_id']; ?>" for="rating-star-2-<?php echo $subject['oct_sreview_subject_id']; ?>"><i class="fa fa-star"></i></label>
                      <input id="rating-star-3-<?php echo $subject['oct_sreview_subject_id']; ?>" type="radio" name="rating[<?php echo $subject['oct_sreview_subject_id']; ?>]" value="3"><label class="rating-stars rating-star<?php echo $subject['oct_sreview_subject_id']; ?>" for="rating-star-3-<?php echo $subject['oct_sreview_subject_id']; ?>"><i class="fa fa-star"></i></label>
                      <input id="rating-star-4-<?php echo $subject['oct_sreview_subject_id']; ?>" type="radio" name="rating[<?php echo $subject['oct_sreview_subject_id']; ?>]" value="4"><label class="rating-stars rating-star<?php echo $subject['oct_sreview_subject_id']; ?>" for="rating-star-4-<?php echo $subject['oct_sreview_subject_id']; ?>"><i class="fa fa-star"></i></label>
                      <input id="rating-star-5-<?php echo $subject['oct_sreview_subject_id']; ?>" type="radio" name="rating[<?php echo $subject['oct_sreview_subject_id']; ?>]" value="5"><label class="rating-stars rating-star<?php echo $subject['oct_sreview_subject_id']; ?>" for="rating-star-5-<?php echo $subject['oct_sreview_subject_id']; ?>"><i class="fa fa-star"></i></label>
                    </div>
                    <script type="text/javascript">
                      $('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').hover(function () {
                        $(this).prevAll('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').addClass('active');
                        $(this).addClass('active');
                      }, function () {
                        $(this).prevAll('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').removeClass('active');
                        $(this).removeClass('active');
                        $('#block-rev-<?php echo $subject['oct_sreview_subject_id']; ?>').find('label').eq(0).addClass('active');
                        $('#block-rev-<?php echo $subject['oct_sreview_subject_id']; ?>').find('radio').eq(0).attr('checked', true);
                      });
                      $('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').click(function(){
                        $('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').each(function(){
                          $(this).removeClass('checked');
                          $(this).prevAll('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').removeClass('checked');
                        });
                        
                        $(this).addClass('checked');
                        $(this).prevAll('.rating-star<?php echo $subject['oct_sreview_subject_id']; ?>').addClass('checked');
                      });
                    </script>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <div class="pull-left text-right">
                 <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-success"><?php echo $button_send_review; ?></button>
                 <a class="btn btn-default" href="#" id="dismiss-write-review" style="display:none; margin-right: 10px;"><?php echo $button_dismiss_write_review; ?></a>

                </div>          
              </form>
            </div>
          </div>
        </div>
      </div>
      <?php if ($reviews) { ?>
      <div class="row sort-reviews-row">
        <div class="col-md-2 text-left">
          <label class="control-label input-sort-reviews" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-4 text-left">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-2 text-left">
          <label class="control-label input-sort-reviews" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-left">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br />
        <?php foreach ($reviews as $review) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="row list-reviews-row">
            <div class="col-sm-6 text-left">
              <b><?php echo $review['author']; ?></b>  <span class="small-date">(<?php echo $text_date_added; ?>
              <?php echo $review['date_added']; ?>)</span>
            </div>
            <div class="col-sm-6 text-right bigrating">
              <div class="avg_rating"><span><?php echo $review['avg_rating']; ?></span></div>
              <?php if ($review['review_subject_array']) { ?>
              	<div class="avg_rating_info">
	              <?php foreach ($review['review_subject_array'] as $review_subject) { ?>
	              	<b><?php echo $review_subject['name']; ?>:</b> <?php echo $review_subject['rating']."<br />"; ?>
	              <?php } ?>
	            </div>
              <?php } ?>
            </div>
          </div>  
          <div class="well well-sm">
            <?php echo $review['text']; ?>
          </div>
        </div>
        <?php } ?>
        <div class="clearfix"></div>
      <div class="row rev-pagination">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$reviews) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
    </article>
    </div>
<div class="clearfix"></div>
    </div>
      <?php echo $content_bottom; ?>
<style type="text/css">
.review-rating {
  font-size: 0;
  color: #ccc;
  display: inline-block;
  vertical-align: middle;
}
.review-rating input {
  display: none;  
}
.review-rating * {
  margin: 0 1px 0 0;
}
.review-rating label .fa {
  font-size: 20px;
  padding: 2px 4px 2px 0px;
  cursor: pointer;
}
.rating-stars.active {
  color: #fccf06!important;
}
.rating-stars.checked {
  color: #fccf06;
}
</style>
<script type="text/javascript"><!--
$('#button-review').on('click', function() {
  $.ajax({
    url: 'index.php?route=octemplates/sreview_reviews/write',
    type: 'post',
    dataType: 'json',
    data: $("#form-review input[type=\'radio\']:checked, #form-review input[type=\'checkbox\']:checked, #form-review input[type=\'text\'], #form-review textarea"),
    beforeSend: function() {
      $('#button-review').button('loading');
    },
    complete: function() {
      $('#button-review').button('reset');
    },
    success: function(json) {
      $('.alert-success, .alert-danger').remove();

      if (json['error']) {
        $('#review-block form').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
      }

      if (json['success']) {
        $('#review-block form').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

        $('#form-review input[name=\'author\']').val('');
        $('#form-review textarea[name=\'text\']').val('');
        $('#form-review input[name=\'terms\']').removeAttr('checked');
        $('.review-rating').find('input[type=\'radio\']').attr('checked', false);
        $('.review-rating').find('label').removeClass('checked');
      }
    }
  });
});

$('#write-review').click(function(e) {
  $('#review-block').slideDown(400);
  $('#write-review').fadeOut(100);
  $('#dismiss-write-review').show();
});

$('#dismiss-write-review').click(function(e) {
  e.preventDefault();
  $('#review-block').slideUp(300, function() {
    $('#write-review').fadeIn(200);
  });
  $('#dismiss-write-review').hide();
});
//--></script>
<?php echo $footer; ?>
