$(".fillinthegaps span input").each(function(){
	$(this.parentNode.parentNode.parentNode).css({"display":"inline-block","margin":0});
	$(this).css({ "height":25,"font-size":15,"min-width":0,"width":110 });
});
$(".fillinthegaps span.status").css({"display":"none"});
$(".fillinthegaps p.answer").css({"position":"absolute","display":"block","color":"transparent"});
$(".fillinthegaps p.answer").each(function() {
	$(this).bind("DOMSubtreeModified",function(){
		if ((this.innerText).length !== 0) {
			$(this.parentNode.getElementsByTagName("input")[0]).css({ "color":"#27b727", "font-style":"italic" });
			this.parentNode.getElementsByTagName("input")[0].value = this.innerText;
		}
		else {
			$(this.parentNode.getElementsByTagName("input")[0]).val("");
			$(this.parentNode.getElementsByTagName("input")[0]).css({ "color":"#333", "font-style":"normal" });
		}
		
	});
});
$(".fillinthegaps p").css("display","inline");