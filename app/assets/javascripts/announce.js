$(document).ready(function(){
    $(".announce").each(function(i, tag){
        if($(tag).attr("target")=="y"){
            var curHeight = $(this).height();
    	    $(this).css('height', 'auto');
    	    var autoHeight = $(this).height()+30;
			$(this).height(curHeight).animate({height: autoHeight}, 500)
			$('html, body').animate({scrollTop: $(this).offset().top-80}, 500);
        }
    });
	$(".announce").click(function(){
		if($(this).css("height")=="55px"){
		    var curHeight = $(this).height();
    	    $(this).css('height', 'auto');
    	    var autoHeight = $(this).height()+30;
			$(this).height(curHeight).animate({height: autoHeight}, 500)
		} else if($(this).css("height")!="55px"){
			$(this).animate({height: "55px"}, 500)
		}
	});
	$(document).scroll(function(){
       var topScroll = $(document).scrollTop();
       var frontHeight = parseInt($(".front").css("height"))-65;
       if(topScroll > frontHeight){
           $(".nav").css("background-color", "white");
           $(".nav").css("box-shadow", "0px 2px 2px #969ca2");
           $(".nav .inner .search #text").css("border", "2px solid #34404b");
           $(".nav .inner .page_menu li a").css("color", "#34404b");
           $(".nav .inner #communityDiv a").css("color", "#34404b");
       }else{
           $(".nav").css("background-color", "");
           $(".nav").css("box-shadow", "");
           $(".nav .inner .search #text").css("border", "2px solid white");
           $(".nav .inner .page_menu li a").css("color", "white");
           $(".nav .inner #communityDiv a").css("color", "white");
       }
   });
});