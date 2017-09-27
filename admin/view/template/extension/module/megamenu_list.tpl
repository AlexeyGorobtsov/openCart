<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">

  <div class="page-header">

    <div class="container-fluid">

	  <div class="pull-right">



	  <button type="button" onclick="$('#form-megamenu_status').submit();" form="form-megamenu" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>

    <a href="<?php echo $refresh; ?>" data-toggle="tooltip" class="btn btn-primary"><i class="fa fa-refresh"></i></a>   

	  <a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>

        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-megamenu').submit() : false;"><i class="fa fa-trash-o"></i></button>



		 <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>



      </div>

      <h1><?php echo $heading_title; ?></h1>

      <ul class="breadcrumb">

        <?php foreach ($breadcrumbs as $breadcrumb) { ?>

        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>

        <?php } ?>

      </ul>

    </div>

  </div>

  <div class="container-fluid">

    <?php if ($error) { ?>

    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>

      <button type="button" class="close" data-dismiss="alert">&times;</button>

    </div>

    <?php } ?>

    <?php if ($success) { ?>

    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>

      <button type="button" class="close" data-dismiss="alert">&times;</button>

    </div>

    <?php } ?>

    <div class="panel panel-default">

      <div class="panel-heading">

        <h3 class="panel-title"><i class="fa fa-bars"></i> <?php echo $text_list; ?></h3>

      </div>

      <div class="panel-body">

	    <form name="form-megamenu_status" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-megamenu_status" class="form-horizontal">

          <div class="form-group">

            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>

            <div class="col-sm-10">

              <select name="megamenu_status" id="input-status" class="form-control">

                <?php if ($megamenu_status) { ?>

                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>

                <option value="0"><?php echo $text_disabled; ?></option>

                <?php } else { ?>

                <option value="1"><?php echo $text_enabled; ?></option>

                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>

                <?php } ?>

              </select>

            </div>

          </div>

        </form>



        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-megamenu" class="form-horizontal">

          <div class="table-responsive">

            <table class="table table-bordered table-striped table-hover">

			  <thead>

				<tr>

				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="if($(this).prop('checked')) $('input[name*=\'selected\']').prop('checked', true);else $('input[name*=\'selected\']').prop('checked', false);" /></td>

				  <td class="text-left"><?php echo $text_th_title; ?></td>

				  <td class="text-left"><?php echo $text_th_link; ?></td>

				  <td class="text-left"><?php echo $text_th_sort_order; ?></td>

				  <td class="text-right"><?php echo $text_action; ?></td>

				</tr>

			  </thead>

			  <tbody>

				<?php if ($all_items) { ?>

				  <?php foreach ($all_items as $item) { ?>

				  <tr>

					<td width="1" style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $item['id']; ?>" /></td>

					<td class="text-left"><?php echo $item['title']; ?></td>

					<td class="text-left"><?php echo $item['link']; ?></td>

					<td class="text-left"><?php echo $item['sort_order']; ?></td>

					<td class="text-right"><a href="<?php echo $item['edit']; ?>" data-toggle="tooltip" title="<?php echo $text_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>



				  </tr>

				  <?php } ?>

				<?php } else { ?>

				  <tr>

					<td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>

				  </tr>

				<?php } ?>

			  </tbody>

			</table>

          </div>

        </form>



      </div>

    </div>

  </div>

</div>

<?php echo $footer; ?>

