d[\organ].play

OSCdef(\organx,{|msg| ~organ.set(\speed,msg[1].linlin(-16000,16000,0.6,0.7))},'/x');
OSCdef(\organy,{|msg| ~organ.set(\pos,msg[1].linlin(-16000,16000,0,1.0))},'/y');
OSCdef(\organz,{|msg| ~organ.set(\pos,msg[1].linlin(-16000,16000,0,1.0))},'/z');

OSCdef(\organy2,{|msg| ~organ.set(\freeze,msg[1].linlin(-16000,16000,-1.0,1.0));},'/x1');
OSCdef(\organspeed, {|msg| ~organ.set(\speed,q.(msg[1]))},\x);



~val = {0}

~val.fadeTime=0;


(
~organ = {arg speed = 1, freeze = 0; var in, chain;
	in = Mix.ar(PlayBuf.ar(2,d[\organ],speed,1,0,1));
	chain = FFT(LocalBuf(2048),in);
	IFFT(PV_MagFreeze(chain,freeze));
}
)

(
var link = 0;
q = { |in|
	var result = if ( in < 0, {0},{in.linlin(-16000,16000,0.6,0.7)});
	result;
};
)

//I need a function which says that if x1 is less than 0, stop speed, and if it is more than 0, take a speed value from x.

q.(10000)



OSCdef(\xdiff, {|msg| ~organ.set(\speed,q.(msg[1]))},\x1);

//i need to write a function to control speed


if(freeze < 0, {0},{speed})

OSCFunc.trace

~organ.play

OSCFunc.trace(false)