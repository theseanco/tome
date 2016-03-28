/*


QLC+ Universe 1 --> OSC input port 7700, output port 9000

    Input Port: If the patched line is opened for input, this parameters defines the port QLC+ will listen to in order to receive OSC data from your external controller.
    Output address: If the patched line is opened for input, this is the destination IP address used to send feedbacks to your external controller.
    If the patched line is opened for output, this is the destination IP address used to send OSC data on the network.
    OSC output packets are composed to obtain an OSC path like the following: /QLC+ universe - 1/dmx/DMX channel - 1
    For example channel 12 of QLC+ universe 4 will have the following path: /3/dmx/11
    All the values transmitted by the OSC plugin use the float type.
    Output port: If the patched line is opened for input, this is the destination port used to send feedbacks to your external controller.
    If the patched line is opened for output, this is the destination port used to send OSC data on the network.




*/


/*



1. The Gathering

--chillin - A bit in the description




2. Readings and Sermon
-stories
-one sentence to sum them up

--chillin, establishing movements which will begin to control aspects of the performance.






3. prayers
- going from the more gestural movement into the movement as the manipulation of the repeated phrase (which needs to be recorded).
- mess to order section


- start to introduce bits of background track at points





4. commendation
-farewell to the story with some text

5. committal
- committing something to rest

6. Dismissal
- something short about a pinch of salt.


Write a custom function for recording speech, so that I can livecode it.


*/


//instant control of all lights by script. I need to write a bunch of these into a library to do things to Charlie's control of the lights.

//OFF

(
b.sendMsg("/l1m/",0);
b.sendMsg("/l2m/",0);
b.sendMsg("/l3m/",0);
b.sendMsg("/l4m/",0);
)


//total control, with master
(
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,-10,255).asInt)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",msg[1].linlin(-12000,12000,-10,255).asInt)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",msg[1].linlin(-12000,12000,-10,255).asInt)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",msg[1].linlin(-12000,12000,-10,255).asInt)},\z1);
)



//OPENING
(
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",msg[1].linlin(-14000,14000,10,80).asInt)},\x);
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",msg[1].linlin(-14000,14000,40,255).asInt)},\y);
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",msg[1].linlin(-14000,14000,30,100).asInt)},\z);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",msg[1].linlin(-14000,14000,10,80).asInt)},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",msg[1].linlin(-14000,14000,40,255).asInt)},\y);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",msg[1].linlin(-14000,14000,30,100).asInt)},\z);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",msg[1].linlin(-14000,14000,10,80).asInt)},\x);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",msg[1].linlin(-14000,14000,40,255).asInt)},\y);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",msg[1].linlin(-14000,14000,30,100).asInt)},\z);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",msg[1].linlin(-14000,14000,10,80).asInt)},\x);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",msg[1].linlin(-14000,14000,40,255).asInt)},\y);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",msg[1].linlin(-14000,14000,30,100).asInt)},\z);
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,40,200).asInt)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",msg[1].linlin(-12000,12000,40,200).asInt)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",msg[1].linlin(-12000,12000,40,200).asInt)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",msg[1].linlin(-12000,12000,40,200).asInt)},\z1);
)



//the gathering, chilling, on low, flickering a small bit

//Sermon section, more subtle control overall.
(
//red
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",0)},\x);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",0)},\x);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",0)},\x);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",0)},\x);
//green
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",msg[1].linlin(-14000,14000,10,200).asInt)},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",msg[1].linlin(-14000,14000,10,200).asInt)},\y);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",msg[1].linlin(-14000,14000,10,200).asInt)},\z);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",msg[1].linlin(-14000,14000,10,200).asInt)},\x);
//blue
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",msg[1].linlin(-12000,12000,50,255).asInt)},\x1);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",msg[1].linlin(-12000,12000,50,255).asInt)},\y1);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",msg[1].linlin(-12000,12000,50,255).asInt)},\z1);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",msg[1].linlin(-12000,12000,50,255).asInt)},\x1);
//master
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",200)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",200)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",200)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",200)},\z1);
)

//prayer, including bix complex bit about the seven stages
(
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",msg[1].linlin(-14000,14000,-100,255).asInt)},\x);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",msg[1].linlin(-14000,14000,-100,255).asInt)},\y);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",msg[1].linlin(-14000,14000,-100,255).asInt)},\z);
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,-10,200).asInt)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",msg[1].linlin(-12000,12000,-10,200).asInt)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",msg[1].linlin(-12000,12000,-10,200).asInt)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",msg[1].linlin(-12000,12000,-10,200).asInt)},\z1);
)

/*

THERE NEEDS TO BE STROBING HERE LOL

*/

~fund = 900


