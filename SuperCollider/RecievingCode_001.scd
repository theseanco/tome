//StageLimiter requires BatLib Quark

//To use:
//execute this
(
(
SynthDef(\sinblip,
	{
		arg freq = 8000, b1 = 1.01, b2 = 0.99, b3 = 1.02;
		var sig, env;
		env = EnvGen.ar(Env.perc(0.01,Rand(0.05,0.3)),1,1,0,1,2);
		sig = Splay.ar(SinOsc.ar([freq,freq*b1,freq*b2,freq*b3]+(env*Rand(-500,2000)),0,0.6));
		sig = sig * env;
		Out.ar(0,sig);
}).add;
);

(
SynthDef(\sinthunk,
	{
		arg freq=100, t1 = 1.05, t2 = 0.95, t3 = 1.1, t4 = 0.9;
		var sig, env;
		sig = Splay.ar(SinOscFB.ar([freq,freq*t1,freq*t2,freq*t3,freq*t4],Rand(0,0.9),0.7));
		env = EnvGen.ar(Env.perc(0.01,Rand(5,10)),1,1,0,1,2);
		sig = sig * env;
		Out.ar(0,sig)
}).add;
)
)

Synth.new(\sinblip)


(
SynthDef(\sinosc,
	{
		arg freq=440;
		var sig , env;
		sig = SinOsc.ar(freq,0,0.1);
		env = EnvGen.ar(Env.perc(0.01,0.01));
		sig = sig * env;
		Out.ar(0,sig)
}).add;
)

//then execute this
(
StageLimiter.activate;

~freq = 8000;
~b1 = 1.01;
~b2 = 0.99;
~b3 = 1.02;
~t1 = 1.05;
~t2 = 0.95;
~t3 = 1.1;
~t4 = 0.9;

~whois = OSCFunc({|msg| Synth.new(\sinblip,[\freq,~freq,\b1,~b1,\b2,~b2,\b3,~b3])},'/scwhois');


//function to turn X into sound
~xfunc = OSCFunc({|msg| ~eon.set(\pos,msg[1].linlin(0,1023,0,1.0))},'/x')

OSCdef(\gsrswitch1,{|msg| ~one.set(\amp,msg[1].linlin(0,1023,0,1))},'/gsr')

OSCdef(\ydetune,{|msg| ~one.set(\detune,msg[1].linlin(0,1023,0,1))},'/y')

OSCdef(\xfreq,{|msg| ~one.set(\freq,msg[1].linlin(0,1023,100,200.0))},'/x')

OSCdef(\accx,{|msg| ~accx.set(\freq,msg[1])},'/x')
OSCdef(\accy,{|msg| ~accy.set(\freq,msg[1])},'/y')
OSCdef(\accz,{|msg| ~accz.set(\freq,msg[1])},'/z')


OSCdef(\warpx,{|msg| ~eon.set(\pos,msg[1].linlin(0,700,0,1.0))},'/x')
OSCdef(\warpy,{|msg| ~eon2.set(\pos,msg[1].linlin(0,700,0,1.0))},'/y')
OSCdef(\warpz,{|msg| ~eon3.set(\pos,msg[1].linlin(0,700,0,1.0))},'/z')

OSCdef(\warpxp,{|msg| ~eon.set(\pitch,msg[1].linlin(-17000,17000,0.2,1.8))},'/x1')
OSCdef(\warpyp,{|msg| ~eon2.set(\pitch,msg[1].linlin(-17000,17000,0.2,1.8))},'/y1')
OSCdef(\warpzp,{|msg| ~eon3.set(\pitch,msg[1].linlin(-17000,17000,0.2,1.8))},'/z1')

~amp = 1


~accx.play
~accy.play
~accz.play


~accx.stop
~accy.stop
~accz.stop


~one.clear

~accx = {arg freq = 440; SinOsc.ar(freq,0,0.1)}
~accy = {arg freq = 440; Saw.ar(freq,0.1)}
~accz = {arg freq = 440; PulseDPW.ar(freq,0.5,0.1)}


OSCFunc({|msg| ~one.set(\detune,msg[1].linlin(0,1023,0,2))},'/gsr')

~gsr = 1

~gsrfunc = OSCFunc({|msg| ~gsr.set(\msg[1].linexp(0,1023,0,1.0))},'/gsr')

SendTrig


	~one = Pbind(\instrument,\bpfsaw,\dur,0.1,\amp,0.1,\atk,1,\sus,0.1,\rel,2.1,\detune,1)

~one.play


d[\speech][0].play

NetAddr.langPort

~eon.clear
~eon2.clear
~eon3.clear

~eon3.play

StageLimiter.activate

~eon = {arg pos = 0.3, pitch=1; Pan2.ar(Warp1.ar(1,d[\speech][0],pos,pitch,0.1,-1,8,0,4,~amp))}
~eon2 = {arg pos = 0.3, pitch=1; Pan2.ar(Warp1.ar(1,d[\speech][1],pos,pitch,0.1,-1,8,0,4,~amp))}
~eon3 = {arg pos = 0.3, pitch=1; Pan2.ar(Warp1.ar(1,d[\speech][2],pos,pitch,0.1,-1,8,0,4,~amp))}

d[\fx][8].play

~eon3.play

~xfunc =

Synth.new(\sinosc)

