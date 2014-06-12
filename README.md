mrpsd
=====

MRI Pulse Sequence Creator

Overview
--------

The matlab code in this directory should facilitate creating publication
quality PSDs using Matlab.   Look at the example files (cse.m, cpmg.m
and fse.m) to see how to use the code.  All files are script files so
this should run on any machine that Matlab runs on.

Matlab Version ...
------------------

I know that it works under version 5.x of Matlab, but it may also run
under version 4x.

Example files
-------------

Go into Matlab
cd into the correct directory (or add the MRPSD into your path)
Then just type "cse", "fse", "cpmg" or even better yet, "demo"

$ matlab
$ cd MRPSD
>> fse
>> cse
>> demo

Why under Matlab?
-----------------

Ahh.. good question.  There are many reasons:

1) Many people use Matlab for their data analysis and general coding.

2) All of the print facilities are built in (so you can print to JPEG, Postscript, BMP, TIFF etc etc).

3) Many things come free with the way that it is designed, for example,
if you want to look at only one temporal section of your PSD, all you
have to do is plot it up and then do:  set(gca, 'xlim', [50 100]) (if
you want to look at between 50ms and 100ms).  USE YOUR IMAGINATION HERE.
There are potentially lots of little things like the previous example
that I have not even thought of.

E-mail me
---------

I would be very interested in any suggestions, fixes (!) that you can send
along to make this toolbox better.  I would also like any more example
files that plot up other pulse sequences (spectroscopy, EPI etc etc).
My e-mail is craig@brechmos.org.  It is free software, I will
not restrict use in any way, shape or form.  I would appreciate, though,
any enhancements that you can.  I will try to make available updates as
often as possible.


Standard Disclaimer
-------------------

By using the software, I accept absolute no responsibility for anything.
Use it at your own risk.  It is absolutely free software.

Have fun with it.  

Craig.
craig@brechmos.org
