$(document).ready(function(){
	var t_left;
	var t_top;
	$(".sojoong2talk").each(function(i, tag){
        if($(tag).attr("target")=="y"){
            var temp = Math.round($(this).width());
			var src_content = "/assets/sojoong2talk/sojoong2talk" + $(this).attr("id") +"_content.png"
			var src_mini = "/assets/sojoong2talk/sojoong2talk" + $(this).attr("id") +".png"
			var height = $(this).attr("high")
			if(temp==230&&$(this).attr("high")!="4"){
				t_left = $(this).css("left");
				t_top = $(this).css("top");
				$(".sojoong2talk").css("width", "230px");
				$(".sojoong2talk").css("height", "230px");
				$(".sojoong2talk").css("padding", "0");
				$(".sojoong2talk").css("z-index", "0");
				$(this).find("img").attr("src", src_content);
				$(".list_container").animate({height: height},500);
				$(this).css("z-index", "1");
				$(this).find("img").css("width", "480px");
				$(this).animate({left: "0", padding: "20px", width: "960px", height: height},500);	
				$('html, body').animate({scrollTop: $(this).offset().top - 80}, 500);
			}else if(temp==920){
				$(this).animate({left: t_left, top: t_top, padding: "0", width: "230px", height: "230px"},500);
				$(".list_container").animate({height: "230px"},500);
				$(this).find("img").attr("src", src_mini);
				$(this).find("img").css("width", "230px");
			}
        }
    });
	$(".sojoong2talk").click(function(){
		var temp = Math.round($(this).width());
		var src_content = "/assets/sojoong2talk/sojoong2talk" + $(this).attr("id") +"_content.png"
		var src_mini = "/assets/sojoong2talk/sojoong2talk" + $(this).attr("id") +".png"
		var height = $(this).attr("high")
		if(temp==230&&$(this).attr("high")!="4"){
			t_left = $(this).css("left");
			t_top = $(this).css("top");
			$(".sojoong2talk").css("width", "230px");
			$(".sojoong2talk").css("height", "230px");
			$(".sojoong2talk").css("padding", "0");
			$(".sojoong2talk").css("z-index", "0");
			$(this).find("img").attr("src", src_content);
			$(".list_container").animate({height: height},500);
			$(this).css("z-index", "1");
			$(this).find("img").css("width", "480px");
			$(this).animate({left: "0", padding: "20px", width: "960px", height: height},500);	
		}else if(temp==920){
			$(this).animate({left: t_left, top: t_top, padding: "0", width: "230px", height: "230px"},500);
			$(".list_container").animate({height: "230px"},500);
			$(this).find("img").attr("src", src_mini);
			$(this).find("img").css("width", "230px");
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