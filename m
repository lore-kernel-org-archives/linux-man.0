From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] futex.2: tfix
Date: Wed, 30 Dec 2015 20:36:04 +0100
Message-ID: <56843224.3010708@gmail.com>
References: <1451485000-350-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451485000-350-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/30/2015 03:16 PM, Jakub Wilk wrote:
> ---
>  man2/futex.2 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, Jakub. Applied.

Cheers,

Michael


> diff --git a/man2/futex.2 b/man2/futex.2
> index 7144bf1..8c6c023 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -88,7 +88,7 @@ on the same futex word.
>  .\"     Totally ordered with respect futex operations refers to semantics
>  .\"     of the ACQUIRE/RELEASE operations and how they impact ordering of
>  .\"     memory reads and writes. The kernel futex operations are protected
> -.\"     by spinlocks, which ensure that that all operations are serialized
> +.\"     by spinlocks, which ensure that all operations are serialized
>  .\"     with respect to one another.
>  .\"
>  .\"     This is a lot to attempt to define in this document. Perhaps a
> @@ -125,11 +125,11 @@ wait operation.
>  This
>  .BR futex ()
>  operation will block if and only if the lock is still acquired
> -(i.e., the value in the futex word still matches the "acquiired state").
> +(i.e., the value in the futex word still matches the "acquired state").
>  When releasing the lock, a thread has to first reset the
>  lock state to not acquired and then execute a futex
>  operation that wakes threads blocked on the lock flag used as a futex word
> -(this can be be further optimized to avoid unnecessary wake-ups).
> +(this can be further optimized to avoid unnecessary wake-ups).
>  See
>  .BR futex (7)
>  for more detail on how to use futexes.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
