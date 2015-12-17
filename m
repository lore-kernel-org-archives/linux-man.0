From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Confusion regarding unit of RLIMIT_RSS
Date: Thu, 17 Dec 2015 08:17:56 +0100
Message-ID: <567261A4.5060608@gmail.com>
References: <20151109160710.GA7322@gardel-login>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151109160710.GA7322@gardel-login>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Lennart

On 11/09/2015 05:07 PM, Lennart Poettering wrote:
> heya,
> 
> The man page for setrlimit() claims that RLIMIT_RSS is to be specified
> in bytes, but glibc's bits/resources.h claims it was in bytes. 

I'm confused by that sentence. You have a "but", but both cases are
"bytes". What's the contradiction you are trying to point out?
Ahhh -- I get it now. The man page says "pages".

> My
> suspicion is that the header is right, and the man page wrong. But of
> course, since the limit has no effect on Linux anyway, maybe this is
> not the most important thing to fix, but I thought I'd at least report
> the discrepancy here...

The man page is clearly wrong. From bits/resources.h we have:

[[
  /* Largest resident set size, in bytes.   <=====
     This affects swapping; processes that are exceeding their
     resident set size will be more likely to have physical memory
     taken from them.  */
  __RLIMIT_RSS = 5,
#define RLIMIT_RSS __RLIMIT_RSS
]]

And in the kernel source file fs/proc/base.c, we have:

        [RLIMIT_RSS] = {"Max resident set", "bytes"},

As you note, the point is kind of moot, but the page should be fixed.
Done! 

Thanks for the report,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
