From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH] sys_waitid: return -EFAULT for NULL
Date: Tue, 13 Jan 2009 16:33:01 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0901131629220.6528@localhost.localdomain>
References: <cfd18e0f0901131436ud2cf61bkf0e6b00f4b765bb5@mail.gmail.com> <cfd18e0f0901131438n232ba114n27ea2d7964d071de@mail.gmail.com> <20090113224759.7DFB7FC3DD@magilla.sf.frob.com> <20090113224941.36F19FC3DD@magilla.sf.frob.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090113224941.36F19FC3DD-nL1rrgvulkc2UH6IwYuUx0EOCMrvLtNR@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roland McGrath <roland-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulrich Drepper <drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org



On Tue, 13 Jan 2009, Roland McGrath wrote:
>
> It's always been invalid to call waitid() with a NULL pointer.  It was an
> oversight that it was allowed (and acts like a wait4() call instead).

I'm not going to take this. 

If it was some new system call, of if there was some downside to out 
behavior, I might be interested. As it is, our behaviour has zero 
downside, and changing existing interfaces simply isn't worth it.

The alleged "downsides" are bogus:

 - POSIX is not that strict. EFAULT is one of the odd error cases anyway, 
   and even explicit requirements are irrelevant: if somebody wants to get 
   strict conformance paperwork done, you just need to tell where you 
   differ, and you're basically done. But perhaps more important, nobody 
   cares.

 - The "portability" argument is totally bogus, since it's not like you 
   compile programs without even testing to another UNIX _anyway_. 

So I'm simply not going to potentially break binaries over something that 
is so _totally_ irrelevant. Document it in the man-page instead.

		Linus
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
