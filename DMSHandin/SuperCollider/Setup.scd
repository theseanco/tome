//Babble, 22nd feb 2016

/*

Begin with quite a quiet invoation that relates to the story in some way.

There'll be a bit in it where the gran is in the fetal position on the moon

Then move into presenting the narrative, settling on a very short phrase which will be passed to the suit.
^^ whole idea to do with finding order in chaos.

Repeating a phrase, a short one which seems integral to the rest of the things.

TBig thing to di with disorder>order using the suit, trying to rein it in and then it becoming controlled, finding that order, and then coming back to the narrative, and the story of the Gran.

That moment of separation and unburdening, speaking the tome again.

Putting the suit into a little dark box.

NOTES:

MAY NEED TO RUN VOCAL SAMPLES THROUGH A LOW PASS

The text is modelled on stories

TO BRING:

Recordings of water, particularly derwentwater.

Derwentwater recordings of water





========

Start building up performance from the sounds of water.

Movement and light - different scalable mappings of movement, so the movement starts out only slightly affecting the light and then builds up into more obvious relationships later on in the piece

Make a circular buffer to interpret changing values as volumes of samples to interpret movement


*/

(
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 16;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 1;
s.scope;
b = NetAddr("127.0.0.1", 7700);
)
(
d=Dictionary.new;
d.add(\tome ->
	Buffer.read(s,"~/tome.aiff".standardizePath));
d.add(\water ->
	PathName("/home/smc/src/github/Babble/sounds/Water Field Recordings").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
StageLimiter.activate;
)

(
SynthDef("help-Diskout", {arg bufnum;
	DiskOut.ar(bufnum, SoundIn.ar(0));
}).send(s);
)


d[\water][3].play

(
// this will record to the disk
SynthDef("help-Diskout", {arg bufnum;
    DiskOut.ar(bufnum, SoundIn.ar(0));
}).send(s);
)


//Record
(
b= Buffer.alloc(s, 65536, 1);
b.write("~/diskouttest.aiff".standardizePath, "aiff", "int16", 0, 0, true);
c = Synth.tail(nil, "help-Diskout", ["bufnum", b]);
)


// stop recording
(
c.free;
b.close;
b.free;
)

d[\p1].play
d[\tome2].play

//Dictionaries, construct these with poems recorded. Snippets can be recorded directly to buffers e,f,g,h,i
(
d=Dictionary.new;
d.add(\p1 ->
	Buffer.read(s,"~/diskouttest.aiff".standardizePath));
d.add(\tome ->
	Buffer.read(s,"~/tome.aiff".standardizePath));
d.add(\tome2 ->
	Buffer.read(s,"~/diskouttest.aiff".standardizePath));
d.add(\water ->
	PathName("/home/smc/src/github/Babble/sounds/Water Field Recordings").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\kick ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/1 - Kicks").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\clap ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/4 - Claps").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
SynthDef(\bplay,
	{arg out = 0, buf = 0, rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15;
		var sig,env ;
		sig = Pan2.ar(PlayBuf.ar(1,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2),pan);
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,sig);
}).add;
)














