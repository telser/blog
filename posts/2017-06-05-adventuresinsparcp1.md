---
title: "Adventures In Sparc Part 1: Background And Starting Out"
subtitle: ""
series: Adventures In Sparc
tags: OpenBSD, Illumos
---


# Some Background

Operating systems have been fascinating to me and exploring the use of different
systems is a big part of what led me to a career in software. Though nearly all
of my professional work has been at a layer of abstraction above the system,
i.e. /applications/.

Similarly what I've always thought of as "real" systems have been something to
inspire towards. In my mind this was large storage systems, network backbone,
financial systems, and so on. The kinds of systems that had *hard* requirements
around uptime, performance, and maintainability. For whatever reason this seemed
like an approach and value system that was "old school".

As a way to force myself to learn more systems programming and administration, a plan
came to my mind of taking a non-x86 architecture (those who know seemed to say
that RISC assembly was cleaner) and my favorite OS to either port or improve support.
In the past I had used a PowerPPC laptop (Powerbook G4), so immediately Power
was where I'd start. Searching around it became clear that a modern-ish system was
far more expensive than I was willing to pay.

Where was I to go? MIPS? Hardware seemed centered around embedded systems not servers, recently.
Itanium? More expensive than Power*(See end note). Alpha and PA-RISC were also expensive, difficult to
find and outright discontinued. ARM? Server systems are coming to existence now, but
that means it's still pricey and not available secondhand.

# Enter SPARC.

Systems were still being made, (evil empire aside, Fujistu still produces machines) and
can be had for pretty cheap on Ebay. Sun has also always held a special place for me.
They seemed to embody those values I mentioned earlier, plus they were so influential
in all things computing. Systems being relatively cheap on Ebay I started with a T5220.

On my personal OS journey (another post for another time perhaps), I had briefly used
OpenSolaris. It seemed natural to start there. Unfortunately at the time, I didn't find
any Illumos distributions with SPARC support. After a bit of time with Oracle Solaris,
that rubbed with my FOSS ideals and I switched to OpenBSD to get going.

# Good, Bad, and Ugly.

## Good

There have been several good things both with SPARC specifically, and my goal of learning
that these systems enabled. Definitely have some future posts in mind to go deeper on both.

Working with the hardware has been great. Limited experience with working inside of
servers, so take with a grain of salt, but everything from swapping fans out, the memory
riser, to drive sleds has been incredibly easy to work with. The management system,
ILOM (Integrated Lights Out Manager) has been quirky for sure, but even that is
pretty easy to navigate after getting used to the commands. The older T2000s that I
got almost a year after the T5220, use an older ALOM (Advanced Lights Out Manager),
which is separately quirky. Coming from zero experience managing physical servers,
as opposed to a vps (virtual private server) or AWS, they both seem straightforward.
But the newer ILOM has some features that I like (monitoring power consumption).

As I've said before, prior, my experience was centered around things where direct control
of the hardware was not possible. Further with AWS things like firewalls, at the most
basic levels at least, can be obtained from the built in services.

So this adventure and usage has forced knowledge around firewalls, intrusion detection,
and a whole bunch of other things that are either handled for you or just ignored in a
large number of settings.

Lots of the software that has come up, for me, through this has been pretty great.
Things such as pf, aide, unbound (I actually used bind??).

For a moment at least I want to say something about pkgsrc. Have you ever heard of pkgsrc?
I had previously heard it mentioned, but never had a reason to look into it. The NetBSD
people have done an *amazing* job taking their entire ports system and making it portable
to /other operating systems/. Let that sink in for a second. You can use one set of
packaging tools and have it install the exact same versions across multiple ISAs and
operating systems! Same tools on OpenBSD/SPARC as Illumos/AMD64 and even NetBSD/Dreamcast!
This has been awesome as I jumped around from Solaris, to OpenBSD, to Illumos before
settling on a mix of OpenBSD and Illumos (more on that another time..) and the various
native packaging systems didn't have some software, or very old versions.

Okay one more good thing and then I'll stop the positive ranting. Bang for the buck
on used systems. Are there faster machines? Absolutely. But getting a 32 thread/ 32 GB of
RAM machine for less than the price of a Raspberry Pi 3 is amazing.

## Bad
OpenBSD doesn't have something akin to Jails or Zones. This was a limitation I knew about
going in, so it is hardly fair to complain too much. Having the separation would have
been great for some of the things I was, and still am, trying to do.

Another negative is that Java on OpenBSD/Sparc64 is not a thing. To be clear, I have
absolutely zero interest in developing with Java, but sometimes need/want to run a bit
of JVM software. I thought, tried and fought to use pkgsrc to either use their built
Java, or to build it myself. After struggling with that for a week or so last summer
I just gave up on using anything JVM with the combination of OpenBSD and SPARC.

## Ugly
One of the things I was initially very excited about was LDOMs and being able to
partition the system up for various tasks. Plus OpenBSD had support for LDOMs!
Spending some time reading and learning about how this worked I was ready to go.
Then I realized every time I used the LDOM daemon the system would hang. This is by far
the worst experience I've had with OpenBSD to date, and is ultimately somewhat minor.
Also, it is worth pointing out that the daemon runs just fine on a T2000 that I acquired
later.


# Some additional notes/thoughts on various ISAs.

Whatever you think of SPARC, it seems pretty clear to me that several conclusions can be
made easily from the following:

* SPARC processors and servers are still being made right now in 2017.
   In fact Fujistu launched a /new/ SPARC processor in April, as shocking as that
   may [seem.](http://www.fujitsu.com/global/about/resources/news/press-releases/2017/0404-01.html)
* Itanium has been announced to not be developed past Kittson, also released this [year.](https://itpeernetwork.intel.com/evolution-mission-critical-computing/)
* Alpha and PA-RISC are long dead.
* MIPS doesn't seem to be used in the server space anymore and has an uncertain future
  since Imagination Technologies is looking to sell that [division..](http://www.anandtech.com/show/11334/imagination-to-sell-mips-and-ensigma)
* ARM for servers seems to be growing, but has been very slow in having systems available for actual purchase. Cavium has a processor, ThunderX, shipping in real systems today. AMD does as well for a single processor, but to my knowledge that is it. There are multiple vendors with systems based on those two though.
* Power is still being developed by IBM and they have at least one supercomputer with
  Power9 processors due to come online in [2017](https://www.llnl.gov/news/next-generation-supercomputer-coming-lab)
   Further, to my knowledge Power9 is the /only/ architecture to be announced supporting NVidia's NVLink 2.0 which is basically a faster PCIe for connecting co-processors (read: GPGPU stuff)

So then if you want an alternative to AMD64/x86-64, there are three options currently
still being developed *and* already shipping (Sorry RISC-V, we'll see if anything happens there) namely ARM, Power, and SPARC. None of these are in abundance when buying new. Of the three ARM has the most vendors releasing hardware, but is also the newest and thus
hard to find secondhand. Power and SPARC have both only had two vendors actually releasing hardware for at least a processor generation (IBM and Tyan for the former while Oracle and Fujistu for the latter).

Then finally, again assuming you're looking to not use AMD64, as a solo developer (not as a company)
buying secondhand the choice comes down to either Power or SPARC. At the time of my
purchases the SPARC machines were *vastly* cheaper. So I stand by my decision to go that
route.
