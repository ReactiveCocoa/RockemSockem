function connect() {
	if ("WebSocket" in window) {
		var ws = new WebSocket("ws://localhost:12345/");
		ws.onopen = function() {
			ws.send("Sock it to whom?");
		};

		ws.onmessage = function(event) {
			document.getElementById("content").innerHTML = event.data;
		};

		ws.onclose = function() {
			// Cool. Coolcoolcool.
		};
	} else {
		alert("Sorry bro, this browser doesn't seem to support WebSocket :(");
	}
}
