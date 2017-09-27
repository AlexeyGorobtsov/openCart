<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title><?php echo $title; ?></title>
</head>
<body style="font-size: 12px; line-height:18px; font-family: Arial, sans-serif; background: rgba(151, 157, 173, 0.14);">
<div style="max-width: 1000px; margin: 0 auto;">
	<div style="height: 30px;">
		&nbsp;
	</div>
	<div style="font-size: 14px; line-height: 24px; margin: 20px; color: #222;">
		<p style="text-align: center;">
			<a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;" /></a>
		</p>
		<?php echo $text_greeting; ?>
	  <?php if ($customer_id) { ?>
	  <p style="margin-top: 0px; margin-bottom: 10px;"><?php echo $text_link; ?></p>
	  <p style="margin-top: 0px; margin-bottom: 10px;"><a href="<?php echo $link; ?>"><?php echo $link; ?></a></p>
	  <?php } ?>
	  <?php if ($download) { ?>
	  <p style="margin-top: 0px; margin-bottom: 10px;"><?php echo $text_download; ?></p>
	  <p style="margin-top: 0px; margin-bottom: 10px;"><a href="<?php echo $download; ?>"><?php echo $download; ?></a></p>
	  <?php } ?>
   <?php if ($comment) { ?>
  <p style="margin-top: 0px; margin-bottom: 10px;"><?php echo $text_instruction; ?></p>
  <p style="margin-top: 0px; margin-bottom: 10px;"><?php echo $comment; ?></p>
  <?php } ?>
	 </div>
	<main style="background: #fff; position: relative; box-shadow: 0 0 13px 0 rgba(0, 0, 0, .4);">
		<div class="order-details">
		   <div style="    border-bottom: 1px dashed #e5e5e5; padding: 20px; background: #636792; color: #fff; font-size: 16px;">
		      <div class="order-wrap">
		         <time style="font-size: 11px;  color: rgba(208, 208, 208, 0.96);">
		        <?php echo $date_added; ?>
		         </time>
		         <div style="float: right; font-size: 24px;"><span class="xhr">#<?php echo $order_id; ?></span></div>
		      </div>
		   </div>
	      <div style="border-bottom: 1px dashed #e5e5e5; padding: 20px; color: #222;">
	         <table style="font-size: 14px; line-height: 22px;">
	            <tbody>
	               <tr style="border-bottom: 1px solid #ecedf3;">
	                  <td style="padding: 5px 8px 5px 2px;"><?php echo $text_payment_method; ?></td>
	                  <td style="padding: 5px 8px 5px 2px;">
	                     <?php echo $payment_method; ?>
	                  </td>
	               </tr>
	               <?php if ($shipping_method) { ?>
	               <tr style="border-bottom: 1px solid #ecedf3;">
	                  <td style="padding: 5px 8px 5px 2px;">
			          	<?php echo $text_shipping_method; ?>
			          </td>
	                  <td style="padding: 5px 8px 5px 2px;">
	                    <?php echo $shipping_method; ?>
	                  </td>
	               </tr>
	               <?php } ?>
	               <tr style="border-bottom: 1px solid #ecedf3;">
	                  <td style="padding: 5px 8px 5px 2px;"><?php echo $text_email; ?></td>
	                  <td style="padding: 5px 8px 5px 2px;">
	                     <?php echo $email; ?>
	                  </td>
	               </tr>
	               <tr style="border-bottom: 1px solid #ecedf3;">
	                  <td style="padding: 5px 8px 5px 2px;"><?php echo $text_telephone; ?></td>
	                  <td style="padding: 5px 8px 5px 2px;">
	                     <?php echo $telephone; ?>
	                  </td>
	               </tr>
	               <tr style="border-bottom: 1px solid #ecedf3;">
	                  <td style="padding: 5px 8px 5px 2px;"><?php echo $text_order_status; ?></td>
	                  <td style="padding: 5px 8px 5px 2px;">
	                     <?php echo $order_status; ?>
	                  </td>
	               </tr>
	            </tbody>
	         </table>
	      </div>
		   <div>
		      <div class="order-goods">
			  <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
				<thead>
				<tr>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: left; padding: 7px; color: #fff;">&nbsp;</td>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: left; padding: 7px; color: #fff;"><?php echo $text_product; ?></td>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: left; padding: 7px; color: #fff;"><?php echo $text_model; ?></td>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_quantity; ?></td>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_price; ?></td>
					<td style="font-size: 12px; border-right: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; background-color: #636792; font-weight: bold; text-align: right; padding: 7px; color: #fff;"><?php echo $text_total; ?></td>
				</tr>
				</thead>
				<tbody>
		            <?php
		             $adres = false;
		         $phone1 = false;
		         $phone2 = false;
		         $clock = false;
		         $storeset_facebook_id =  false;
		         $storeset_vk_id =  false;
		         $storeset_gplus_id =  false;
		         $storeset_odnoklass_id =  false;
		         $storeset_rss_id =  false;
		         $storeset_twitter_id =  false;
		         $storeset_youtube_id =  false;
		            foreach ($products as $product) { ?>
		        
				<tr>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;">
					<div style="float: left; text-align: center; margin-right: 20px;">
						<a href="<?php echo $product['href']; ?>">
						 	<?php if($product['image']) { ?><img src="<?php echo $product['image']; ?>" style="width:65px;"><?php } ?>
						</a>
					</div>
				</td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><a href="<?php echo $product['href']; ?>" style="text-decoration: underlinel"><?php echo $product['name']; ?></a>
				<?php foreach ($product['option'] as $option) { ?>
				<br />
				&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
				<?php } ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $product['model']; ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['quantity']; ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['price']; ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $product['total']; ?></td>
				</tr>
				<?php foreach ($vouchers as $voucher) { ?>
				<tr>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;">1</td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
				<td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
				</tr>
				<?php } ?>
				
		         <?php
		         if($product['adres']) {$adres = $product['adres']."<br />"; }
		         if($product['phone1']) {$phone1 = $product['phone1']." | "; }
		         if($product['phone2']) {$phone2 = $product['phone2']."<br />"; }
		         if($product['clock']) {$clock = $product['clock'][$language_code]; }
		         if($product['storeset_facebook_id']) {$storeset_facebook_id = $product['storeset_facebook_id']."<br />"; }
		         if($product['storeset_vk_id']) {$storeset_vk_id = $product['storeset_vk_id']."<br />"; }
		         if($product['storeset_gplus_id']) {$storeset_gplus_id = $product['storeset_gplus_id']."<br />"; }
		         if($product['storeset_odnoklass_id']) {$storeset_odnoklass_id = $product['storeset_odnoklass_id']."<br />"; }
		         if($product['storeset_rss_id']) {$storeset_rss_id = $product['storeset_rss_id']."<br />"; }
		         if($product['storeset_twitter_id']) {$storeset_twitter_id = $product['storeset_twitter_id']."<br />"; }
		         if($product['storeset_youtube_id']) {$storeset_youtube_id = $product['storeset_youtube_id']."<br />"; }
		         ?>
		           <?php } ?>
				   	</tbody>
				</table>
    		      <?php foreach ($totals as $total) { ?>
		         <div style="border-bottom: 1px dashed #e5e5e5; padding: 20px; text-align: right; font-size: 16px; font-weight: bold;">
		            <div name="bonus_price">
		            </div>
		            <div style="float: left;">
		              <?php echo $total['title']; ?>
		            </div>
		            <div class="order-total-sum"><?php echo $total['text']; ?></div>
		         </div>
		          <?php } ?>
			  	<div style="float: left; width: 50%; padding: 10px 0; border-bottom: 0; color: #222; font-size: 12px; padding: 20px;">
			        <b><?php echo $text_shipping_address; ?></b><br />
				            <?php echo $payment_address; ?>
			      </div>
			      <div style="clear: both; height: 1px;"></div>
		      </div>
		   </div>
		</div>
	</main>
	<?php foreach ($vouchers as $voucher) { ?>
	<table style="border-collapse: collapse; width: 100%; margin: 20px;">
      <tr style="border-bottom: 1px solid #ecedf3;">
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"><?php echo $voucher['description']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: left; padding: 7px;"></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;">1</td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
        <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: right; padding: 7px;"><?php echo $voucher['amount']; ?></td>
      </tr>
    </tbody>
    <tfoot>
    </tfoot>
  </table>
<?php } ?>
	<div style="color: #757575; font-size: 12px; text-align: center; margin: 30px 0;">
		<?php echo $adres; ?>
		<?php echo $phone1; ?>
		<?php echo $phone2; ?>
		<?php echo html_entity_decode($clock, ENT_QUOTES, 'UTF-8'); ?><br />
		<?php echo $storeset_facebook_id; ?>
		<?php echo $storeset_vk_id; ?>
		<?php echo $storeset_gplus_id; ?>
		<?php echo $storeset_odnoklass_id; ?>
		<?php echo $storeset_rss_id; ?>
		<?php echo $storeset_twitter_id; ?>
		<?php echo $storeset_youtube_id; ?>
		<br /><br />
	</div>
</div>
</body>
</html>
