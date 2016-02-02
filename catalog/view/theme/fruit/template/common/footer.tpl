<?php
$name_arr = explode('-', $name);
$name = $name_arr[0];
$subname = '';
if (isset($name_arr[1])) $subname = $name_arr[1];
?>

<div class="footer-wrap">
  <footer class="clearfix block-center">
    <div class="wave"></div>
    <a href="<?php echo $home; ?>" class="logo-wrap">
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
    <div class="phone"> <i></i><a href="tel:<?php echo preg_replace('/[^\d+]/', '', $telephone); ?>"><?php echo $telephone; ?></a></div>
  </footer>
</div>
<div class="bottom-footer">
  <div class="center clearfix block-center">
    <div class="left">2015 (c) <?php echo $name; ?></div>
    <div class="policy"><a href="#">Политика конфиденциальности</a></div>
    <ul class="social">
      <li><a target="_blank" href="#" class="vk"></a></li>
      <li><a target="_blank" href="#" class="fb"></a></li>
      <li><a target="_blank" href="#" class="tw"></a></li>
    </ul>
  </div>
</div>

</body></html>