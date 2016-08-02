
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
    $(".fillinthegapsdropdown .indicator-container").css( "display" , "none");
    $(".fillinthegapsdropdown p.answer").css({"position":"absolute","display":"block","color":"transparent"});
    
    $(".fillinthegapsdropdown p.answer").each(function () {
        $(this).change(function () {
            if ((this.innerText).length !== 0) {
                $(this).parent().find("select option").prop('selected', false);
                $(this).parent().find("select option:contains('" + this.innerText + "')").prop('selected', true);
                $(this).parent().find("select").css("color","green");
            }
            else {
                $(this).parent().find("select option").prop('selected', false);
                $($(this).parent().find("select option")[0]).prop('selected', true);
                $(this).parent().find("select").css("color","black");
            }
        });
    });        