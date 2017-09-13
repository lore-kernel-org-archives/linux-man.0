From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: socket(2) guarantee to return the lowest-available file descriptor
Date: Wed, 13 Sep 2017 14:40:03 +0200
Message-ID: <CAKgNAkjiXEEMVTVAudn0PD1v-TsRPWjjCex9uQV9+q=J5HNwbw@mail.gmail.com>
References: <CAJYFCiNrUL-Z2R2GsXy_rG-iS_hLWEL-y8wdpw65hdw41T0YWQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJYFCiNrUL-Z2R2GsXy_rG-iS_hLWEL-y8wdpw65hdw41T0YWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Yubin

On 11 September 2017 at 04:56, Yubin Ruan <ablacktshirt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> Is there any guarantee that socket(2) will return the lowest-available
> file descriptor?
>
> I note in the man page that open(2) has that guarantee, conforming to
> POSIX, but nothing about that has been add to socket(2). As socket(2)
> is said to be conforming to POSIX in the main page, which implies that
> guarantee, should we add that to the man page?

Yes, I've added the same text to socket(2). Thanks for the report.

Cheers,

Michael

POSIX.1:
2.14
File Descriptor Allocation
All functions that open one or more file descriptors shall, unless
specified otherwise, atomically
allocate the lowest numbered available (that is, not already open in
the calling process) file
descriptor at the time of each allocation. Where a single function
allocates two file descriptors
(for example, pipe( ) or socketpair( )), the allocations may be
independent and therefore
applications should not expect them to have adjacent values or depend
on which has the higher
value.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
