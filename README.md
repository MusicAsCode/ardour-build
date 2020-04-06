# Introduction

A long time ago I used GarageBand to record music on a 2012 Mac Mini.  I forget
the audio interface I used, but it was not fancy at all, but I was able to get 
pretty damn good results from the combo.  For a variety of reasons, I haven't done 
much recording since those GarageBand days.  But I did recently get access to a 
ProTools license, and thought it would be fun to get back to recording musci.  
Unfortunately, that old Mini finally went belly up, which ended my Mac days.  I 
was tiring of Macs already and using ProTools would have been the last reason to 
continue in the Apple world.

The replacement has been a Linux laptop spec'd out for CGI and mahine Learning 
applications.  Not optimized for audio at all, but with plenty of relevant horse 
power in terms of CPU and RAM for what my needs will be.

Because of the shift back to Linux as my only OS, I'm having to find a replacement
for the ProTools and GarageBand options that will _never_ be ported to Linux.

My search brought me to Ardour, which looks like a very capable option.

## Why Ardour?

Well, honestly, I didn't do that much research before settling on Ardour.  It quickly
jumped to the top of the FOSS list for my high level requirements:

1.  Recording and mixing at least a few channels at a time.
2.  Support for a variety of devices/inputs
3.  Highly capable mixing and editing features
4.  Active development
5.  Community support

# Why Docker?

Simple answer: containerization.  You know, the thing Docker does.  My laptop needs 
to support a wide variety of capabilities.  The reason I shelled out the money was 
to explore CGI and ML applications.  Recording music is a hobby.  I want my laptop to
do both without becoming a mess of mangled Debian packages, configurations spread over
the file system, conflicting libraries likewise spread all of the the file system, Python
versions/envs/etc.  

Unfortunately, setting up a Linux laptop for audio recording conflicts with all of the 
above.  It is not uncommon to have to try dozens of combinations before figuring out what
works.  In the process you wind up hosing your system 2 ways to Sunday.  

Enter Docker.  I can screw up things to my hearts content in a container and not make a mess
of the host system.  

It involves a installing a huge number of dependencies, even if you don't
compile the application from source, which is what we'll be doing here.

## Downside of Docker

So, great, I can contain all of the various dependencies.  I can add all of the compile time
dependencies, compile from source and then remove those dependencies them from the final container.  
Basically, I can wrap this really complex application up into a nice neat package.  And that is 
all true.  

That package still has to run in the host operating system, however.  And for applications
like audio recording that means application components having access to low level hardware
features that are not always easily accessible from containers.

Each device can be different.  Each specific implementation of the same device interface
can be different.  Some may be restricted by SE linux rules.  Some by other means.  The 
vagaries possible inputs and outputs for audio recording/mixing software is vast.  

Finally, Ardour is an X11 application, so the container will have to deal with the graphical issues
as well.

# So, Why Docker (Again)?

With all of the problems it still beats the hell out of the alternative.  The ability to isolate
the dependencies in the course of creating a generalized and resuable conatiner ensures that the
container can run on as a wide variety of systems as possible.

# Purpose of This Project

This is a fork of what is a very good start on identifying the dependencies to build and run 
Ardour.  I'd like to move it forward and create a container that will fit into existing Desktop
environments in as natural a way from a user experience standpoint, but with minimal impact on
the host OS.

