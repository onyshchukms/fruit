<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/theme/fruit/libs/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/fruit/libs/jquery/scroll2id/jquery.scroll2id.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/fruit/css/fruits.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/theme/fruit/js/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<?php
$name_arr = explode('-', $name);
$name = $name_arr[0];
$subname = '';
if (isset($name_arr[1])) $subname = $name_arr[1];
?>

<div class="scroll-menu clearfix">
  <section class="block-center">
    <a href="<?php echo $home; ?>">
      <div class="logo">
        <?php if ($logo) { ?>
          <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        <?php } else { ?>
          <h1><?php echo $name; ?></h1>
        <?php } ?>
      </div>
    </a>
    <?php if ($categories) { ?>
    <nav>
      <ul>
        <?php foreach ($categories as $category) { ?>
          <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <li><a href="#about" class="scroll-to">О нас</a></li>
        <li><a href="#shipping-payment" class="scroll-to">Гарантия и доставка</a></li>
      </ul>
    </nav>
    <?php } ?>
    <div class="right">
      <?php echo $cart; ?>
    </div>
    <div class="nav-button">
      <div class="line"></div>
      <div class="line"></div>
      <div class="line"></div>
    </div>
  </section>
</div>

<div class="header-wrap">
  <header class="clearfix">
    <a href="<?php echo $home; ?>" class="top">
      <div class="logo">
        <?php if ($logo) { ?>
          <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
        <?php } else { ?>
          <h1><?php echo $name; ?></h1>
          <?php if ($subname) { ?>
            <div class="description"><?php echo $subname; ?></div>
          <?php } ?>
        <?php } ?>
      </div>
    </a>
    <div class="phone"> <i></i><a href="tel:<?php echo preg_replace('/[^\d+]/', '', $telephone); ?>"><?php echo $telephone; ?></a></div>
    <div class="right">
      <?php echo $search; ?>
      <?php echo $cart; ?>
    </div>
  </header>
</div>
