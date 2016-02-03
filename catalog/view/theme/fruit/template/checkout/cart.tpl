<?php echo $header; ?>
<div class="cart-page">
  <div class="top"></div>
  <section class="block-center clearfix"><a href="<?php echo $continue; ?>" class="back-link"><i></i> Вернуться к покупкам</a>
    <?php if ($attention) { ?>
      <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <?php if ($success) { ?>
      <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>
    <?php if ($error_warning) { ?>
      <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
    <?php } ?>

    <div class="wrap clearfix">
      <div class="list">
        <?php foreach ($products as $product) { ?>
        <div class="item clearfix">
          <div class="img-wrap">
            <?php if ($product['thumb']) { ?>
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
            <?php } ?>
          </div>
          <div class="title">
            <?php echo $product['name']; ?>
            <?php if (!$product['stock']) { ?>
              ***
            <?php } ?>
          </div>
          <div class="input-wrap">
            <div class="minus"></div>
            <div class="plus"></div>
            <label><input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>"> <span>кг</span></label>
          </div>
          <div class="price"><?php echo $product['total']; ?></div>
          <div class="remove-btn" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"></div>
        </div>
        <?php } ?>
      </div>
      <div class="order">
        <div class="title">Ваш заказ:</div>
        <?php $last_total = end($totals); ?>
        <div class="payment">К оплате: <?php echo $last_total['text'] ?></div>
        <div class="total">Всего: <?php echo $text_items ?></div>
        <form>
          <button data-popup="order" class="popup-open">Оформит заказ</button>
        </form>
      </div>
    </div>
    <?php echo $content_bottom; ?>
  </section>
</div>
<?php echo $footer; ?>
