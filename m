From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Tue, 13 Jan 2009 16:57:55 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901131655040.6528@localhost.localdomain>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com>  <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com>  <20090113224759.7DFB7FC3DD@magilla.sf.frob.com>  <20090113224941.36F19FC3DD@magilla.sf.frob.com>
 <alpine.LFD.2.00.0901131629220.6528@localhost.localdomain> <cfd18e0f0901131653y76a827b5i906fadce63ada56b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0901131653y76a827b5i906fadce63ada56b-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



On Wed, 14 Jan 2009, Michael Kerrisk wrote:
> 
> It has zero downside for *us*.  But it is yet another example of Linux
> littering the Unix landscape with unnecessary inconsistencies that
> application writers must deal with.

Bah. Not so. It matters not at all if you try to write portable code. 

Linux has extensions. Deal with it. We have literally _thousands_ of 
things that work on Linux but not on other OS's. The fact is, you can't 
just recompile and assume something works, and waitid() has absolutely 
nothing to do with it.

> Well, POSIX.1-2001 is fairly clear:
> 
>       The  application shall ensure that the infop argument points to
>       a siginfo_t structure.

Right. So the application should do that, and Linux does the right thing. 
Problem solved.

			Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
