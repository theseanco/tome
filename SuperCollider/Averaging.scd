p=ProxySpace.push(s)

//Abstraction of the thing.

//generates random values
~sig = {LFNoise0.kr(4,900,300)}

~sig.play

//sets the frequency of a sine wave to the lag of those values. This is basically a circular buffer
~xo = {SinOsc.ar(Lag.kr(~sig.kr,20,1).poll(100),0,0.2)}

~xo.play

//What I need is a circular buffer Lag on this xvolavg, but also a difference trigger, which will grab the difference to detect actual movement.


OSCdef(\fieldrecvolume,{|msg| ~xvolavg.set(\val,msg[1])},'/x1')

~xvolavg = {arg val = 0; Lag.kr(val,1,1).poll(50)}

~one = {arg amp = 0.5; PlayBuf.ar(2,d[\fieldrecording],1,1,0,1,0)*amp}

~one.play

s.scope