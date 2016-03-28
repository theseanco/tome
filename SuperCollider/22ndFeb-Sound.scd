p.fadeTime=3


//Controls of warp pointer position and
(
OSCdef(\warpx,{|msg| ~warp1.set(\pos,msg[1].linlin(0,700,0.1,0.9))},'/x');

OSCdef(\warpy,{|msg| ~warp1.set(\rate,msg[1].linlin(0,700,0.6,1.4))},'/y');

OSCdef(\warpz,{|msg| ~warp1.set(\sos,msg[1].linlin(0,700,0,1.0))},'/z');

OSCdef(\warpxp,{|msg| ~warp1.set(\posx,msg[1].linlin(-17000,17000,-1.5,1.5))},'/x1');

OSCdef(\warpyp,{|msg| ~warp1.set(\posy,msg[1].linlin(-17000,17000,-1.0,1.0))},'/y1');

OSCdef(\warpzp,{|msg| ~warp1.set(\pitch,msg[1].linlin(-17000,17000,0.2,1.8))},'/z1');
)

OSCdef.trace(false)

~warp1 = {arg amp = 0.2, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan4.ar(Warp1.ar(1,d[\tome2],pos,rate,0.2,interp:4),posx,posy,amp)}

~warp2 = {arg amp = 0.1, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan4.ar(Warp1.ar(1,d[\p1],pos,rate,0.2,interp:4),posx,posy,amp)}

~warp3 = {arg amp = 0.1, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan4.ar(Warp1.ar(1,d[\p1],pos,rate,0.2,interp:4),posx,posy,amp)}

~fieldrecording = {PanAz.ar(4,Warp1.ar(1,d[\fieldrecording],SinOsc.kr(0.01),1,0.3),SinOsc.kr(0.3).unipolar,0.1)}
~fieldrecording2 = {PanAz.ar(4,PlayBuf.ar(1,d[\fieldrecording],LFNoise1.kr(0.1).range(1.8,8.5),1,0,1),SinOsc.kr(LFNoise1.kr(0.3,2)).unipolar,0.1)}



s.scope

~fieldrecording2.play


~warp1.stop;
~warp1.play;





~warp1 = {arg amp = 4, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\p1],pos,rate,0.2,interp:4),posx,amp)}
~warp2 = {arg amp = 0.8, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\p1],pos,rate,0.2,interp:4),posx,amp)}
~warp3 = {arg amp = 0.8, posx = 0.5, posy = 0.5, pos = 0.01, rate = 1; Pan2.ar(Warp1.ar(1,d[\p1],pos,rate,0.2,interp:4),posx,amp)}


~warp1.play

~one.stop

~warp3.stop



OSCdef(\warpx,{|msg| ~warp1.set(\pos,msg[1].linlin(0,700,0,1.0))},'/x')
OSCdef(\warpy,{|msg| ~warp2.set(\pos,msg[1].linlin(0,700,0,1.0))},'/y')
OSCdef(\warpz,{|msg| ~warp3.set(\pos,msg[1].linlin(0,700,0,1.0))},'/z')