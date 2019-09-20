const http = require('http');
const os = require('os');

var handler = function(request, response) {
	console.log("Received request from " + request.connection.remoteAddress);
	response.writeHead(200);
	response.end("Hi you V2! we are on " + os.hostname() + "\n");
};

var www = http.createServer(handler);
www.listen(8080);

