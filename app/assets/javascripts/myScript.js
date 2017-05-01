$(document).ready(function(){
    $(document).mousemove(function(mouse){
        var x = mouse.pageX;
        var y = mouse.pageY;
        var marginTop = $("#community").offset().top;
        var marginRight = $("#community").offset().left + 190;
        var marginBottom = $("#community").offset().top + 50;
        var marginLeft = $("#community").offset().left;
        if($(".nav").css("height")=="65px"){
            if(x>marginLeft&&x<marginRight&&y<marginBottom&&y>marginTop){
                $(".nav").animate({height: "85px"}, 0);
                $("#communityDiv").css("display", "inline-block")
            }
        }else if($(".nav").css("height")=="85px"){
            if(x<marginLeft||x>marginRight||y>marginBottom||y<marginTop){
                $(".nav").animate({height: "65px"}, 0);
                $("#communityDiv").css("display", "none")
            }
        }
    });
    $(document).scroll(function(){
       var topScroll = $(document).scrollTop();
       var frontHeight = parseInt($(".front").css("height"))-65;
       if(topScroll > frontHeight){
           $(".nav .inner .search #text").addClass("temp");
           $(".nav .inner #logo_w").css("display", 'none');
           $(".nav .inner #logo_b").css("display", 'inline-block');
           $(".nav .inner #submit_w").css("display", 'none');
           $(".nav .inner #submit_b").css("display", 'inline-block');
       }else{
           $(".nav .inner .search #text").removeClass("temp");
           $(".nav .inner #logo_w").css("display", 'inline-block');
           $(".nav .inner #logo_b").css("display", 'none');
           $(".nav .inner #submit_w").css("display", 'inline-block');
           $(".nav .inner #submit_b").css("display", 'none');
       }
   });
});
