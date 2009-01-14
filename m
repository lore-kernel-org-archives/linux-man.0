From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Wed, 14 Jan 2009 13:53:10 +1300
Message-ID: <cfd18e0f0901131653y76a827b5i906fadce63ada56b@mail.gmail.com>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>
	 <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>
	 <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>
	 <20090113224941.36F19FC3DD@magilla.sf.frob.com>
	 <alpine.LFD.2.00.0901131629220.6528@localhost.localdomain>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.00.0901131629220.6528-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Jan 14, 2009 at 1:33 PM, Linus Torvalds
<torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org> wrote:
>
>
> On Tue, 13 Jan 2009, Roland McGrath wrote:
>>
>> It's always been invalid to call waitid() with a NULL pointer.  It was an
>> oversight that it was allowed (and acts like a wait4() call instead).
>
> I'm not going to take this.
>
> If it was some new system call, of if there was some downside to out
> behavior, I might be interested. As it is, our behaviour has zero
> downside, and changing existing interfaces simply isn't worth it.

It has zero downside for *us*.  But it is yet another example of Linux
littering the Unix landscape with unnecessary inconsistencies that
application writers must deal with.  That's a downside for the app
writers.  (But, given how long the existing behavior has been in the
wild, my argument here is somewhat academic...)

> The alleged "downsides" are bogus:
>
>  - POSIX is not that strict.

Well, POSIX.1-2001 is fairly clear:

      The  application shall ensure that the infop argument points to
      a siginfo_t structure.

(Admittedly, this is a requirement imposed on the application, rather
than the implementation, but the standard goes on to say that the
implemenation shall fill in the structure pointed to by infop.)

Cheers,

Michael

>   EFAULT is one of the odd error cases anyway,
>   and even explicit requirements are irrelevant: if somebody wants to get
>   strict conformance paperwork done, you just need to tell where you
>   differ, and you're basically done. But perhaps more important, nobody
>   cares.
>
>  - The "portability" argument is totally bogus, since it's not like you
>   compile programs without even testing to another UNIX _anyway_.
>
> So I'm simply not going to potentially break binaries over something that
> is so _totally_ irrelevant. Document it in the man-page instead.

Well, that's doable of course.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
