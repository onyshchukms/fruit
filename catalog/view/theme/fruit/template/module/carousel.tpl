<?php $class = array('vegetables', 'fruit', 'greenery', 'home'); ?>
<?php foreach ($banners as $key => $banner) { ?>
    <a href="<?php echo $banner['link']; ?>"><div data-link="<?php echo $class[$key]; ?>" class="link <?php echo $class[$key]; ?>"><span><?php echo $banner['title']; ?></span></div></a>
    <div class="link-bg <?php echo $class[$key]; ?>"></div>
<?php } ?>

<div class="links-list clearfix">
    <div id="carousel<?php echo $module; ?>" class="owl-carousel">
        <?php foreach ($banners as $key => $banner) { ?>
        <div class="item">
            <a href="<?php echo $banner['link']; ?>">
                <div class="img-wrap"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></div>
                <div class="title"><?php echo $banner['title']; ?></div>
            </a>
        </div>
        <?php } ?>
    </div>
</div>

<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 2,
    itemsDesktop : [1199, 2],
    itemsDesktopSmall : [979, 2],
    itemsMobile : [600, 1],
    slideSpeed : 1000,
	navigation: true,
	pagination: false
});
--></script>