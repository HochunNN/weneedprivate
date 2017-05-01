$(document).ready(function(){
	$(document).scroll(function(){
       var topScroll = $(document).scrollTop();
       var frontHeight = parseInt($(".front").css("height"))-65;
       if(topScroll > frontHeight){
           $(".nav").css("background-color", "white");
           $(".nav").css("box-shadow", "0px 2px 2px #969ca2");
           $(".nav .inner .search #text").css("border", "2px solid #34404b");
           $(".nav .inner .search #text").addClass("temp");
           $(".nav .inner .page_menu li a").css("color", "#34404b");
           $(".nav .inner #communityDiv a").css("color", "#34404b");
       }else{
           $(".nav").css("background-color", "");
           $(".nav").css("box-shadow", "");
           $(".nav .inner .search #text").css("border", "2px solid white");
           $(".nav .inner .search #text").removeClass("temp");
           $(".nav .inner .page_menu li a").css("color", "white");
           $(".nav .inner #communityDiv a").css("color", "white");
       }
   });
});