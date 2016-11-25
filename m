From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: RFC: documentation of the autogroup feature [v2]
Date: Fri, 25 Nov 2016 14:04:12 +0100
Message-ID: <eca10ece-1942-8da7-d836-b9270bc5f3eb@gmail.com>
References: <41d802dc-873a-ff02-17ff-93ce50f3e925@gmail.com>
 <1479901185.4306.38.camel@gmx.de>
 <327586fa-4672-d070-0ded-850654586273@gmail.com>
 <1479915229.4306.106.camel@gmx.de>
 <7513b0a5-c5d0-3a92-5849-995af22601e4@gmail.com>
 <1479921075.4306.153.camel@gmx.de>
 <c5a9acd3-6b60-192c-312e-2777f2d537c2@gmail.com>
 <20161125125246.GA7600@afzalpc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125125246.GA7600@afzalpc>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Afzal Mohammed <afzal.mohd.ma-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>, Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/25/2016 01:52 PM, Afzal Mohammed wrote:
> Hi,
> 
> On Thu, Nov 24, 2016 at 10:41:29PM +0100, Michael Kerrisk (man-pages) wrote:
> 
>>        Suppose  that  there  are two autogroups competing for the same
>>        CPU.  The first group contains ten CPU-bound processes  from  a
>>        kernel build started with make -j10.  The other contains a sin‐
>>        gle CPU-bound process: a video player.   The  effect  of  auto‐
>>        grouping  is  that the two groups will each receive half of the
>>        CPU cycles.  That is, the video player will receive 50% of  the
>>        CPU  cycles,  rather  just 9% of the cycles, which would likely
>                             ^^^^
>                             than ?
> 
> Regards
> afzal

Thanks, Afzal. Fixed!

Cheers,

Michael

> 
>>        lead to degraded video playback.  Or to put things another way:
>>        an  autogroup  that  contains  a large number of CPU-bound pro‐
>>        cesses does not end up overwhelming the CPU at the  expense  of
>>        the other jobs on the system.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
