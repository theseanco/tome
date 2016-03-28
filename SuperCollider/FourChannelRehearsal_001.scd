(
o=ServerOptions.new;
s.options=o;
// Server.local.options.device = "MOTU Traveler";
Server.local.options.memSize * 128;
o.numOutputBusChannels = 4;
s.options.numBuffers=4000;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 1;
)

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

