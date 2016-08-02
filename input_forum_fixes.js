$(document).ready(function(){
	$(".discussion-show.control-button").trigger("click");
	$("input:text").keypress(function() {
		this.value = (this.value).replace(/`/g , "'");
		this.value = (this.value).replace(/´/g , "'");
	});
});