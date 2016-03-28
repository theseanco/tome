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

*/

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

//Dictionaries, construct these with poems recorded. Snippets can be recorded directly to buffers e,f,g,h,i
d=Dictionary.new;
(
d.add(\p1 ->
	Buffer.read(s,"~/diskouttest.aiff".standardizePath));
)
(
d.add(\p2 ->
	Buffer.read(s,"~/diskouttest.aiff".standardizePath));
)



























