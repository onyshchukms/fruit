<div class="items-list clearfix">
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
<a href="#" class="look-all">Смотреть все </a>
