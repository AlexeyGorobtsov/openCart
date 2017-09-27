$(document).ready(function () {
  
    $('#fast_order').magnificPopup({
    items: {
      src: '#fast_order_form'
    },
    type: 'inline'
    });
    
    
    $('.quick_checkout_button').click(function () {
       
      var product_name = $('#product_name').val(); 
      var product_price = $('#product_price').val();
      var customer_name = $('#customer_name').val();
      var customer_phone = $('#customer_phone').val();
      var customer_message = $('#customer_message').val();
      $('#result').html('Обрабатываем введенные данные..');
      $.post('qucik_checkout.php', { 'product_name': product_name, 'product_price': product_price, 'customer_name': customer_name, 'customer_phone': customer_phone, 'customer_message': customer_message }, function (data) { if (data == 'empty') { $('#fast_order_result').html('<span class="fast_order_error">Обязательно укажите ваше имя и телефон, иначе мы не сможем вам перезвонить!</span>'); } else { $('#fast_order_result').html('<span class="fast_order_success">Спасибо за покупку! Ваш заказ успешно оформлен!</span><br /><span>Наш менеджер свяжется с Вами в течение дня. </span>'); $(".form-group").fadeOut("fast"); $(".quick_checkout_button").fadeOut("fast"); } });
    });
});