# Introduction

A long time ago I used GarageBand to record music on a 2012 Mac Mini.  I forget
the audio interface I used, but it was not fancy at all.  I haven't done much 
recording since the GarageBand days, but I did recently get access to a ProTools
license, but then that old Mini finally went belly up.  The replacement has been a 
Linux laptop spec'd out for CGI and mahine Learning applications.  Not optimized 
for audio, but with plenty of relevant horse power in terms of CPU and RAM.

Because of the shift back to Linux as my only OS, I'm having to find a replacement
for the ProTools and GarageBand options that will _never_ be ported to Linux.

My search brought me to Ardour, which looks like a very capable option.  

# Why Docker?

Simple answer: containerization.  You know, the thing Docker does.  My laptop needs 
to support a wide variety of capabilities.  The reason I shelled out the money was 
to explore CGI and ML applications.  Recording music is a hobby.  I want my laptop to
do both without becoming a mess of mangled Debian packages, configurations, Python
versions/envs/etc.  But, setting up a Linux laptop for audio recording is
not easy.  It involves a installing a huge number of dependencies, even if you don't
compile the application from source, which is what we'll be doing here.

