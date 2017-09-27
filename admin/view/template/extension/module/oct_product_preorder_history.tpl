<?php if ($histories) { ?>
  <div class="btn-group">
    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
      <i class="fa fa-trash-o"></i> <?php echo $button_delete_menu; ?> <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
      <li><a onclick="delete_all();"><?php echo $button_delete_all; ?></a></li>
      <li><a onclick="delete_all_selected();"><?php echo $button_delete_selected; ?></a></li>
    </ul>
  </div>
  <br/><br/>
<?php } ?>
<div class="table-responsive">
  <table class="table table-bordered">
    <thead>
      <tr>
        <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
        <td class="text-left" ><?php echo $column_info; ?></td>
        <td class="text-left"><?php echo $column_note; ?></td>
        <td class="text-left"><?php echo $column_date_added; ?></td>
        <td class="text-center" ><?php echo $column_action; ?></td>
      </tr>
    </thead>
    <tbody>
    <?php if ($histories) { ?>
      <?php foreach ($histories as $history) { ?>
      <tr>
        <td style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $history['request_id']; ?>" /></td>
        <td class="text-left">
        <?php if ($history['info']) { ?>
          <?php foreach ($history['info'] as $info) { ?>
            <p><strong><?php echo $info['name']; ?>:</strong> <?php echo $info['value']; ?></p>
          <?php } ?>
        <?php } ?>  
        </td>
        <td class="text-left">
          <textarea name="note" class="form-control" style="margin-bottom:7px;"><?php echo $history['note']; ?></textarea>
          <a onclick="update_note(<?php echo $history['request_id']; ?>, $(this).prev().val());" class="btn btn-primary"><?php echo $button_make_note; ?></a>
        </td>
        <td class="text-left"><?php echo $history['date_added']; ?></td>
        <td class="text-center">
          <a onclick="delete_selected(<?php echo $history['request_id']; ?>);" data-toggle="tooltip" title="" class="btn btn-warning" data-original-title="<?php echo $button_delete; ?>"><i class="fa fa-trash-o"></i></a>
        </td>
      </tr>
      <?php } ?>
      <?php } else { ?>
        <tr>
          <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
</div>
<div class="row">
  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
</div>