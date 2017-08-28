
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

    $('#finalize_cart').click( function() {
        $('#popup-pay').show();
    } );

});