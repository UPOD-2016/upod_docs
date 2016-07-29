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
		extensions: ["asciimath2jax.js"],
		delayStartupUntil: "configured",
		asciimath2jax: {
			delimiters: [['`','`']]
		},
		skipStartupTypeset: true,
		showProcessingMessages: false,
		showMathMenu: false,
		//http://docs.mathjax.org/en/latest/reference/CSS-styles.html#css-style-objects
		//style information http://docs.mathjax.org/en/latest/options/CommonHTML.html
		styles: {
			".MathJax_CHTML": {
				"text-align": "center",
				"font-size" : "100%"
			}
		},
		displayAlign: "center",
		CommonHTML: {
			scale: 100
		},
		linebreaks: {
			automatic: true
		}
	};
})();