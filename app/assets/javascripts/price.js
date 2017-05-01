function tt(){
    var url = document.location.origin + "/home/page_price?" 
    var categories = ""
    var price = $("#price_result").text()
    $("#category_result span").each(function(i, tag){
        if(i==0){
            categories = $(tag).text().slice(0, -2); 
        }else{
            categories = categories + "," + $(tag).text().slice(0, -2); 
        }
    })
    url = url + "search_product_name=" + $(".option_name #right input").val() + "&categories=" + categories 
    + "&lowest_price=" + $("#lowest").val() + "&highest_price=" + $("#highest").val()
    window.location.href = url;
}
$(document).ready(function(){
    $(".option_name #right input").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	tt();
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
   	$('#man').mouseenter(function(){
		$('#man').css("font-weight", "bold")	
		$('#temp1').css("display", "inline-block")	
		$('#woman').css("font-weight", "normal")
		$('#condom').css("font-weight", "normal")
		$('#temp2').css("display", "none")
		$('#temp3').css("display", "none")
	})
	$('#woman').mouseenter(function(){
		$('#man').css("font-weight", "normal")	
		$('#condom').css("font-weight", "normal")	
		$('#temp1').css("display", "none")	
		$('#temp3').css("display", "none")
		$('#woman').css("font-weight", "bold")	
		$('#temp2').css("display", "inline-block")	
	})
	$('#condom').mouseenter(function(){
		$('#condom').css("font-weight", "bold")	
		$('#temp1').css("display", "none")	
		$('#temp2').css("display", "none")	
		$('#woman').css("font-weight", "normal")
		$('#man').css("font-weight", "normal")
		$('#temp3').css("display", "inline-block")	
	})
	$(".content .inner .top_menu .search .option_category li").click(function(event){
        var temp = true
        var text = $(this).text()
        $(".options span").each(function(i, tag){
            if($(tag).text().includes(text)){
                temp = false
            }
        })
        if(temp == true){
           var tag = document.createElement("span");
            tag.appendChild(document.createTextNode($(this).text()+" x"));
       		$("#category_result").append(tag);
       		$(tag).on("click", func1)
       		event.stopImmediatePropagation(); 
        }
   });
   $(".content .inner .top_menu .search .option_category #sub").click(function(event){
        var temp = true
        var text = $(this).text()
        $(".options span").each(function(i, tag){
            if($(tag).text().includes(text)){
                temp = false
            }
        })
        if(temp == true){
           var tag = document.createElement("span");
            tag.appendChild(document.createTextNode($(this).text()+" x"));
       		$("#category_result").append(tag);
       		$(tag).on("click", func1)
       		event.stopImmediatePropagation(); 
        }
   });
   $(".content .inner .top_menu .search .option_price #right span").click(function(){
   		$("#price_result").text($(this).text()+" x");
   		if($(this).text()=="~1만원"){
   		     $("#highest").val("10000")
   		}else if($(this).text()=="~5만원"){
   		     $("#highest").val("50000")
   		}else if($(this).text()=="~10만원"){
   		     $("#highest").val("100000")
   		}else if($(this).text()=="~50만원"){
   		     $("#highest").val("500000")
   		}
   });
   $(".content .inner .top_menu .search .option_price #right #lowest").keyup(function(){
   		$("#price_result").text($(".content .inner .top_menu .search .option_price #right #lowest").val() + "원 ~ " + $(".content .inner .top_menu .search .option_price #right #highest").val() + "원 x");
   });
   $(".content .inner .top_menu .search .option_price #right #highest").keyup(function(){
   		$("#price_result").text($(".content .inner .top_menu .search .option_price #right #lowest").val() + "원 ~ " + $(".content .inner .top_menu .search .option_price #right #highest").val() + "원 x");
   });
   $(".content .inner .top_menu .search .option_price #right #lowest").click(function(){
   		$("#price_result").text($(".content .inner .top_menu .search .option_price #right #lowest").val() + "원 ~ " + $(".content .inner .top_menu .search .option_price #right #highest").val() + "원 x");
   });
   $(".content .inner .top_menu .search .option_price #right #highest").click(function(){
   		$("#price_result").text($(".content .inner .top_menu .search .option_price #right #lowest").val() + "원 ~ " + $(".content .inner .top_menu .search .option_price #right #highest").val() + "원 x");
   });
   function func1(){
       $(this).remove();
   }
   $("#price_result").click(function(){
       $("#price_result").text("")
   });
});