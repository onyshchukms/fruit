<?php echo $header; ?>
<div class="category-page">
  <div class="page-title">
    <section class="block-center clearfix">
      <?php if ($thumb) { ?>
      <div class="right"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>"></div>
      <?php } ?>
      <div class="left">
        <h2><?php echo $heading_title; ?></h2>
        <?php if ($description) { ?>
          <div><?php echo $description; ?></div>
        <?php } ?>
        <div class="sorting clearfix">
          <div class="title">Сортировка товаров:</div>
          <div class="sort down price">По цене <i></i></div>
          <div class="sort price up">По цене <i></i></div>
          <div class="sort abc">По алфавиту</div>
        </div>
      </div>
    </section>
  </div>
  <div class="block">
    <div class="gray-top">
      <section class="block-center clearfix">
        <div class="title">фрукты кг </div>
        <div class="input-wrap">
          <input type="text" name="waight" data-force-edges="true" data-postfix=" &lt;span&gt;грн/кг&lt;/span&gt;" data-min="0" data-max="300" data-from="50" data-to="250" data-type="double" class="data-slider">
        </div>
        <div class="button clearfix">Скрыть
          <div class="icon close"></div>
        </div>
      </section>
    </div>
    <?php if ($products) { ?>
    <div class="items-list clearfix block-center">
      <?php foreach ($products as $product) { ?>
      <div class="product-item new">
        <div class="item"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
          <div class="name"><?php echo $product['name']; ?></div>
          <?php if ($product['price']) { ?>
            <div class="cost">
              <?php if (!$product['special']) { ?>
                <span><?php echo $product['price']; ?></span>
              <?php } else { ?>
                <span class="old"><?php echo $product['price']; ?></span><span><?php echo $product['special']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </div>
          <?php } ?>
          <button onclick="cart.add('<?php echo $product['product_id']; ?>');"><i></i> Добавить в корзину</button>
          <a href="<?php echo $product['href']; ?>">Подробнее о товаре</a>
        </div>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
  </div>
  <div class="block">
    <div class="gray-top one">
      <section class="block-center clearfix">
        <div class="title">фрукты поштучно </div>
        <div class="button clearfix">Показать
          <div class="icon open"></div>
        </div>
      </section>
    </div>
  </div>
</div>

<?php echo $footer; ?>
