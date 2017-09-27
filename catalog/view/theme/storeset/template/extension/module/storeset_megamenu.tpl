<?php 
function showSubmenu($category) {
	if (count($category['children']) > 0) {
		echo '<div class="sub_menu"><ul>';
		foreach ($category['children'] as $cat) {
			echo '<li><a href="'.$cat['href'].'">'.$cat['name'].'</a>';
			showSubmenu($cat);
			echo '</li>';
		}
		echo '</ul></div>';
	}
}

?>
<div id="storeset_menu">
  <ul class="main-ul">
  <?php foreach ($data as $menu) { 
   
    ?>
	<li class="main-ul"><a href="<?php echo $menu['href']; ?>"><?php echo $menu['title'] ?></a>
		<?php if (count($menu['options']) > 0) { ?>
		<div class="dropdown">
			<?php foreach ($menu['options'] as $option) { ?>
			<div style="float: left" class="<?php if ($option['type'] == 'category') {echo "option-cat";} elseif(count($menu['options']) == 1) {echo "full-option";}else {echo "option";} ?> ">
				<!-- bradnlist -->
				<?php if ($option['type'] == 'manufacturer') { ?>
                <h3 class="main-color2-text"><?php echo $menu_manufact; ?></h3>
					<?php for ($i = 0; $i < count($option['manufacturers']);) { ?><ul class="column manufacturer">
						  <?php $j = $i + ceil(count($option['manufacturers']) / $option['column']); ?>
						  <?php for (; $i < $j; $i++) { ?>
							  <?php if (isset($option['manufacturers'][$i])) { ?>
								<li><a href="<?php echo $option['manufacturers'][$i]['href']; ?>">
									<?php if ($option['show_image']) { ?><img src="<?php echo $option['manufacturers'][$i]['image']; ?>" alt="<?php echo $option['manufacturers'][$i]['name']; ?>" title="<?php echo $option['manufacturers'][$i]['name']; ?>"/><?php } ?>
									<?php if ($option['show_name']) { ?><?php echo $option['manufacturers'][$i]['name']; ?><?php } ?>
								</a></li>
							  <?php } ?>
						  <?php } ?>
						</ul><?php } ?>
				<?php } ?>
				<!-- catlist -->
				<?php if ($option['type'] == 'category') { ?>
					<?php if ($option['show_parent']) { ?>
						<a href="<?php echo $option['parent']['href']; ?>">
							<?php if ($option['show_image'] && $option['parent']['image']) { ?><img src="<?php echo $option['parent']['image']; ?>" alt="<?php echo $option['parent']['name']; ?>" title="<?php echo $option['parent']['name']; ?>"/><?php } ?>
						<b><?php echo $option['parent']['name']; ?></b>
						</a>
					<?php } ?>
					<?php for ($i = 0; $i < count($option['categories']);) { ?>
						<ul class="column category">
						  <?php $j = $i + ceil(count($option['categories']) / $option['column']); ?>
						  <?php for (; $i < $j; $i++) { ?>
							  <?php if (isset($option['categories'][$i])) { ?>
								<li><a href="<?php echo $option['categories'][$i]['href']; ?>">
									<?php if ($option['show_image'] && $option['categories'][$i]['image']) { ?><img src="<?php echo $option['categories'][$i]['image']; ?>" alt="<?php echo $option['categories'][$i]['name']; ?>"/><?php } ?>
									<?php echo $option['categories'][$i]['name']; ?>
								</a>
								<?php if ($option['show_submenu']) { showSubmenu($option['categories'][$i]); } ?>
								</li>
							  <?php } ?>
						  <?php } ?>
						</ul>
					<?php } ?>
				<?php } ?>
				<!-- infolist -->
				<?php if ($option['type'] == 'information') { ?>
					<?php for ($i = 0; $i < count($option['informations']);) { ?>
						<ul class="column information">
						  <?php $j = $i + ceil(count($option['informations']) / $option['column']); ?>
						  <?php for (; $i < $j; $i++) { ?>
							  <?php if (isset($option['informations'][$i])) { ?>
								<li><a href="<?php echo $option['informations'][$i]['href']; ?>"><?php echo $option['informations'][$i]['title']; ?></a></li>
							  <?php } ?>
						  <?php } ?>
						</ul>
					<?php } ?>
				<?php } ?>
				<!-- statlist -->
				<?php if ($option['type'] == 'static_block') { ?>
					<div class="staticblock"><?php echo $option['description']; ?></div>
				<?php } ?>
				<!-- productlist -->
				<?php if ($option['type'] == 'product') { ?>
                
                <h3 class="main-color2-text"><?php echo $menu_recomend; ?></h3>
					<?php for ($i = 0; $i < count($option['products']);) { ?><ul style="display: table-cell; " class="column product">
						  <?php $j = $i + ceil(count($option['products']) / $option['column']); ?>
						  <?php for (; $i < $j; $i++) { ?>
							  <?php if (isset($option['products'][$i])) { ?>
								<li>
									<?php if ($option['products'][$i]['thumb']) { ?><a href="<?php echo $option['products'][$i]['href']; ?>"><center><img src="<?php echo $option['products'][$i]['thumb']; ?>" alt="<?php echo $option['products'][$i]['name']; ?>" title="<?php echo $option['products'][$i]['name']; ?>"/></center></a><?php } ?>
									<a class="hidelenght" href="<?php echo $option['products'][$i]['href']; ?>"><?php echo $option['products'][$i]['name']; ?></a>
									<?php if (!$option['products'][$i]['special']) { ?>
										<span class="price main-color2-text"><?php echo $option['products'][$i]['price']; ?></span>
									<?php } else { ?>
										<span class="price-old"><?php echo $option['products'][$i]['price']; ?></span><br /> <span class="price-new main-color2-text"><?php echo $option['products'][$i]['special']; ?></span>
									<?php } ?>
								</li>
							  <?php } ?>
						  <?php } ?></ul>
					<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	</li>
  <?php } ?>
  </ul>
</div>