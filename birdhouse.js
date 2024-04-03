const http    = require('http');
const express = require('express');

const Broadcaster = require('./raspivid-broadcaster');

const app = express();
app.use(express.static(__dirname + '/site'));
const httpServer = http.createServer(app);
httpServer.listen(80);

new Broadcaster({width: 1280, height: 960, awb: 'off', awbgains: '2.0,2.0', brightness: 58, contrast: 25, drc: 'high', ISO: 1600, ev: 10, shutter: 180000, saturation: -100, framerate: 12, port: 8080});
// new Broadcaster({width: 640, height: 480, awb: 'off', awbgains: '1.5,1.2', ISO: 0, shutter: 1000000, framerate: 1, port: 8080});
// ex: off, ss: 20833, fps: 24 -o /home/pi/Videos/211023112611.h264 -co 0 -br 50 -awb off -awbg 1.5,1.2 -ISO 0
