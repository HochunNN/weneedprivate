$(document).ready(function(){
    var min_height = $(".list_container").css("height")
	var top;
	var left;
    $(".sojoong2talk").each(function(i, tag){
        if($(tag).attr("target")=="y"){
            var lc_height;
			top = $(this).css("top"); 
			left = $(this).css("left");
			$(".sojoong2talk").css("z-index", "0");	
			$(this).css("top", "0");
			$(this).css("left", "50%");
			$(this).css("margin-left", "-480px");
			$(this).css("padding", "20px");
			$(this).css("width", "1000px");
			$(this).css("height", "auto");
			$(this).css("z-index", "1");
			$(this).find("#thumbnail").css("display", "none")
			$(this).find("#content").css("display", "inline-block")
			lc_height = $(this).find("#content").height()+40 + "px"
			$(".list_container").css("height", lc_height);
			$('html, body').animate({scrollTop: $(this).offset().top-80}, 500);
        }
    });
	$(".sojoong2talk").click(function(){
		if($(this).find("#content").css("display") == "none"){
			var lc_height;
			top = $(this).css("top"); 
			left = $(this).css("left");
			$(".sojoong2talk").css("z-index", "0");	
			$(this).css("top", "0");
			$(this).css("left", "50%");
			$(this).css("margin-left", "-480px");
			$(this).css("padding", "20px");
			$(this).css("width", "1000px");
			$(this).css("height", "auto");
			$(this).css("z-index", "1");
			$(this).find("#thumbnail").css("display", "none")
			$(this).find("#content").css("display", "inline-block")
			lc_height = $(this).find("#content").height()+40 + "px"
			$(".list_container").css("height", lc_height);
		}else{
			$(this).css("top", top);
			$(this).css("left", left);
			$(this).css("margin-left", "0px");
			$(this).css("padding", "0px");
			$(this).css("width", "230px");
			$(this).css("height", "230px");
			$(this).find("#thumbnail").css("display", "inline-block")
			$(this).find("#content").css("display", "none")
			$(".list_container").css("height", min_height);
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