/*
* This file must be included before mathjax is loaded for the effects to take place
* common configurations http://docs.mathjax.org/en/latest/config-files.html#common-configurations
* list of configuration options http://docs.mathjax.org/en/latest/options/hub.html#configure-hub
* delayStartupUntil=configured
*/
MathJax.Hub.Config = {
	delayStartupUntil: "configured",
	skipStartupTypeset: true,
	showProcessingMessages: true,
	showMathMenu: false,
	displayAlign: "center"
};

//tell mathjax to start
MathJax.Hub.Configured();