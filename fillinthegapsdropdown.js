$(document).ready( function() {
  	$(".fillinthegapsdropdown span").css({ "margin":0,"margin-top":-5 });
    $(".fillinthegapsdropdown form").css({ "margin":0,"margin-top":-5 });
    $(".fillinthegapsdropdown .incorrect").each( function() {
    	$($(this.parentNode.parentNode).find("select")[0]).css("border","1px solid red");
    	$(this.parentNode).css("display","none");
    });
    $(".fillinthegapsdropdown .correct").each( function() {
    	$($(this.parentNode.parentNode).find("select")[0]).css("border","1px solid green");
    	$(this.parentNode).css("display","none");
    });
    $(".fillinthegapsdropdown div.nobreak").css({"display":"inline-block","vertical-align":"middle"});
    $(".fillinthegapsdropdown p.answer").css( "display" , "none");
    $(".fillinthegapsdropdown .indicator-container").css( "display" , "none");
        
  });