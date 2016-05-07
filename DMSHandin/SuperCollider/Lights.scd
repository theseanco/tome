//OPENING SECTION
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


//A task to bring the fundamental frequency down to a low rumble as well as stopping all proxies running non-synthesised music from the Sound section
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


//final words, after Charlie has put the mic back on the stand

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


//Set of functions to fade out the lights as Charlie de-suits, with the aim of reaching darkness by the time he has taken the suit off
(
OSCdef(\m1,{0});
OSCdef(\m2,{0});
OSCdef(\m3,{0});
OSCdef(\m4,{0});
//taking off suit
c.knob9.onChanged = {|val| b.sendMsg("/l1m/", val.linlin(0,127,0,255).asInt); b.sendMsg("/l2m/", val.linlin(0,127,0,255).asInt); b.sendMsg("/l3m/", val.linlin(0,127,0,255).asInt); b.sendMsg("/l4m/", val.linlin(0,127,0,255).asInt);}
)