//Commendation, bright light and low rumble
(
Task({
	1.do({
		~warp1.stop;
		~warp2.stop;
		~warp3.stop;
		~kick.stop;
		~snare.stop;
		~splash.stop;
		~fund.fadeTime=2;
		~fund = 1;
		2.wait;
		OSCdef(\xl, {|msg| b.sendMsg("/l1r/",255)},\x);
		OSCdef(\yl, {|msg| b.sendMsg("/l1g/",255)},\y);
		OSCdef(\zl, {|msg| b.sendMsg("/l1b/",255)},\z);
		OSCdef(\x2, {|msg| b.sendMsg("/l2r/",255)},\x);
		OSCdef(\y2, {|msg| b.sendMsg("/l2g/",255)},\y);
		OSCdef(\z2, {|msg| b.sendMsg("/l2b/",255)},\z);
		OSCdef(\x3, {|msg| b.sendMsg("/l3r/",255)},\x);
		OSCdef(\y3, {|msg| b.sendMsg("/l3g/",255)},\y);
		OSCdef(\z3, {|msg| b.sendMsg("/l3b/",255)},\z);
		OSCdef(\x4, {|msg| b.sendMsg("/l4r/",255)},\x);
		OSCdef(\y4, {|msg| b.sendMsg("/l4g/",255)},\y);
		OSCdef(\z4, {|msg| b.sendMsg("/l4b/",255)},\z);
		OSCdef(\m1, {|msg| b.sendMsg("/l1m/",255)},\z1);
		OSCdef(\m2, {|msg| b.sendMsg("/l2m/",255)},\z1);
		OSCdef(\m3, {|msg| b.sendMsg("/l3m/",255)},\z1);
		OSCdef(\m4, {|msg| b.sendMsg("/l4m/",255)},\z1);
		OSCdef(\m1, {|msg| b.sendMsg("/l1s/",0)},\z1);
		OSCdef(\m2, {|msg| b.sendMsg("/l2s/",0)},\z1);
		OSCdef(\m3, {|msg| b.sendMsg("/l3s/",0)},\z1);
		OSCdef(\m4, {|msg| b.sendMsg("/l4s/",0)},\z1);
	});
}).start;
)

//then the tome.
//the word unknown is repeated, and gradually degraded



//final words

(
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",msg[1].linlin(-14000,14000,90,255).asInt)},\x);
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",msg[1].linlin(-14000,14000,110,200).asInt)},\y);
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",msg[1].linlin(-14000,14000,100,200).asInt)},\z);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",msg[1].linlin(-14000,14000,40,229).asInt)},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",msg[1].linlin(-14000,14000,70,200).asInt)},\y);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",msg[1].linlin(-14000,14000,125,201).asInt)},\z);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",msg[1].linlin(-14000,14000,125,220).asInt)},\x);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",msg[1].linlin(-14000,14000,101,223).asInt)},\y);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",msg[1].linlin(-14000,14000,80,228).asInt)},\z);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",msg[1].linlin(-14000,14000,122,240).asInt)},\x);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",msg[1].linlin(-14000,14000,100,235).asInt)},\y);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",msg[1].linlin(-14000,14000,102,225).asInt)},\z);
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",msg[1].linlin(-12000,12000,190,255).asInt)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",msg[1].linlin(-12000,12000,180,255).asInt)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",msg[1].linlin(-12000,12000,210,255).asInt)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",msg[1].linlin(-12000,12000,200,255).asInt)},\z1);
)










b = NetAddr("127.0.0.1", 7700)
(
Task({
	256.do({ arg i;
		b.sendMsg("/l1m/", i.linlin(0,255,255,0).asInt);
		b.sendMsg("/l2m/", i.linlin(0,255,255,0).asInt);
		b.sendMsg("/l3m/", i.linlin(0,255,255,0).asInt);
		b.sendMsg("/l4m/", i.linlin(0,255,255,0).asInt);
		0.01.wait;
	});
}).start;
)


(
OSCdef(\xl, {|msg| b.sendMsg("/l1r/",rrand(0,255))},\x);
OSCdef(\yl, {|msg| b.sendMsg("/l1g/",rrand(0,255))},\y);
OSCdef(\zl, {|msg| b.sendMsg("/l1b/",rrand(0,255))},\z);
OSCdef(\x2, {|msg| b.sendMsg("/l2r/",rrand(0,255))},\x);
OSCdef(\y2, {|msg| b.sendMsg("/l2g/",rrand(0,255))},\y);
OSCdef(\z2, {|msg| b.sendMsg("/l2b/",rrand(0,255))},\z);
OSCdef(\x3, {|msg| b.sendMsg("/l3r/",rrand(0,255))},\x);
OSCdef(\y3, {|msg| b.sendMsg("/l3g/",rrand(0,255))},\y);
OSCdef(\z3, {|msg| b.sendMsg("/l3b/",rrand(0,255))},\z);
OSCdef(\x4, {|msg| b.sendMsg("/l4r/",rrand(0,255))},\x);
OSCdef(\y4, {|msg| b.sendMsg("/l4g/",rrand(0,255))},\y);
OSCdef(\z4, {|msg| b.sendMsg("/l4b/",rrand(0,255))},\z);
OSCdef(\m1, {|msg| b.sendMsg("/l1m/",255)},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2m/",255)},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3m/",255)},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4m/",255)},\z1);
OSCdef(\m1, {|msg| b.sendMsg("/l1s/",rrand(0,255))},\z1);
OSCdef(\m2, {|msg| b.sendMsg("/l2s/",rrand(0,255))},\z1);
OSCdef(\m3, {|msg| b.sendMsg("/l3s/",rrand(0,255))},\z1);
OSCdef(\m4, {|msg| b.sendMsg("/l4s/",rrand(0,255))},\z1);
)