<?php
if(!isset($storeset_status)) {
    exit("<img src='http://storeset2.octemplates.net/scr/hlp.jpg' border='0'>");
}
?>
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=0" />
<meta charset="UTF-8" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<?php if (isset($og_url)) { ?><meta property="og:url" content="<?php echo $og_url; ?>" /><?php } ?>

<?php if (isset($og_image)) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/style.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/owl.carousel.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/addcart.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/login.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/themify-icons.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css" />
<link href="catalog/view/javascript/popup_view/magnific-popup.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/storeset/stylesheet/popup_view/stylesheet.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/responsive.css" />
<?php if ( isset($popup_purchase_data['status']) && $popup_purchase_data['status'] ) { ?>
<link rel="stylesheet" property="stylesheet" media="screen" href="catalog/view/theme/storeset/stylesheet/popup_purchase/stylesheet.css" />
<?php } ?>
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<link rel="stylesheet" property="stylesheet" href="catalog/view/theme/storeset/stylesheet/megamenu.css?v3">
<?php if(VERSION > "2.0.3.1") {
    foreach ($analytics as $analytic) { 
        echo $analytic;
    } 
} else {
    echo $google_analytics;
}   
 ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/theme/storeset/js/bootstrap.js"></script>
<script type="text/javascript" src="catalog/view/theme/storeset/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/storeset/js/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>         
<script type="text/javascript" src="catalog/view/theme/storeset/js/owl.carousel.js"></script> 
<script type="text/javascript" src="catalog/view/theme/storeset/js/uisearch.js"></script> 
<script type="text/javascript" src="catalog/view/theme/storeset/js/classie.js"></script> 
<script type="text/javascript" src="catalog/view/theme/storeset/js/barrating.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/storeset/style/magnify.css" />
<script type="text/javascript" src="catalog/view/theme/storeset/js/jquery.magnify.js"></script>
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic&subset=latin,cyrillic' rel='stylesheet' type='text/css'>              
       
        <?php 
        // If module is enabled
        
        if($storeset_status == "on") {
        
            
        ?>
        <style>
            body {
                <?php if($storeset_backgr_color !='') { ?>
                    background-color: <?php echo $storeset_backgr_color; ?>;
                <?php } 
                    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = $config_url;
            else $path_image = $config_url;
                if($storeset_custom_pattern !='') { ?>
                    background-image: url("/image/<?php echo $storeset_custom_pattern ?>"); 
                } else { ?>
                    background-image: none;
                <?php } ?>
            }
            <?php if($storeset_main1 !='') { ?>
            .main-color1, .testbutton, .button, .item .cart .button-cart, .item .wishlist:hover, .item .compare:hover, .product-grid .product-buttons .cart, .product-grid .product-buttons .compare:hover, .product-list .product-buttons .compare:hover, .product-grid .product-buttons .wishlist:hover, .product-list .product-buttons .wishlist:hover, .btn-primary, .da-arrows span, .da-slide .da-link, .fastorder-panel-default .panel-heading, .slideshow-box .slideshow-plus-link {
                background-color: <?php echo $storeset_main1; ?>!important;
            }  
            <?php } ?>
            <?php if($storeset_main2 !='') { ?>
            .main-color2, .main-color1:hover, .testbutton:hover, .cart-top, .button:hover, .item .cart .button-cart:hover, .item .wishlist, .item .compare, .product-grid .product-buttons .cart:hover, .product-grid .product-buttons .wishlist, .product-list .product-buttons .wishlist, .product-grid .product-buttons .compare, .product-list .product-buttons .compare, .caption .intro-btn a, .search-box-top input[type=submit], .da-arrows span:hover, .da-slide .da-link:hover, ul.account-ul li:hover, .account-content .buttons div .button, .wishlist-tr, .account-content .button, .slideshow-box .slideshow-plus-link:hover  {
                background-color: <?php echo $storeset_main2; ?>!important; 
            }    
            <?php } ?>
            <?php if($storeset_main2 !='') { ?>
            .main-color2-text, .main-color1-text:hover, #sstore_menu > ul > li > div.dropdown a:hover, .error, .success, .search-top .fa-search, ul.account-ul li i, input[type=search]::-webkit-input-placeholder, .account-content form legend i, .account-content .buttons div .button-back, .account-content .table-div table .button-back, .account-content h2 i, #right-block i {
                color: <?php echo $storeset_main2; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_button_text_color !='') { ?>
            .button, .product-grid .product-buttons .cart, .testbutton {
                color: <?php echo $storeset_button_text_color; ?>!important;
            }    
            <?php } ?>
            <?php if($storeset_1_links_color !='') { ?>
            .top-panel a, #sidebar a, .navbar-fixed-bottom ul li a, .sidebar-a, .settings span, .settings i, .settings strong {
                color: <?php echo $storeset_1_links_color; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_1_background !='') { ?>
            .top-panel, #sidebar, .search-box-top, .navbar-fixed-bottom, .sidebar-a .dropdown-menu {
                background: <?php echo $storeset_1_background; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_1_hover !='') { ?>
            .top-panel a:hover, .settings:hover span {
                color: <?php echo $storeset_1_hover; ?>; 
            }    
            <?php } ?>
            .enter:before {
                background: url(/catalog/view/theme/storeset/images/enter.png) no-repeat;
            }
            .register:before {
                background: url(/catalog/view/theme/storeset/images/reg.png) no-repeat;
            }
                       <?php if($storeset_2_phonecolor !='') { ?>
            #phone a, #contacts .contacts-fa {
                color: <?php echo $storeset_2_phonecolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_2_timecolor !='') { ?>
            #shedule {
                color: <?php echo $storeset_2_timecolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_2_backcart !='') { ?>
            #cart {
                background-color: <?php echo $storeset_2_backcart; ?>; 
            }
            #right-block .fa-shopping-bag::before {
                color: <?php echo $storeset_2_backcart; ?>; 
            }     
            <?php } ?>
            <?php if($storeset_2_colorcart !='') { ?>
            #cart #cart-total, #cart a {
                color: <?php echo $storeset_2_colorcart; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_3_backround !='') { ?>
            nav, .sb-icon-search, .sb-search.sb-search-open .sb-icon-search, .no-js .sb-search .sb-icon-search {
                background: <?php echo $storeset_3_backround; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_3_linkcolor !='') { ?>
            nav .main-ul > .main-li > a, nav .main-ul > .main-li > a:visited, #sstore_menu > ul > li > a, #sstore_menu > ul > li > a:visited, ul.mobile-category > li > a:hover, ul.mobile-category > li ul > li:hover > a, #megamenu-menu .nav > li > a  {
                color: <?php echo $storeset_3_linkcolor; ?>; 
            }
            @media only screen and (max-width: 992px) {
                #megamenu-menu .nav > li > div a {
                    color: <?php echo $storeset_3_linkcolor; ?>!important; 
                }
            }    
            <?php } ?>
            <?php if($storeset_3_hover !='') { ?>
            nav .main-ul > .main-li:hover > a, #sstore_menu > ul > li:hover a, #megamenu-menu .nav > li > a:hover  {
                color: <?php echo $storeset_3_hover; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_3_childback !='') { ?>
            .category-dropdown, #sstore_menu > ul > li > div.dropdown, #megamenu-menu .nav > li > div {
                background: <?php echo $storeset_3_childback; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_3_childcolor !='') { ?>
            .category-dropdown > .sub-ul > .sub-li a.sub-category, .category-dropdown > .sub-ul > .sub-li ul li a, #sstore_menu > ul > li > div.dropdown a, #megamenu-menu .nav > li > div a  {
                color: <?php echo $storeset_3_childcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_3_backsearch !='') { ?>
            #search input {
                background: <?php echo $storeset_3_backsearch; ?>; 
            }    
            <?php } ?>
            #search input {
                background-position: 6px 6px;
                background-repeat: no-repeat;
            }
            <?php if($storeset_left_backround !='') { ?>
            .box-heading {
                background: <?php echo $storeset_left_backround; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_fontcolor !='') { ?>
            .box-heading {
                color: <?php echo $storeset_left_fontcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_linkcolor !='') { ?>
            ul.box-category  li a, ul.box-category li a:visited {
                color: <?php echo $storeset_left_linkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_menubg !='') { ?>
            #sstore-3-level > ul > li > a {
                background: <?php echo $storeset_left_menubg; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_menucolsapsebg !='') { ?>
            #sstore-3-level ul ul li a {
                background: <?php echo $storeset_left_menucolsapsebg; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_menulinkcolor !='') { ?>
            #sstore-3-level > ul > li > a {
                color: <?php echo $storeset_left_menulinkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_menulinkcolorhover !='') { ?>
            #sstore-3-level > ul > li > a:hover {
                color: <?php echo $storeset_left_menulinkcolorhover; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_collinkcolor !='') { ?>
            #sstore-3-level ul ul li a {
                color: <?php echo $storeset_left_collinkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_collinkcolorhover !='') { ?>
            #sstore-3-level ul ul li a:hover {
                color: <?php echo $storeset_left_collinkcolorhover; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_left_collinkcoloractive !='') { ?>
            #sstore-3-level ul ul ul li a.current-link {
                color: <?php echo $storeset_left_collinkcoloractive; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_category_oldprice !='') { ?>
            .product-list .price-old, .product-grid .price-old {
                color: <?php echo $storeset_category_oldprice; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_category_newprice !='') { ?>
            .product-list .price-new, .product-grid .price-new, .product-grid .price, .item .price, .swiper-slide .price-new {
                color: <?php echo $storeset_category_newprice; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_category_butcolor !='') { ?>
            .product-list .product-buttons .cart, .product-grid .product-buttons .cart {
                background: url(/catalog/view/theme/storeset/images/to-cart.png) no-repeat 16% 44%, <?php echo $storeset_category_butcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_category_newprice !='') { ?>
            .product-info > .right .price-new {
                color: <?php echo $storeset_category_newprice; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_good_pricecolor !='') { ?>
            .product-info .price-new {
                color: <?php echo $storeset_good_pricecolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_good_buttonback !='') { ?>
            .product-info > .right .cart .button {
                background: url(/catalog/view/theme/storeset/images/to-cart.png) no-repeat 16% 46%, <?php echo $storeset_good_buttonback; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_good_buttontextcolore !='') { ?>
            .product-info > .right .cart .button {
                color: <?php echo $storeset_good_buttontextcolore; ?>; 
            }    
            <?php } ?>
            .product-info > .right .cart .button:hover {
                background: url(/catalog/view/theme/storeset/images/to-cart-hover.png) no-repeat 16% 46%,#ff5100;
            }
            <?php if($storeset_f1_backround !='') { ?>
            .footer-top {
                background: <?php echo $storeset_f1_backround; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f1_linkcolor !='') { ?>
            p.subscribe, footer .socials a, footer .contacts ul li, footer .contacts ul li a {
                color: <?php echo $storeset_f1_linkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f2_h1color !='') { ?>
            footer h3 {
                color: <?php echo $storeset_f2_h1color; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f1_h1color !='') { ?>
            footer h3.top-f {
                color: <?php echo $storeset_f1_h1color; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f1_textcolor !='') { ?>
            .footer-top .about p, .footer-top .about p a {
                color: <?php echo $storeset_f1_textcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f2_background !='') { ?>
            .footer-middle {
                background: <?php echo $storeset_f2_background; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f2_linkcolor !='') { ?>
            footer .footer-middle ul > li > a, footer .footer-middle ul > li > a:visited, footer .footer-middle ul > li > a:hover {
                color: <?php echo $storeset_f2_linkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f3_background !='') { ?>
            #powered {
                background: <?php echo $storeset_f3_background; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f3_copytextcolor !='') { ?>
            #powered .copyright {
                color: <?php echo $storeset_f3_copytextcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_f3_copylinkcolor !='') { ?>
            #powered .copyright a, #powered .copyright a:visited {
                color: <?php echo $storeset_f3_copylinkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_head !='') { ?>
            #sidebar-toggle span,#search-top span, .login-top-mobile span, .cart-top-mobile span {
                 color: <?php echo $storeset_mobile_head; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_foot !='') { ?>
            .top-panel .navbar a, .top-panel .navbar a:visited, .top-panel .navbar a:hover {
                 color: <?php echo $storeset_mobile_foot; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_head_back !='') { ?>
            @media only screen and (max-width: 768px){
                .top-panel, .search-box-top {
                    background: <?php echo $storeset_mobile_head_back; ?>; 
                }
                }    
            <?php } ?>
            <?php if($storeset_mobile_sidebar_back !='') { ?>
            #sidebar {
                 background: <?php echo $storeset_mobile_sidebar_back; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_sidebar_linkcolor !='') { ?>
            #sidebar a, .sidebar-a i, .sidebar-a strong, .sidebar-a .dropdown-menu .btn-link, .sidebar-a h3, .sidebar-a ul li {
                 color: <?php echo $storeset_mobile_sidebar_linkcolor; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_enabel_foot =='1') { 
            echo "@media only screen and (max-width: 768px){.navbar-fixed-bottom { display: block;}} ";
             } else {
            echo ".navbar-fixed-bottom { display: none;}  ";
            } ?>
            <?php if($storeset_mobile_foot_back !='') { ?>
            .top-panel .navbar, .top-panel .dropdown-menu {
                 background: <?php echo $storeset_mobile_foot_back; ?>!important; 
            }    
            <?php } ?>
            <?php if($storeset_mobile_head_buttonback !='') { ?>
             {
                 background: <?php echo $storeset_mobile_head_buttonback; ?>; 
            }    
            <?php } ?>
            <?php if($storeset_custom_mobile !='') {
                $mobile_logo = $storeset_custom_mobile;
            } else {
             $mobile_logo = "";
            }
            ?>
            <?php if($storeset_customcss !='') { ?>
            <?php echo $storeset_customcss; ?>  
            <?php } ?>           
        </style>
        <?php } ?>
        
        
</head>
<body>
 <?php if (isset($popup_view_data['status']) && $popup_view_data['status']) { ?>
        <script type="text/javascript">
        $(function() {
          $.each($("[onclick^='addToCart'], .product-thumb [onclick^='get_popup_cart']"), function() {
            var product_id = $(this).attr('onclick').match(/[0-9]+/);
            $(this).parent().parent().find('a').append("<a href='javascript:void(0);' class='popup_view_button mobile-none' onclick='get_popup_view(" + product_id + ");'><?php echo $popup_view_text['button_popup_view']; ?></a>");
          });
        });
       </script>
<?php } ?>
<div id="oct-wrap">        
    <div class="top-panel">
        <div class="container">
            <div class="row">
                <a href="#" data-toggle="body" id="sidebar-toggle">
                    <span class="ti-menu-alt"></span>
                </a>
                <?php if($mobile_logo !='') { ?>
                    <a href="<?php echo $home; ?>" class="mobile-logo"><img src="image/<?php echo $mobile_logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="mobile-logo-img"/></a>
                <?php } ?>
                <div class="mobile-icons-top">
                    <a href="#" id="search-top" class="search-top"><span class="ti-search"></span></a>
                    <div class="search-box-top">
                        <input type="search" name="search" class="col-xs-10" id="story-top" value="" placeholder="Поиск" onclick="this.value = '';">
                        <input type="submit" class="col-xs-2 top-search-submit" value="Искать">
                    </div>
                    <a href="<?php echo $shopping_cart; ?>" class="cart-top-mobile">
                        <span class="ti-shopping-cart"></span>
                        <div class="cart-cols" id="cart-loading"></div>
                    </a>
                    <a href="index.php?route=account/account" class="login-top-mobile"><span class="ti-user"></span></a>
                </div>
                    
                <ul class="col-sm-7 col-md-5 top-panel-ul">
                    <?php foreach ($informations as $information) { ?>
                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                    <?php } ?>
                </ul>
                <div class="col-sm-5 col-md-7 top-panel-div">
                    <div class="right">
                        <?php if (!$logged) { ?>
                            <a href="#loginmodal" class="register" id="modaltrigger"><span class="ti-user"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_account; ?></span></a>
                        <?php } else { ?>
                            <a href="index.php?route=account/account" class="register logged"><span class="ti-user"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_account; ?></span></a>
                        <?php } ?>
                        <a href="<?php echo $wishlist; ?>" id="wishlist-total"><span class="ti-heart"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_wishlist; ?></span></a>
                        <a id="oct-compare" href="<?php echo $compare; ?>" class="checkout-top"><span class="ti-bar-chart"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_compare; ?></span></a>
                        <a href="<?php echo $checkout; ?>" class="checkout-top"><span class="ti-check-box"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_checkout; ?></span></a>
                        <?php if(!empty($language) && $language !="" OR !empty($currency) && $currency!="") { ?>
                        <div class="settings"><span class="ti-settings"></span>&nbsp;<span class="top-panel-div-span"><?php echo $text_settings; ?></span>
                            <div class="settings-list">
                                <?php echo $language; ?>
                                <?php echo $currency; ?>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="sidebar-box"></div>
        <div id="sidebar" data-role="sideslide">
            
               <div id="accordion" class="panel-group">
                   <?php if($storeset_mobile_sidebar_1 == "on") { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse-1" data-parent="#accordion" data-toggle="collapse" class="sidebar-a"><i class="fa fa-info-circle"></i><?php echo $text_information; ?><i class="fa fa-caret-down"></i></a>
                            </h4>
                        </div>
                        <div id="collapse-1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <?php foreach ($informations as $information) { ?>
                                    <a href="<?php echo $information['href']; ?>" class="sidebar-a"><?php echo $information['title']; ?></a>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if($storeset_mobile_sidebar_2 == "on") { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse-2" data-parent="#accordion" data-toggle="collapse" class="sidebar-a"><i class="fa fa-headphones"></i><?php echo $text_service; ?><i class="fa fa-caret-down"></i></a>
                            </h4>
                        </div>
                        <div id="collapse-2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <a href="<?php echo $contact; ?>" class="sidebar-a"><?php echo $text_contact; ?></a>
                                <a href="<?php echo $return; ?>" class="sidebar-a"><?php echo $text_return; ?></a>
                                <a href="<?php echo $sitemap; ?>" class="sidebar-a"><?php echo $text_sitemap; ?></a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if($storeset_mobile_sidebar_3 == "on") { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse-3" data-parent="#accordion" data-toggle="collapse" class="sidebar-a"><i class="fa fa-ellipsis-h"></i><?php echo $text_extra; ?><i class="fa fa-caret-down"></i></a>
                            </h4>
                        </div>
                        <div id="collapse-3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <a href="<?php echo $manufacturer; ?>" class="sidebar-a"><?php echo $text_manufacturer; ?></a>
                                <a href="<?php echo $voucher; ?>" class="sidebar-a"><?php echo $text_voucher; ?></a>
                                <a href="<?php echo $affiliate; ?>" class="sidebar-a"><?php echo $text_affiliate; ?></a>
                                <a href="<?php echo $special; ?>" class="sidebar-a"><?php echo $text_special; ?></a>
                            </div>
                        </div>
                    </div> 
                    <?php } ?>
                    <?php if($storeset_mobile_sidebar_4 == "on") { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#collapse-4" data-parent="#accordion" data-toggle="collapse" class="sidebar-a"><i class="fa fa-user"></i><?php echo $text_account; ?><i class="fa fa-caret-down"></i></a>
                            </h4>
                        </div>
                        <div id="collapse-4" class="panel-collapse collapse">
                            <div class="panel-body">
                                <a href="<?php echo $account; ?>" class="sidebar-a"><?php echo $text_account; ?></a>
                                <a href="<?php echo $order; ?>" class="sidebar-a"><?php echo $text_order; ?></a>
                                <a href="<?php echo $wishlist; ?>" class="sidebar-a"><?php echo $text_wishlist; ?></a>
                                <a href="<?php echo $newsletter; ?>" class="sidebar-a"><?php echo $text_newsletter; ?></a>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    <?php if($storeset_mobile_sidebar_5 == "on") { ?>
                    <?php if(!empty($language) && $language !="" OR !empty($currency) && $currency!="") { ?>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a href="#collapse-5" data-parent="#accordion" data-toggle="collapse" class="sidebar-a"><i class="fa fa-cog"></i><?php echo $text_settings; ?><i class="fa fa-caret-down"></i></a>
                                    </h4>
                                </div>
                                <div id="collapse-5" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <?php if(strlen($language) > 5) { ?><div class="sidebar-a"><?php echo $language; ?></div><?php } ?>
                                        <?php if(strlen($currency) > 5)  { ?><div class="sidebar-a"><?php echo $currency; ?></div><?php } ?>
                                    </div>
                                </div>
                            </div>
                    <?php } ?>
                    <?php } ?>
                    <?php if($storeset_mobile_sidebar_6 == "on") { ?>
                    <div class="sidebar-a">
                        <h3><?php echo $text_contact; ?></h3>
                        <ul>
                            <?php if($storeset_cont_address != '') { ?>
                                <li><?php echo $storeset_cont_address; ?></li>
                            <?php } ?>
                            <?php if($storeset_cont_email != '') { ?>
                                <li><a href="mailto:<?php echo $storeset_cont_email; ?>"><?php echo $storeset_cont_email; ?></a></li>
                            <?php } ?>
                            <?php if($storeset_cont_phone1 != '') { ?>
                                <li><a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone1) ?>';"><?php echo $storeset_cont_phone1; ?></a></li>
                            <?php } ?>
                            <?php if($storeset_cont_phone2 != '') { ?>
                                <li><a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone2) ?>';"><?php echo $storeset_cont_phone2; ?></a></li>
                            <?php } ?>
                            <?php if($storeset_cont_clock != '') { ?>
                                <li><?php echo strip_tags(html_entity_decode($storeset_cont_clock)); ?></li>
                            <?php } ?>
                           
                        </ul>
                    </div>
                    <?php } ?>
                </div>
        </div>
    <div class="clearfix"></div>
    <?php if (!$logged) { ?>
    
    <div id="loginmodal" style="display:none;">
    <div class="logintitle"><?php echo $text_autorization; ?></div>    
    <form id="loginform" name="loginform" method="post" action="<?php echo $loginurl; ?>" enctype="multipart/form-data">
        <p class="fieldbox">
            <label for="email" class="email-label"><?php echo $text_user; ?></label>
            <input type="text" name="email" id="email" class="txtfield" tabindex="1">
        </p>
        <p class="fieldbox">
            <label for="password" class="password-label"><?php echo $text_password; ?></label>
            <input type="password" name="password" id="password" class="txtfield" tabindex="2">
        </p>
        <p class="fieldbox">
            <input type="submit" name="loginbtn" id="loginbtn" class="button" value="<?php echo $text_enter; ?>" tabindex="3">
        </p>
    </form>
    <div class="login-help">
    <a href="<?php echo $register; ?>" title="<?php echo $text_register; ?>"><?php echo $text_register; ?></a> | <a href="<?php echo $forgotten; ?>" title="<?php echo $text_forgotten; ?>"><?php echo $text_forgotten; ?></a>
    </div>
    </div>
     <script type="text/javascript"><!--
    $('#loginmodal input').keydown(function(e) {
        if (e.keyCode == 13) {
            $('#loginmodal').submit();
        }
    });
    //--></script>
    <?php } ?>
  
    <div class="container">
       <!-- ============ header =================== -->
            <header class="row">                
                <?php if($storeset_status == "on") { ?> 
                     <?php if ($logo) { ?>
                        <?php if($_SERVER['REQUEST_URI'] == "/index.php?route=common/home" OR $_SERVER['REQUEST_URI'] == "/") { ?>
                            <div class="col-sm-3 col-md-3">
                                <div class="header_logo">
                                    <img src="<?php echo $logo; ?>" class="img-responsive" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                                </div>
                            </div>
                        <?php } else { ?>
                          <div class="col-sm-3 col-md-3">
                            <div class="header_logo">
                                <a href="<?php echo $home; ?>"><img class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
                            </div>
                          </div>
                        <?php } ?>    
                      <?php } ?>            
                    <div id="contacts" class="col-sm-3 col-md-3">
                    <i class="fa fa-<?php echo $storeset_custom_icon1; ?> contacts-fa"></i>
                        <div id="phone">
                            <div><?php if($storeset_cont_phone1 != '') { ?>
                                <a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone1)?>';"><?php echo $storeset_cont_phone1; ?></a>
                                
                            <?php } ?></div>
                            <div><?php if($storeset_cont_phone2 != '') { ?>
                                <a href="javascript:void(0);" onclick="window.location.href='tel:+<?php echo preg_replace('/\D/', '', $storeset_cont_phone2)?>';"><?php echo $storeset_cont_phone2; ?></a>
                            <?php } ?></div>
                        </div>
                        <div class="hidden-contacts">
                        <ul>
                            <?php if($storeset_cont_address != '') { ?>
                                <li><i class="fa fa-map"></i><?php echo $storeset_cont_address; ?></li>
                            <?php } ?>
                            <?php if($storeset_cont_email != '') { ?>
                                <li><i class="fa fa-envelope"></i><a href="mailto:<?php echo $storeset_cont_email; ?>"><?php echo $storeset_cont_email; ?></a></li>
                            <?php } ?>
                            <?php if($storeset_cont_skype != '') { ?>
                                <li><i class="fa fa-skype"></i><a href="skype:<?php echo $storeset_cont_skype; ?>"><?php echo $storeset_cont_skype; ?></a></li>
                            <?php } ?>
                        </ul>
                    </div>
                    </div>
                    <div id="shedule" class="col-sm-3 col-md-3">
                    <i class="fa fa-<?php echo $storeset_custom_icon2; ?>"></i>
                        <div><?php if($storeset_cont_clock != '') { ?>
                            <?php echo html_entity_decode($storeset_cont_clock); ?>
                        <?php } ?>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3">
                        <div id="right-block" >
                            <?php echo $cart; ?>
                            <i class="fa fa-<?php echo $storeset_custom_icon3; ?>"></i>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                <?php } ?>
            </header>
        <!-- ============ menu =================== -->
          <?php if($use_megamenu) { ?>
          <div class="container">
           <div id="stick_menu" class="row menu-row">
              <nav id="megamenu-menu" class="navbar">
                 <div class="container">
                    <?php echo $search; ?>  
                    <div class="navbar-header" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                       <button type="button" class="btn btn-navbar navbar-toggle"><i class="fa fa-bars"></i></button>
                       <span id="category" class="visible-xs"><?php echo $text_megamenu; ?></span>
                    </div>
                    <div class="collapse navbar-collapse navbar-ex1-collapse">
                       <ul class="nav navbar-nav">
                          <?php foreach ($items as $item) { ?>
                          <?php if ($item['children']) { 
                             $type = isset($item['subtype']) ? $item['subtype']: 'none';
                             $type_full = isset($item['type']) ? $item['type']: '';
                             ?>
                          <li class="dropdown <?php if($type == "full" || $type_full == "manufacturer"){echo"new-drop";} elseif($type == "full_image"){echo"new-drop";} elseif($item['type']=="product"){echo"new-drop";} else {echo"";}?>">
                             <a href="<?php echo $item['href']; ?>" <?php if($item['use_target_blank'] == 1) { echo ' target="_blank" ';} ?> <?php if($item['type'] == "link" ) {echo 'data-target="link"';} else {echo 'class="dropdown-toggle dropdown-img" data-toggle="dropdown"';} ?>><?php if($item['thumb']){ ?>
                                 <img class="megamenu-thumb" src="<?php echo$item['thumb']; ?>" alt="<?php echo $item['name']; ?>" title="<?php echo $item['name']; ?>"/>
                                 <?php } ?><?php echo $item['name']; ?>
                              </a>
                                 <a <?php if($item['type'] == "link" ) {echo 'data-target="link" class="megamenu-notoggle-a"';} else {echo 'class="dropdown-toggle dropdown-img megamenu-toggle-a" data-toggle="dropdown"';} ?>></a>
                            
                             
                             <?php if($item['type']=="category"){ ?>
                             <?php if($item['subtype']=="simple"){ ?>
                             <div class="dropdown-menu megamenu-type-category-simple">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <ul class="list-unstyled megamenu-haschild simple-category">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                         <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a><?php if(count($child['children'])){ ?><a class="parent-title-toggle"></a><?php } ?>
                                         <?php if(count($child['children'])){ ?>
                                         <ul class="list-unstyled megamenu-ischild megamenu-ischild-simple">
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <li><a class="mm-3-level-link" href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
                                            <?php } ?>
                                         </ul>
                                         <?php } ?>             
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?> 
                             <?php } ?>
                             <?php if($item['type']=="category"){ ?>
                             <?php if($item['subtype']=="full"){ ?>
                             <div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <?php if($item['add_html']){ ?>
                                   <div style="" class="menu-add-html">
                                      <?php echo$item['add_html'];?>
                                   </div>
                                   <?php } ?>
                                   <ul class="list-unstyled megamenu-haschild">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                         <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
                                            <?php echo $child['name']; ?>
                                         </a>
                                         <?php if(count($child['children'])){ ?><a class="parent-title-toggle"></a>
                                         <ul class="list-unstyled megamenu-ischild">
                                            <?php $countstop = 1; ?>
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <?php $countstop++; ?>
                                            <li><a class="mm-3-level-link" href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
                                            <?php if($countstop > $item['limit_item']) { ?>
                                            <li><a class="see-all" href="<?php echo $child['href']; ?>" ><?php echo $text_all_category; ?></a></li>
                                            <?php break; } ?>
                                            <?php } ?>
                                         </ul>
                                         <?php } ?>             
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?> 
                             <?php } ?>
                             <?php if($item['type']=="category"){ ?>
                             <?php if($item['subtype']=="full_image"){ ?>
                             <div class="dropdown-menu megamenu-type-category-full megamenu-bigblock">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <?php if($item['add_html']){ ?>
                                   <div style="" class="menu-add-html">
                                      <?php echo$item['add_html'];?>
                                   </div>
                                   <?php } ?>
                                   <ul class="list-unstyled megamenu-haschild">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="megamenu-parent-block<?php if(count($child['children'])){ ?> megamenu-issubchild<?php } ?>">
                                         <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="<?php echo $child['name']; ?>" title="<?php echo $child['name']; ?>"/></a>
                                         <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>">
                                            <?php echo $child['name']; ?>
                                         </a>
                                         <?php if(count($child['children'])){ ?><a class="parent-title-toggle"></a>
                                         <ul class="list-unstyled megamenu-ischild">
                                            <?php $countstop = 1; ?>
                                            <?php foreach ($child['children'] as $subchild) { ?>
                                            <?php $countstop++; ?>
                                            <li><a class="mm-3-level-link" href="<?php echo $subchild['href']; ?>"><?php echo $subchild['name']; ?></a></li>
                                            <?php if($countstop > $item['limit_item']) { ?>
                                            <li><a class="see-all" href="<?php echo $child['href']; ?>" ><?php echo $text_all_category; ?></a></li>
                                            <?php break; } ?>
                                            <?php } ?>
                                         </ul>
                                         <?php } ?>             
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?> 
                             <?php } ?>
                             <?php if($item['type']=="html"){ ?>
                             <div class="dropdown-menu megamenu-type-html">
                                <div class="dropdown-inner">
                                   <ul class="list-unstyled megamenu-haschild">
                                      <li class="megamenu-parent-block">
                                         <div class="megamenu-html-block">              
                                            <?php echo$item['html']; ?>
                                         </div>
                                      </li>
                                   </ul>
                                </div>
                             </div>
                             <?php } ?>
                             <?php if($item['type']=="manufacturer"){ ?>
                             <div class="dropdown-menu megamenu-type-manufacturer <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <?php if($item['add_html']){ ?>
                                   <div style="" class="menu-add-html">
                                      <?php echo$item['add_html'];?>
                                   </div>
                                   <?php } ?>
                                   <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="megamenu-parent-block">
                                         <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
                                         <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?>
                             <?php if($item['type']=="information"){ ?>
                             <div class="dropdown-menu megamenu-type-information <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <?php if($item['add_html']){ ?>
                                   <div style="" class="menu-add-html">
                                      <?php echo$item['add_html'];?>
                                   </div>
                                   <?php } ?>
                                   <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="info-href"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?>
                             <?php if($item['type']=="product"){ ?>
                             <div class="dropdown-menu megamenu-type-product <?php if($item['add_html']){ ?>megamenu-bigblock<?php } ?>">
                                <div class="dropdown-inner">
                                   <?php foreach (array_chunk($item['children'], ceil(count($item['children']) / 1)) as $children) { ?>
                                   <?php if($item['add_html']){ ?>
                                   <div style="" class="menu-add-html">
                                      <?php echo$item['add_html'];?>
                                   </div>
                                   <?php } ?>
                                   <ul class="list-unstyled megamenu-haschild <?php if($item['add_html']){ ?>megamenu-blockwithimage<?php } ?>">
                                      <?php foreach ($children as $child) { ?>
                                      <li class="megamenu-parent-block">
                                         <a class="megamenu-parent-img" href="<?php echo $child['href']; ?>"><img src="<?php echo $child['thumb']; ?>" alt="" title="" /></a>
                                         <a class="megamenu-parent-title" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                         <div class="dropprice">
                                            <?php if($child['special']){ ?><span><?php } ?><?php echo $child['price']; ?><?php if($child['special']){ ?></span><?php } ?><?php echo $child['special']; ?>
                                         </div>
                                      </li>
                                      <?php } ?>
                                   </ul>
                                   <?php } ?>
                                </div>
                             </div>
                             <?php } ?>
                             <?php if($item['type']=="auth"){ ?>
                             <div class="dropdown-menu megamenu-type-auth">
                                <div class="dropdown-inner">
                                   <ul class="list-unstyled megamenu-haschild">
                                      <li class="megamenu-parent-block">
                                         <div class="megamenu-html-block">
                                            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                               <div class="form-group">
                                                  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                                                  <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                                               </div>
                                               <div class="form-group">
                                                  <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                                                  <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                                                  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                                                  <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
                                               </div>
                                               <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" />
                                            </form>
                                         </div>
                                      </li>
                                   </ul>
                                </div>
                             </div>
                             <?php } ?>
                          </li>
                          <?php } else { ?>
                          <li><a href="<?php echo $item['href']; ?>"><?php if($item['thumb']){ ?>
                             <img class="megamenu-thumb" src="<?php echo$item['thumb']; ?>" alt="<?php echo $item['name']; ?>" title="<?php echo $item['name']; ?>"/>
                             <?php } ?><?php echo $item['name']; ?></a>
                          </li>
                          <?php } ?>
                          <?php } ?>        
                       </ul>
                       <div class="clearfix"></div>
                    </div>
                 </div>
              </nav>
           </div>
        </div>
  
  <script>
    var start_pos=$('#stick_menu').offset().top;
     $(window).scroll(function(){
      if ($(window).scrollTop()>=start_pos) {
          if ($('#stick_menu').hasClass()==false) $('#stick_menu').addClass('to_top');
          $('body').addClass('body-fx');
      }
      else {
        $('#stick_menu').removeClass('to_top');
        $('body').removeClass('body-fx');
      }
     });
  </script>
<?php } ?>
<?php if ($categories && !$use_megamenu) { ?>
            <nav class="main-nav">
            <a class="menu-alt"></a>
            <?php 
            if(isset($mega)){echo $mega; } else { ?>
                   
               
                   
                <ul class="main-ul">
                    <?php foreach ($categories as $category) { ?>
                    <li class="main-li">
                        
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        
                        
                        <?php if ($category['children']) { ?>
                        <div class="category-dropdown">
                            <?php for ($i = 0; $i < count($category['children']);) { ?>
                            <ul class="sub-ul">
                                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                <?php for (; $i < $j; $i++) { ?>
                                <?php if (isset($category['children'][$i])) { ?>
                                <li class="sub-li">
                                    <a href="<?php echo $category['children'][$i]['href']; ?>" class="sub-category"><?php echo $category['children'][$i]['name']; ?></a>                      
                                </li>
                                <?php } ?>
                                <?php } ?>
                            </ul>
                            <?php } ?>
                        </div>
                        <?php } ?>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>
                <?php echo $search; ?>                              
                <div class="clearfix"></div>
                
                                  
            </nav>
            <?php } ?>
            <script>
            $( ".menu-alt" ).click(function() {
              $( ".mobile-category" ).slideToggle( "slow", function() {
                // Animation complete.
              });
              $('.mobile-category').css('display','block');
            });
            </script>
            <div id="notification"></div>
            
            
            