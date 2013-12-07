// allows you to export join, leave, and sendMessage function for users
var globals = require('./globals')
	, rand = require("generate-key");

var queue = globals.queue;
var users = globals.users;
var isConnected = globals.isConnected;

var config = require('./config').matching;
var crit = Math.pow(config.decay, config.critical) * config.threshhold;

var join = function (socket) {
	socket.emit('notif', "Finding you a partner...");
	var able = local_join(socket, config.threshhold);
	if (able) {
		var room = socket.room;
		var partner = users[socket.pid]
		socket.emit('match', partner.github, room);
		partner.emit('match', socket.github, room);
		return true;
	}
	return false;
}

var leave = function (socket) {	
	if(isConnected(socket)) {
		var partner = users[socket.pid];
		socket.leave(socket.room);
		partner.leave(partner.room);
		delete partner.pid;
		delete partner.room;
		partner.emit('solo', false);
	}
	delete socket.pid;
	delete socket.room;
	socket.emit("solo", true);
}

var sendMessage = function (socket, message) {
	if(isConnected(socket)) {
		users[socket.pid].emit('updatechat', false, message);
	}
	socket.emit('updatechat', true, message);
}


// local functions
var local_join = function (socket, thresh) {
	if(queue.length == 0 || thresh < crit) {
		if(thresh < crit)
			socket.emit('notif', "Finding a partner is taking longer than expected...");
		if(socket.room !== undefined)
			queue.push(socket.id);
	} else {
		var part_id = queue.pop();
		var partner = users[part_id];
		if(compare(partner, socket) < thresh) {
			queue.push(part_id);
			return local_join(socket, thresh * config.decay);
		} else {
			var room = rand.generateKey(10);
			partner.room = room;
			socket.room = room;
			partner.pid = socket.id;
			socket.pid = partner.id;
			partner.join(room);
			socket.join(room);
			return true;
		}
	}
	return false;
}

var compare = function (partner, self) {
	return 1.0;
}


module.exports.join = join;
module.exports.leave = leave;
module.exports.sendMessage = sendMessage;