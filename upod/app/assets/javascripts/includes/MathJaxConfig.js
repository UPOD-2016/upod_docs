/*
* This file must be included before mathjax is loaded for the effects to take place
* common configurations http://docs.mathjax.org/en/latest/config-files.html#common-configurations
* list of configuration options http://docs.mathjax.org/en/latest/options/hub.html#configure-hub
* delayStartupUntil=configured
*/
(function(){	

	window.MathJax = {
		//jax: to_mathjax_path(["input/AsciiMath","output/CommonHTML"]),
		jax: ["input/AsciiMath","output/CommonHTML"],
		//extensions: to_mathjax_path(["asciimath2jax.js","MathMenu.js","MathZoom.js","AssistiveMML.js"]),
		extensions: ["asciimath2jax.js","MathMenu.js","MathZoom.js"],
		delayStartupUntil: "configured",
		skipStartupTypeset: false,
		showProcessingMessages: true,
		showMathMenu: false,
		displayAlign: "center"
	};
})();