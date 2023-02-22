Printer = {}

$(document).ready(function(){
    window.addEventListener('message', function(event){
        var action = event.data.action;

        switch(action) {
            case "open":
                Printer.Open(event.data);
                break;
            case "start":
                Printer.Start(event.data);
                break;
            case "close":
                Printer.Close(event.data);
                break;
        }
    });
});

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
            Printer.Close();
            break;
    }
});

Printer.Open = function(data) {
    if (data.url) {
        $(".document-image").attr('src', data.url);
        $(".document-container").fadeIn(150);
    } else {
        console.log('No document has been linked!!!!!')
    }
}

Printer.Start = function(data) {
    $("#fileurl").val("")
    $(".printer-container").fadeIn(150);
}

Printer.Close = function(data) {
    $(".document-container").fadeOut(150);
    $(".printer-container").fadeOut(150);
    $.post('https://snipe-portablescreens/CloseDocument');
}

function isValidHttpUrl(string) {
    let url;
    
    try {
      url = new URL(string);
    } catch (_) {
      return false;  
    }
  
    return url.protocol === "http:" || url.protocol === "https:";
  }

function getMeta(url) {
    return new Promise((resolve, reject) => {
       let img = new Image();
    //    console.log(img)
       img.onload = () => resolve(img);
       img.onerror = () => reject();
       img.src = url;
    });
}
 
 async function run(url) {
    let img
    try{
       img = await getMeta(url);
    }
    catch(e){
        return {width:1920, height:1080}
    }
    let w = img.width;
    let h = img.height;
    return {width:w, height:h}
}

function isImage(url) {
    return /\.(jpg|jpeg|png|webp|avif|gif|svg|PNG)$/.test(url);
  }
 
Printer.Print = async function(data) {
    $(".document-container").fadeOut(150);
    $(".printer-container").fadeOut(150);
    if ($("#fileurl").val()) {
        if (isValidHttpUrl($("#fileurl").val())){
            if (isImage($("#fileurl").val())) {
                var end = await run($("#fileurl").val());
                var w = end.width;
                var h = end.height;
                $.post('https://snipe-portablescreens/PrintDocument', JSON.stringify({
                        url: $("#fileurl").val(),
                        width: w,
                        height: h
                }));
            } else {
                $.post('https://snipe-portablescreens/Invalid');
            }
        }
        else{
            $.post('https://snipe-portablescreens/Invalid');
        }
    } else {
        $.post('https://snipe-portablescreens/Invalid');
    }
    
}
