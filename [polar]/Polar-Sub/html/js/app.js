window.addEventListener('message', function (event) {
    switch(event.data.action) {
        default:
            DrawCrosshair(event.data);
            break;  
    }
});

function DrawCrosshair(data) {
    var $drawstuffre = $('.drawstuffre.template').clone();
    $drawstuffre.removeClass('template');
    $drawstuffre.addClass(data.type);
    $drawstuffre.html(data.text);
    $drawstuffre.fadeIn();
    $('.notif-container').append($drawstuffre);
    setTimeout(function() {
        $.when($drawstuffre.fadeOut()).done(function() {
            $drawstuffre.remove()
        });
    }, data.length === undefined ? data.length : 2500);
}