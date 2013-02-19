$(document).ready(function()
{
	var toc = $("#toc").tocify({ selectors: "h2,h3" }).data("tocify");
	                 
	toc.setOption("showEffect", "none");
	toc.setOption("showAndHide", "false");
	toc.setOption("extendPage", "false");
})
