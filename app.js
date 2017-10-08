var nowplaying = require("nowplaying");
console.log('test running');
console.log('logout running');
nowplaying.on("playing", function (data) {
	console.log('playing', data);
});
nowplaying.on("paused", function (data) {
	console.log('paused', data);
});