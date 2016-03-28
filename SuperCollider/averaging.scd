//cutoff value of 300 for the water function in x1 is the best

//init diff proxies
(
~diffx = 0;
~diffz = 0;
~diffy = 0;
)


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
OSCdef(\xdiff, {|msg| ~one.set(\amp,q.(msg[1]))},\x1)
OSCdef(\ydiff, {|msg| ~diffy.set(f.(msg[1]))},\y)
OSCdef(\zdiff, {|msg| ~diffz.set(f.(msg[1]))},\z)

~diffx.set(49)

OSCFunc.trace(true)

~test1.play
~one.play

// OSCFunc.trace(true)

//turns the difference in the x1 stream into a smoothed difference
~test = {Lag.kr(~diff.abs,0.3).explin(1,10000,0,1.0).poll(50)}

s.scope

~test = 0

//sonifies this using a PlayBuf
~one = {arg amp = 0.5; PlayBuf.ar(2,d[\water][3],1,1,0,1,0)*Lag.kr(amp/100,0.5)}

~one.play

~one.stop


////////////////////
////////////////////////////////////////
////////////////////
////////////////////
////////////////////////////////////////
////////////////////
////////////////////
////////////////////
////////////////////////////////////////
////////////////////
////////////////////
////////////////////
////////////////////////////////////////


//these kinda work, but are very rough.
OSCdef(\xdiff, {|msg| ~one.set(\amp,q.(msg[1]))},\x)

//they not only need smoothing out but need an if statement in them to detect and filter very low values


//code from Julian

//using the grabbing of d as a function
(
var prev = 0;
f = { |in|
    var result = in - prev;
    prev = in;
    result;
};
)

d.(8)
d.(3)
d.(6)
d.(8)



//more code from Julian

//functions can also be wrapped inside of other functions.

(
z = { |prev = 0|
    { |in|
        var result = in - prev;
        prev = in;
        result
    }
};
)

d = z.();
e = z.();


d.(8)
d.(3)
d.(6)
d.(8)

e.(8);


//an attempt to write a circular buffer
//using the grabbing of d as a function
//if statement added as a gate, because fuck off gate Ugens
(
var prev = 0, buf = [0,0,0,0,0,0,0,0,0];
q = { |in|
    var result = in - prev;
    prev = in;
    result;
	result = if ( result < 300, {0},{result});
};
) //write a circular buffer in here
