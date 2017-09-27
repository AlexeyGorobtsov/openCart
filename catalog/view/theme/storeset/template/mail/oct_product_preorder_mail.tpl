<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body style="font-size: 12px; line-height:18px; font-family: Arial, sans-serif; background: rgba(151, 157, 173, 0.14);">
<div style="max-width: 1000px; margin: 3px auto;">
	<div style="height: 30px;">
		&nbsp;
	</div>
	<div style="font-size: 14px; line-height: 24px; margin: 20px; color: #222;">
		<p style="text-align: center;">
		<a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
	 </div>
	<main style="background: #fff; position: relative; box-shadow: 0 0 13px 0 rgba(0, 0, 0, .4);">
		<div class="order-details">
		   <div style="    border-bottom: 1px dashed #e5e5e5; padding: 20px; background: #636792; color: #fff; font-size: 16px;">
		      <div class="order-wrap">
		         <time style="font-size: 11px;  color: rgba(208, 208, 208, 0.96);">
		        <?php echo $date_added; ?>
		         </time>
		         <div style="float: right; font-size: 24px;"><span class="xhr"><?php echo $text_info; ?></span></div> 
		      </div>
		   </div>
		      <div style="border-bottom: 1px dashed #e5e5e5; padding: 20px; color: #222;">
		         <table style="font-size: 14px; line-height: 22px;">
		            <tbody>
			            <?php foreach ($data_info as $info) { ?>
		               <tr style="border-bottom: 1px solid #ecedf3;">
		                  <td style="padding: 5px 8px 5px 2px;"><?php echo $info['name']; ?></td>
		                  <td style="padding: 5px 8px 5px 2px;">
		                     <?php echo $info['value']; ?>
		                  </td>
		               </tr>
		                <?php } ?>
		             	</tbody>
		         </table>
		      </div>
			</div>
	</main>
</div>
<br /><br />
</body>
</html>
