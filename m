From: Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org>
Subject: Re: man 2 stat
Date: Mon, 10 Mar 2014 10:22:55 +0000
Message-ID: <20140310102255.GB7263@zeus.siriusdev.com>
References: <20140309202120.GA2447@zeus.siriusdev.com>
 <20140309202449.GB2447@zeus.siriusdev.com>
 <CAKgNAkjcvRBqXC-Zemwap0Kt5PJLBL4SXA0ZOGYPOYSgqmvqoA@mail.gmail.com>
 <20140310100110.GA7155@zeus.siriusdev.com>
 <531D8EB5.7090305@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <531D8EB5.7090305-fPG8STNUNVg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 10, 2014 at 11:06:45AM +0100, walter harms wrote:
> 
> 
> Am 10.03.2014 11:01, schrieb Marius Gaubas:
> > On Mon, Mar 10, 2014 at 08:56:16AM +0100, Michael Kerrisk (man-pages) wrote:
> >> On Sun, Mar 9, 2014 at 9:24 PM, Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org> wrote:
> >>> On Sun, Mar 09, 2014 at 08:21:20PM +0000, Marius Gaubas wrote:
> >>>> 1. nlink_t st_nlink member goes after mode_t st_mode, not before @struct stat
> >>> Apologies, the correct statement is:
> >>>
> >>>   nlink_t st_nlink member is before mode_t st_mode, not after @struct stat
> >>
> >> "I'm sorry HAL, what are are you trying to tell me?"
> >>
> >> Translation: Could you _please_ communicate as though there are human
> >> beings on this list? What are you trying to tell us, and what is your
> >> evidence?
> >>
> >> Thanks,
> >>
> >> Michael
> >>
> >>
> >> -- 
> >> Michael Kerrisk
> >> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> >> Linux/UNIX System Programming Training: http://man7.org/training/
> > 
> > Hello Michael,
> > 
> > Please accept my apologies for a BOT-like e-mail.
> > 
> > My name is Marius Gaubas
> > (http://www.linkedin.com/pub/marius-gaubas/5b/63b/3a4).
> > 
> hello nice to meet you.
> 
> > The evicence is very clear. I invoke syscall:stat directly from assembly
> > code and in the debugger I clearly see see that st_nlink (==2) goes
> > before st_mode (==040700). It clearly makes sense: 8 8 4 8 is not
> > aligned. The series reflects the sizes of the first for structure
> > members. st_nlink/st_mode values are clearly specific to my test, I hope
> > that's clear.
> 
> Ok,
> you are talking about the sequence the fields are stored in the structure ?
> 
> re,
>  wh
> 
> > Kind regards,
> > Marius
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-man" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

Yes, st_mode and st_nlink are in a reverse order. Very simple to test from
C with offsetof macro. I can quickly write it if it is needed for the
prove.

M.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
