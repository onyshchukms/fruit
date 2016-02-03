<div class="header-cart">
  <div class="basket-btn"><i></i><?php echo $text_items; ?></div>
  <div class="drop-down basket">
    <?php if ($products || $vouchers) { ?>
    <?php foreach ($products as $product) { ?>
      <div class="line clearfix">
        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" width="32">
        <div class="name"><?php echo $product['name']; ?></div>
        <div class="remove" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"></div>
        <div class="cost"><?php echo $product['total']; ?></div>
        <div class="input-wrap">
          <div class="plus"></div>
          <div class="minus"></div>
          <label><input type="text" value="<?php echo $product['quantity']; ?>" onchange="cart.update(<?php echo $product['cart_id']; ?>, this.value)"><span>кг</span></label>
        </div>
      </div>
    <?php } ?>
      <div class="bottom clearfix">
        <?php $last_total = end($totals); ?>
        <div class="total">Всего:<span><?php echo $last_total['text'] ?></span></div>
        <input type="submit" value="Оформить заказ">
      </div>
    <?php } else { ?>
      <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
  </div>
</div>
