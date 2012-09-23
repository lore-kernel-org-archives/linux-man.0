From: Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] wait4.2: Add a note that these functions are deprecated
Date: Sun, 23 Sep 2012 18:25:12 +0300
Message-ID: <20120923152512.GD13319@bunk.dyndns.info>
References: <20120918210116.GA22808@bunk.dyndns.info>
 <CAKgNAkiiNGhVRi-ddBA2t8tdZMRq_rrJWEAumVyXikZCzCW1UA@mail.gmail.com>
 <20120923142425.GC13319@bunk.dyndns.info>
 <CAKgNAkiHYrerfCDab8UFrFZbqd=jEBXScLjM2j7LHAJHLnNhmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiHYrerfCDab8UFrFZbqd=jEBXScLjM2j7LHAJHLnNhmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 23, 2012 at 04:34:36PM +0200, Michael Kerrisk (man-pages) wrote:
> Hi Adrian,
> 
> On Sun, Sep 23, 2012 at 4:24 PM, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Sun, Sep 23, 2012 at 04:02:27PM +0200, Michael Kerrisk (man-pages) wrote:
> >> Adrian,
> >
> > Hi Michael,
> >
> >> I think the idea of your patch is good, but I prefer to use a word
> >> other than "deprecated". The problem is that "deprecated" implies a
> >> standards body or a vendor made a formal statement about this. It's
> >> true that LSB 2.1 says that wait3() is deprecated
> >> (http://refspecs.linuxbase.org/LSB_2.1.0/LSB-generic/LSB-generic/baselib-wait3-3.html),
> >> but wait4() is currently still part of LSB. So, I applied a slightly
> >>
> >> modified version of your test:
> >>
> >> [[
> >> These functions are nonstandard; use
> >>
> >> .BR waitpid (2)
> >> or
> >> .BR waitid (2)
> >> in new programs.
> >> ]]
> >>
> >> Seem okay?
> >
> > the wait3() function is not "nonstandard, since as the URL you gave
> > correctly states it is part of SuSv2 (and also of SuSv1).
> 
> Yep, but marked LEGACY in SUSv2, and removed altogether in SUSv3. So,
> not part of contemporary standard. (BTW, I did also add text under
> CONFORMING TO to note those details.) So, I think I'll leave the text
> as I gave already, unless you have a better alternative to propose.

My problem is with the word "nonstandard" for wait3(), that was 
specified in older standards.

What about "obsolete" instead?

> Cheers,
> 
> Michael

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
