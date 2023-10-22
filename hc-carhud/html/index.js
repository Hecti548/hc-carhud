$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.isInCoche) {
            $(".todo").addClass('isInCoche');
            $(".velo").html(Math.round(event.data.speed) + "");
            $(".percent-gasofa").css("width", (event.data.gasofa) + "%");
            $(".fueltexto").html(Math.round(event.data.fueltexto) + "");
            $(".vidatexto").html(Math.round(event.data.vidatexto) + "");
            $(".marcha").html(Math.round(event.data.gear) + "");
            if(event.data.vehicleCruiser === "on"){
                $("g").fadeIn();
            }else if(event.data.vehicleCruiser === "off"){
                $("g").fadeOut();
            }
        } else {
            $(".todo").removeClass('isInCoche');
        }
    });
});
