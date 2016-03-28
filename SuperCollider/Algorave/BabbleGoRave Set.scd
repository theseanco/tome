//hi everyone

//i'm sean

//thanks for coming

s.scope


s.makeWindow

(
~start = Task({
	25.do({ arg i;
		rrand(5,20).do{Synth(\bpfsaw,[\freq,exprand(1,10).round(1)*60,\amp,rrand(0.5,0.9),\atk,rrand(5,10),\sus,rrand(10,20),\rel,rrand(10,20),\detune,Pexprand(0.000001,0.3)])};
		rrand(5,25).wait;
		i.postln;
	});
});
)

//it gets more interesting i promise

//here we go.


~bass = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4)/4,\rel,0.3,\amp,Pwhite(0.4,1),\fb,Pwhite(0,0.3),\freq,Pwhite(1,6)*(Pkr(~fund)/2));

p.clock.tempo=136/60

~shout.play

//i'd better see some dancing

~bass.play

~fund = 65

~l1 = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4),\atk,Pwhite(3,6),\rel,Pwhite(3,6),\freq,Pwhite(1,10)*Pkr(~fund),\amp,0.05)

~dfm1 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.1),[~fund,~fund*1.01]*2,EnvGen.ar(Env.perc(0.01,0.3),Impulse.kr(~tempo.kr),5))}

~dfm1.stop

~gab.play

~gab = Pbind(\instrument,\bplay,\buf,d["khc"][0],\dur,1,\amp,0,\rate,Pseq([1,1,1,1,1,1,0.9,0.8].stutter(4),inf))

~gab2 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(1,4)/4,\amp,1,\rate,Place([4,4,[5,4,6,5],[4,4,7,6],[7,6,5,4]],inf))

~gab3 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(1,4)/4,\amp,1,\rate,Place([4,4,[5,4,6,5],[4,4,7,6],[7,6,5,4]],inf)*2)


~gab4 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(1,4)/4,\amp,1,\rate,Place([4,4,[5,4,6,5],[4,4,7,6],[7,6,5,4]],inf)*4)

~gab4.play

//this is going somewhere I promise i've got a bit much on my plate rn

~techno = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\dur,1,\amp,0.7,\rel,0.35,\pos,0.68)

~illegal.stop

~bpf = Pbind(\instrument,\bpfsaw,\dur,0.1,\amp,0.9)

~bpf2 = Pbind(\instrument,\bpfsaw,\dur,0.1,\amp,0.9,\freq,880)

~bpf3 = Pbind(\instrument,\bpfsaw,\dur,0.1,\amp,0.9,\freq,440*3)

~bpf2.play




//crashed soz.

p.clock.tempo = 1400oo[qe r2/60

~shakeitallabout.stop(10)

~techno.play

~up.stop
~down.stop

~up = Pbind(\instrument,\sinfb,\freq,Pseq((1..10),inf)*Pkr(~fund),\amp,0.5,\rel,0.01,\dur,0.25)

//DANCE DANCE DANCE

p.clock.tempo = 168/60


(
~l1.stop(30);
~l2.stop(30);
~bass.stop(60);
)

~illegal = Pbind(\instrument,\bplay,\buf,d["illegalparties"][0],\dur,45,\amp,0.7)

~illegal.play


~shout.stop



~down = Pbind(\instrument,\sinfb,\freq,Pseq((1..10).reverse,inf)*Pkr(~fund),\amp,0.5,\rel,0.01,\dur,0.25)

~shakeitallabout = Pbind(\instrument,\sinfb,\freq,Pseq((1..10).scramble,inf)*(Pkr(~fund)*2),\amp,0.5,\rel,0.01,\dur,0.25)

~up.set(\fb,~sin1)
~down.set(\fb,~sin2)
~shakeitallabout.set(\fb,~sin3)

~kick.stop
~snare.stop




~sin1 = {SinOsc.kr(0.1).range(0.1,1.5)}
~sin2 = {SinOsc.kr(0.11).range(0.1,1.5)}
~sin3 = {SinOsc.kr(0.12).range(0.1,1.5)}

~shakeitallabout.play

~down.play

//not enough bass on these speakers! Sorry!

~shout.stop

(
~snare.stop;
~hats.stop;
)
~up.play

~hats.stop

~shout.play

~dfm1.play

~l1.set(\fb,~sinfb)

~l2 = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4),\atk,Pwhite(3,6),\rel,Pwhite(3,6),\amp,Pwhite(0.05,0.1),\freq,Pwhite(1,10)*(Pkr(~fund)*2))

~l2.play

~sinfb = {SinOsc.ar(0.1).range(0.1,1)}

~kick = Pbind(\instrument,\bplay,\dur,1,\amp,3,\buf,d["k"][0])

~kick.play
~kick2.stop

~kick2 = Pbind(\instrument,\bplay,\dur,2,\amp,0.7,\buf,d["k2"][3])

(
~kick.play;
~shout.play;
)
~kick2.play

p.fadeTime=3

(
~kick.stop;
~snare.stop;
)

//distasteful? I think not.

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\amp,0.8,\dur,Pseq([1,Pseq([2],inf)],inf))

~snare.play

~shout.play

~hats = Pbind(\instrument,\bplay,\buf,d["h"][3],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,Pexprand(0.6,0.8))

~hats.play


//everyone ready? <<<<<<<

(
p.clock.tempo = 130/60;
~kick.play;
~snare.play;
)



~snare = Pbind(\instrument,\bplay,\dur,Pwhite(1,4)/4,\amp,2,\buf,d["sn"][0])

~snare.play

~shout.stop

~kick.play
