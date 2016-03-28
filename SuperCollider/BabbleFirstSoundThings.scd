//beginning, no sound


//Sermon, start to add backing track

p.fadeTime=3
//trigger this
(
~back1 = {Pan2.ar(Warp1.ar(1,d[\water][3],SinOsc.kr(0.01),1,0.5,-1,8,0,4,0.3),SinOsc.kr(0.31),XLine.kr(0.00001,1,120))};
~back1x = {Pan2.ar(Warp1.ar(1,d[\water][3],SinOsc.kr(0.08),1,0.1,-1,8,0,4,0.1),SinOsc.kr(0.3),XLine.kr(0.00001,1,160))};
~back2 = {Pan2.ar(Mix.ar(PlayBuf.ar(2,d[\water][2],1,1,0,1)*EnvGen.ar(Env.perc(0.3,0.3),Dust.kr(0.5)),LFNoise1.kr(0.5)),LFNoise1.kr(0.1),XLine.kr(0.00001,1,240))};
~back1.play;
~back1x.play;
~back2.play;
)

//edit here
(
~back1 = {arg amp=2; Pan2.ar(Warp1.ar(1,d[\water][3],SinOsc.kr(0.01),1,0.5,-1,8,0,4,0.3),SinOsc.kr(0.31),amp)};
~back1x = {arg amp=3; Pan2.ar(Warp1.ar(1,d[\water][3],SinOsc.kr(0.08),1,0.1,-1,8,0,4,0.1),SinOsc.kr(0.3),amp)};
~back2 = {arg amp=1; Pan2.ar(Mix.ar(PlayBuf.ar(2,d[\water][2],1,1,0,1)*EnvGen.ar(Env.perc(0.3,0.3),Dust.kr(0.5)),LFNoise1.kr(0.5)),LFNoise1.kr(0.1),amp)};
~back1.play;
~back1x.play;
~back2.play;
)

(
//have this fade up
~suntask = Task({
	40.do({ arg fq;
		fq = [80,160,160,160,160,320,320].choose;
~sun = {arg amp = 0.2; Splay.ar(SinOscFB.ar(Array.fill(15,{rrand(160,1600*1.5).round(fq)})/4,LFNoise1.kr(Array.fill(15,rrand(0.1,0.5)),3).abs,amp))};
		rrand(1,10).wait;
	});
}).start;
~sun.fadeTime=10;
~sun.play
)


(
//this will quieten the whole thing down.
~back1.stop(5);
~back1x.stop(10);
~back2.stop(20);
~sun.stop(60);
)

(
~back1.clear;
~back1x.clear;
~back2.clear;
~sun.clear;
)







// PRAYER

//start the drones
//THE TEXT! THE TEXT!

//drones

s.scope

~fund.fadeTime=15

///////////////////////////////////////////////////////////////////
//!!!!!!!!!!!!!!!!!! DO THIS OR IT WONT FUCKING WORK!!!!!!!//////
//////////////////////////////////////////////////////////////////
//gradually increase the fundamental frequency
~fund = 60

~fund=1

p.fadeTime=3

~drn3.play


~drn1 = {arg intensity = 40.3, amp= 1; DFM1.ar(SinOsc.ar([~fund+LFNoise1.kr(0.1),~fund+LFNoise1.kr(0.1)],0,0.3),[~fund,~fund*1.02],Saw.kr(LFNoise1.kr(0.1)).range(0.01,intensity),1,0,0.00002,amp)};

~drn2 = {arg intensity = 12.8, amp=0.9; DFM1.ar(SinOsc.ar([(~fund*2)+LFNoise1.kr(0.1),(~fund*2)+LFNoise1.kr(0.1)],0,0.3),[~fund*2,(~fund*2)*1.01],Saw.kr(LFNoise1.kr(0.1)).range(0.01,intensity),1,0,0.00002,amp)};

