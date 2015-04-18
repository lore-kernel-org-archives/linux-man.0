From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.2: tfix
Date: Sat, 18 Apr 2015 20:43:34 +0200
Message-ID: <5532A5D6.8030304@gmail.com>
References: <1428947385-32126-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428947385-32126-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/13/2015 07:49 PM, Heinrich Schuchardt wrote:
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>


Thanks, Heinrich. Applied.

Cheers,

Michael



> ---
>  man2/futex.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 9bfd934..baf356d 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -93,7 +93,7 @@ The call to
>  will block if and only if the lock is still acquired.
>  When releasing the lock, a thread has to first reset the
>  lock state to not acquired and then execute a futex
> -operation that wakes threads blocked on the lock flag used as futex word.
> +operation that wakes threads blocked on the lock flag used as futex word
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
