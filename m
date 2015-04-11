From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.2: explanation of blocking
Date: Sat, 11 Apr 2015 09:02:14 +0200
Message-ID: <5528C6F6.7050300@gmail.com>
References: <1427656383-8779-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427656383-8779-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/29/2015 09:13 PM, Heinrich Schuchardt wrote:
> Use shorter sentences.


Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/futex.2 | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index dea50ea..6a4d45c 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -85,14 +85,18 @@ In the uncontended case,
>  a thread can access or modify the lock state with atomic instructions,
>  for example atomically changing it from not acquired to acquired
>  using an atomic compare-and-exchange instruction.
> -If a thread cannot acquire a lock because
> -it is already acquired by another thread,
> -it can request to block if and only the lock is still acquired by
> -using the lock's flag as futex word and expecting a value that
> -represents the acquired state.
> +A thread maybe unable acquire a lock because
> +it is already acquired by another thread.
> +It then may pass the lock's flag as futex word and the value
> +representing the acquired state as expected value to a
> +.BR futex ()
> +wait operation.
> +.BR futex ()
> +will block if and only if the lock is still acquired.
>  When releasing the lock, a thread has to first reset the
> -lock state to not acquired and then execute the futex operation that
> -wakes one thread blocked on the futex word that is the lock's flag
> +lock state to not acquired and then execute a
> +.BR futex ()
> +operation that wakes threads blocked on the lock flag used as futex word.
>  (this can be be further optimized to avoid unnecessary wake-ups).
>  See
>  .BR futex (7)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
