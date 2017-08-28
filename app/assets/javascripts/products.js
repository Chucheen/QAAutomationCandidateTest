
function closePopUp(){
    $('.popup').hide();
}

$(document).ready(function(){

    $('.popup-back').on('click', function(){
        closePopUp();
    });

});


/* Products Select */
$(document).ready(function(){

    $('.add_to_cart').click( function() {
        var name = $(this).attr('data-name');
        var id = $(this).attr('data-id');
        var price = $(this).attr('data-price');
        $('#popup-product').show();
        $('#order_line_product_id').val(id);
        $('#prder_line_qty').val(1);
        $('#unit_price_label').html(price);
        $('#total_price_label').html(price);
        $('#product-name').html(name);
    } );

});