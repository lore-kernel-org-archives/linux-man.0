From: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] pipe.2: document sysctls
Date: Sun, 14 Aug 2016 09:41:28 +0200
Message-ID: <57B020A8.7070501@oracle.com>
References: <1471016112-18025-1-git-send-email-vegard.nossum@oracle.com>
 <1471016112-18025-2-git-send-email-vegard.nossum@oracle.com>
 <908c5c9e-f4b0-b274-e124-e5b7b505fde6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <908c5c9e-f4b0-b274-e124-e5b7b505fde6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Willy Tarreau <w@1wt.eu>, Jens Axboe <axboe-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/14/2016 01:13 AM, Michael Kerrisk (man-pages) wrote:
>
> Thanks. I've added this text to pipe(7) (rather than pipe(2)), and
> expanded it considerably:

Good idea!

>
>     /proc files
>         On  Linux, the following files control how much memory can be used
>         for pipes:
>
>         /proc/sys/fs/pipe-max-pages (only in Linux 2.6.34)
>                An upper limit, in pages, on the capacity that an  unprivi‐
>                leged  user  (one without the CAP_SYS_RESOURCE capability) can
>                set for a pipe.  The default value for  this  limit  is  16
>                times  the  default  pipe  capacity  (see above); the lower
>                limit is two pages.  This interface was  removed  in  Linux
>                2.6.35, in favor of /proc/sys/fs/pipe-max-size.
>
>         /proc/sys/fs/pipe-max-size (since Linux 2.6.35)
>                The  maximum size (in bytes) of individual pipes created or

I think I had a mistake in my original text because this limit is not
checked at creation time (the default pipe size, PIPE_DEF_BUFFERS, is
used even when it is greater than pipe-max-size), so maybe we can take
out the "created or".

>                set by users without the CAP_SYS_RESOURCE capability.   The
>                default  value for this file is 1048576.  Attempts to set a
>                limit less than the page size cause write(2) to  fail  with
>                the error EINVAL.

Maybe add in a paranthesis that 1048576 is 1 MiB?

>
>         /proc/sys/fs/pipe-user-pages-hard (since Linux 4.5)
>                The  hard  limit  on the total size (in pages) of all pipes
>                created or set by a single  unprivileged  user  (i.e.,  one
>                with  neither  the  CAP_SYS_RESOURCE  nor the CAP_SYS_ADMIN
>                capability).  So long as the total number  of  pages  allo‐
>                cated  to  pipe  buffers  for  this  user is at this limit,
>                attempts to create new pipes will be denied,  and  attempts
>                to increase a pipe's capacity will be denied.
>
>                When  the  value  of  this  limit  is  zero  (which  is the
>                default), no hard limit is applied.
>
>         /proc/sys/fs/pipe-user-pages-soft (since Linux 4.5)
>                The soft limit on the total size (in pages)  of  all  pipes
>                created or set by a single unprivileged user (.e., one with
>                neither the CAP_SYS_RESOURCE nor the CAP_SYS_ADMIN capabil‐
>                ity).   So  long  as the total number of pages allocated to
>                pipe buffers for this user is  at  this  limit,  individual
>                pipes  created  by  a user will be limited to one page, and
>                attempts to increase a pipe's capacity will be denied.
>
>                When the value of this limit is  zero,  no  soft  limit  is
>                applied.   The  default value for this file is 16384, which
>                permits creating up to 1024 pipes with the  default  capac‐
>                ity.
>
> How does the above seem?

It looks great, thanks for cleaning up my measly attempt.


Vegard
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
