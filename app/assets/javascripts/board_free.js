$(document).ready(function(){
    $(".free").each(function(i, tag){
        if($(tag).attr("target")=="y"){
            var curHeight = $(tag).height();
	        $(tag).css('height', 'auto');
	        var autoHeight = $(tag).height()+30;
			$(tag).height(curHeight).animate({height: autoHeight}, 500)
			$('html, body').animate({scrollTop: $(this).offset().top-80}, 500);
        }
    });
	$(".open").click(function(){
		var tag = $(this).parents(".free")[0]
		if($(tag).css("height")=="60px"){
		    var curHeight = $(tag).height();
	        $(tag).css('height', 'auto');
	        var autoHeight = $(tag).height()+30;
			$(tag).height(curHeight).animate({height: autoHeight}, 500)
 		}
	});
	$(".f_close").click(function(){
		var tag = $(this).parents(".free")[0]
		if($(tag).css("height")!="60px"){
		    $(tag).animate({height: "60px"}, 500)
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
           $(".nav .inner #logo").css("background-image", 'url("/assets/nav_logo_black.png")');
           $(".nav .inner .search #submit").css("background-image", 'url("/assets/search_ico_black.png")');
           $(".nav .inner #communityDiv a").css("color", "#34404b");
       }else{
           $(".nav").css("background-color", "");
           $(".nav").css("box-shadow", "");
           $(".nav .inner .search #text").css("border", "2px solid white");
           $(".nav .inner .page_menu li a").css("color", "white");
           $(".nav .inner #logo").css("background-image", 'url("/assets/nav_logo_white.png")');
           $(".nav .inner .search #submit").css("background-image", 'url("/assets/search_ico_white.png")');
           $(".nav .inner #communityDiv a").css("color", "white");
       }
    });
});