~drn3 = {arg intensity1 = 19, intensity2 = 18, amp=0.1; DFM1.ar(DFM1.ar(SinOsc.ar([~fund+LFNoise1.kr(0.1),~fund+LFNoise1.kr(0.1)],0,0.3),[~fund*2.5,(~fund*2.5)*1.01],Saw.kr(LFNoise1.kr(0.1)).range(0.01,intensity1),1,0,0.00002,0.2),~fund*2.5,LFNoise1.kr(0.4,intensity2).abs,1,0,0.0001,amp)};


(
~drn1.play;
~drn2.play;
~drn3.play;
)
~drn1.stop

/*

FOR THE END, SEE LIGHTING FILE

WAIT FOR CHARLIE TO RETURN TO THE CENTER

*/

~fund.fadeTime=2
~fund = 510

~drnx = {arg amp=0.3; Pan2.ar(DFM1.ar(WhiteNoise.ar(0.5),LFNoise1.kr(1).range(~fund,~fund*20).round(~fund*2),LFNoise1.kr(0.2,2).abs,1,0,0.004,amp))}

~drnx.play


~drn5 = {arg amp=0.08; Pan2.ar(Mix.ar(DFM1.ar(SinOsc.ar(~fund,0,0.1),[5,10,15,20,25,30,35]*~fund,LFNoise1.kr([0.1,0.11,0.12,0.13,0.14,0.15,0.16],4),1,0,0.00004,amp)))}

~drn5.play

~kick = Pbind(\instrument,\bplay,\buf,d[\kick][0],\rate,0.5,\dur,Pwhite(0.25,1.5).round(0.25)*4,\amp,1)

~snare = Pbind(\instrument,\bplay,\buf,d[\clap][1],\rate,0.7,\dur,Pwhite(0.25,1.5).round(0.25)*8,\amp,1)


~drn3.play


~drn1.clear

~kick.play
~snare.play



~drn3.play



//TEXT MANIPULATION
(
~warp1 = {arg amp = 2.3, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],pos,rate,0.2,interp:4),posx,amp)};
~warp2 = {arg amp = 2.3, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],pos,rate,0.2,interp:4),posx,amp)};
~warp3 = {arg amp = 2, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],pos,rate,0.2,interp:4),posx,amp)};

OSCdef(\warpx,{|msg| ~warp1.set(\pos,msg[1].linlin(0,700,0,1.0))},'/x');
OSCdef(\warpy,{|msg| ~warp2.set(\pos,msg[1].linlin(0,700,0,1.0))},'/y');
OSCdef(\warpz,{|msg| ~warp3.set(\pos,msg[1].linlin(0,700,0,1.0))},'/z');
)
(
~warp1.play;
~warp2.play;
~warp3.play;
)

//HAVE A WARP WITH NOISE
(
~warp1 = {arg amp = 2.3, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],LFNoise1.kr(LFNoise1.kr(0.1).range(0.1,1),1).abs,interp:4),posx,amp)};
~warp2 = {arg amp = 2.3, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],LFNoise1.kr(LFNoise1.kr(0.1).range(0.1,1),1).abs,rate,0.2,interp:4),posx,amp)};
~warp3 = {arg amp = 2, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\tome],LFNoise1.kr(LFNoise1.kr(0.1).range(0.1,1),1).abs,rate,0.2,interp:4),posx,amp)};
)



(
~warp1.stop;
~warp2.stop;
~warp3.stop;
)


(
~warp1.clear;
~warp2.clear;
~warp3.clear;
)


//water splash

//using the grabbing of d as a function
//if statement added as a gate, because fuck off gate Ugens
(
var prev = 0;
q = { |in|
    var result = in - prev;
    prev = in;
    result;
	result = if ( result < 300, {0},{result});
};
) //write a circular buffer in here

//grabs the difference in values in the x1 stream
//x1 works better than x for gestural data, possibly because of higher resolution?
(
OSCdef(\xdiff, {|msg| ~splash.set(\amp,q.(msg[1]))},\x1);
~splash = {arg amp = 0.5; PlayBuf.ar(2,d[\water][3],1,1,0,1,0)*Lag.kr(amp/100,0.5)};
~splash.play;
)

~splash.stop



//COMMITTAL

(
~drn1.stop(2);
~drn2.stop(2);
~drn3.stop(2);
~drnx.stop(2);
~drn5.stop(2);
)