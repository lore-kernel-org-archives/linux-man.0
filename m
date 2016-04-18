From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clock_gettime.2: _COARSE clocks are not always faster...
Date: Mon, 18 Apr 2016 16:12:50 +0100
Message-ID: <5714F972.6080603@gmail.com>
References: <87k2k67ml4.fsf@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87k2k67ml4.fsf-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Rasmus,

On 04/09/2016 05:50 PM, Rasmus Villemoes wrote:
> Hi Michael
> 
> The other day, I was curious how the vdso was implemented on ppc, and I
> noted that neither ppc32 or ppc64 handle the _COARSE versions of
> CLOCK_{REALTIME,MONOTONIC} in the vdso, so they fall back to an actual
> syscall. And sure enough, measuring CLOCK_MONOTONIC
> vs. CLOCK_MONOTONIC_COARSE shows that the latter has three times as much
> overhead as the former.
> 
> Whether it's worth adding a note to the man page is up to you.

I think it's useful to do so. For both *COARSE flags, I added:

[[
Requires per-architecture support, and probably also architecture support
for this flag in the vdso(7).
]]

Thanks!

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
