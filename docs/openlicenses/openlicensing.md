# Open Licensing

## What is meant by "open"?

In an [October 2015 interview](http://rtalbert.org/blog/2015/interview-lorena-barba), Prof. Barba addresses why she advocates so strongly for open-source technology in research and education. 
She explains: 

_"Free and open-source software (FOSS) is a human invention of tremendous impact. It poses an alternative to intellectual-property instruments that are limiting and want to control how a creative work is used. Open-source licenses allow people to coordinate their work freely, within the confines of copyright law, while making access and wide distribution a priority. I’ve always thought that this is fundamentally aligned with the method of science, where we value academic freedom and wide dissemination of scientific findings."_

There are two ideas here. One is that open-source licenses give us a framework that promotes collaboration. 
Certainly, access and wide dissemination are a priority. But the power of open-source software comes not just from being able to _read_ the source code, but from being able to _contribute_ to and _build_ from it. 
For this power to be realized, it's not sufficient to make the source public to read. 
We must attach a **license** that allows others to modify and distribute the code. 

Let’s be clear about this: 
“Open data and content can be freely used, modified, and shared by anyone for any purpose.” 
—See [The Open Definition](http://opendefinition.org).<sup>1</sup>

## Open source and reproducibility

The second idea in Barba's quote above is that open source is aligned with the method of science. 
She continues: 
_"It’s a long tradition in science that publication of scientific findings should be accompanied by detailed description of materials and methods, such that another scientist may be able to replicate the findings. […] I frankly cannot see how one can publish a scientific finding that relies on software, without the source code of the software that generated the findings also being public. The code is part of the method and findings cannot be replicated without it."_ 

Stanford professor David Donoho and co-workers appear to be the first ones to publicly state that reproducibility depends on open code and data.<sup>2</sup> 
They define reproducible computational research as that _"in which all details of computations—code and data—are made conveniently available to others."_ 
They took inspiration from geophysics professor Jon Claerbout, who said that in computational science _"the actual scholarship is the complete software development environment and the complete set of instructions which generated the figures."_ 

## Guide to licenses

Everyone developing software in an academic setting should have working knowledge of software licenses. 
We recommend reading: "A Quick Guide to Software Licensing for the Scientist-Programmer," by Morin et al.<sup>3</sup>

The first thing to understand is that simply making the source code public does not make your project open source. 
Software is a creative work, and **copyright is automatically attached** to it. 
Without a license, your software is in a legal limbo where readers don't know how they can use it, if at all: 
a well-informed reader will opt for _not using_ your software, as the only safe behavior. 
The license is a contract between the authors of software and the users. 
It gives software authors the power to share with users, and to collaborate with other developers.

> Always add a license to software you plan to make public.

### Free and open-source software (FOSS)

Free and open-source software is under a license that grants the users **freedom**: to access, use or modify the software for their purposes. 
The most important distinction between the various FOSS licenses is whether they are _permissive_ versus _copyleft_. 
These terms are often confused. 

A permissive license gives more freedoms: the only restriction of use could be that the original authors receive credit in any distribution of the software or any derivative works. 
Even commercial uses, or incorporating the software into other proprietary (closed) works, is allowed. 
Academic software benefit most from permissive licensing. 
In fact, permissive licenses originated at accademic institutions, including the Berkeley Software Distribution or BSD License, the MIT License and the Apache License.

A copyleft license restricts the use of the software by requiring that any derivative works be _also_ under the license of the original. 
Another word for this model is "share-alike." 
Many developers want to ensure open access to their work and all derivatives for all posterity. 
This may be considered virtuous in some circles, but we should recognize that it is achieved by placing _restrictions_ on the use of software. 
The typical copyleft license is GPL.

### License compatibility

![](figures/journal.pcbi.1002598.g002.png)
**Credit:** Figure 2 of Morin et al. (2012). Illustrates compatibility of licenses: permissive licenses (BSD, MIT) are forward-compatible with any other license, whereas copyleft licenses are only forward-compatible with themselves. 

## References

<sup>1</sup> The Open Definition, [http://opendefinition.org](http://opendefinition.org)

<sup>2</sup> Donoho et al. (2009), Reproducible Research in Computational Harmonic Analysis, _Comp. Sci. Eng._ 11(1):8–18.

<sup>3</sup> Morin, A., J. Urban and P. Sliz (2012) A Quick Guide to Software Licensing for the Scientist-Programmer, _PLoS Comput. Biol._ 8(7): e1002598 [doi:10.1371/journal.pcbi.1002598](http://dx.doi.org/10.1371/journal.pcbi.1002598)


