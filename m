From: Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org>
Subject: Re: man 2 stat
Date: Mon, 10 Mar 2014 11:15:26 +0000
Message-ID: <20140310111526.GC7263@zeus.siriusdev.com>
References: <20140309202120.GA2447@zeus.siriusdev.com>
 <20140309202449.GB2447@zeus.siriusdev.com>
 <CAKgNAkjcvRBqXC-Zemwap0Kt5PJLBL4SXA0ZOGYPOYSgqmvqoA@mail.gmail.com>
 <20140310100110.GA7155@zeus.siriusdev.com>
 <CAKgNAkiNYcL2rcmRm=PTGC76PhevQaYgZMERg9tYkmszmsx8+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkiNYcL2rcmRm=PTGC76PhevQaYgZMERg9tYkmszmsx8+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, Mar 10, 2014 at 12:03:09PM +0100, Michael Kerrisk (man-pages) wrote:
> Hello Marius!
> 
> On Mon, Mar 10, 2014 at 11:01 AM, Marius Gaubas
> <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org> wrote:
> > On Mon, Mar 10, 2014 at 08:56:16AM +0100, Michael Kerrisk (man-pages) wrote:
> >> On Sun, Mar 9, 2014 at 9:24 PM, Marius Gaubas <marius-PI1xv8u4z2FbJaZ9Qiajs9BPR1lH4CV8@public.gmane.org> wrote:
> >> > On Sun, Mar 09, 2014 at 08:21:20PM +0000, Marius Gaubas wrote:
> >> >> 1. nlink_t st_nlink member goes after mode_t st_mode, not before @struct stat
> >> > Apologies, the correct statement is:
> >> >
> >> >   nlink_t st_nlink member is before mode_t st_mode, not after @struct stat
> >
> > Please accept my apologies for a BOT-like e-mail.
> 
> ;-). Accepted.
> 
> > My name is Marius Gaubas
> > (http://www.linkedin.com/pub/marius-gaubas/5b/63b/3a4).
> >
> > The evicence is very clear. I invoke syscall:stat directly from assembly
> > code and in the debugger I clearly see see that st_nlink (==2) goes
> > before st_mode (==040700). It clearly makes sense: 8 8 4 8 is not
> > aligned. The series reflects the sizes of the first for structure
> > members. st_nlink/st_mode values are clearly specific to my test, I hope
> > that's clear.
> 
> It's clear, but it's also a very narrow field of view. On the
> particular architecture (I guess x86-64) you are using, it appears to
> be true. But, there is much more to consider. See, for example
> <bits/stat.h> and the kernel source file
> arch/x86/include/uapi/asm/stat.h. On x86-32, the order is as shown in
> the man page; it looks as though the same is true on ARM. Furthermore,
> on various architectures, there are padding fields at different
> places, and glibc under the covers does a lot of magic to present
> something sane (and portable across kernel versions) to user space.
> 
> Now, trying to document all of the architecture-specific details in
> the man page is difficult, and would probably be confusing to the
> reader. But, a warning to the reader is probably in order. I've added
> the following text below the structure definition:
> 
>        Note: the order of fields in the stat structure varies somewhat
>        across  architectures.   In addition, the definition above does
>        not show the padding bytes that may  be  present  between  some
>        fields  on  various  architectures.   Consult the the glibc and
>        kernel source code if you need to know the details.
> 
> Seem okay to you?
> 
> Thanks,
> 
> Michael
> 
> -- 
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/

Hello Michael,

I do appreciate your point. And I agree it is very valid. Man page is
not and should not become an overloaded document with all the platform
specific caveats. But I also see it valuable to clearly explain where
the document is not absolutely precise and what sources should be
further consulted for the details.

Your proposed change looks perfect to me.

Thank you very much for you time!

Kind regards,
Marius
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
