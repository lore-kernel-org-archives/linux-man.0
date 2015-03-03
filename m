From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.2: simplify example
Date: Tue, 03 Mar 2015 09:05:51 +0100
Message-ID: <54F56B5F.1070408@gmail.com>
References: <1425086747-4548-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425086747-4548-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/28/2015 02:25 AM, Heinrich Schuchardt wrote:
> Do not duplicate coding.

Thanks, Heinrich. Applied.

Cheers,

Michael

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/futex.2 | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/man2/futex.2 b/man2/futex.2
> index 6c02da7..2d56a20 100644
> --- a/man2/futex.2
> +++ b/man2/futex.2
> @@ -1509,24 +1509,15 @@ fwait(int *futexp)
>         machine\-language instructions.  For further information, see
>         the GCC Manual. */
>  
> -    /* Maybe the futex is already available: */
> -
> -    if (__sync_bool_compare_and_swap(futexp, 1, 0))
> -        return;
> -
> -    /* No; we must wait for the futex value to be changed */
> -
>      while (1) {
> -        s = futex(futexp, FUTEX_WAIT, 0, NULL, NULL, 0);
> -        if (s == \-1 && errno != EAGAIN)
> -            errExit("futex\-FUTEX_WAIT");
> -
> -        /* Is the futex now available? */
> -
> +        /* Is the futex available? */
>          if (__sync_bool_compare_and_swap(futexp, 1, 0))
>              break;      /* Yes */
>  
> -        /* Futex is still not available; wait again */
> +        /* Futex is not available; wait */
> +        s = futex(futexp, FUTEX_WAIT, 0, NULL, NULL, 0);
> +        if (s == \-1 && errno != EAGAIN)
> +            errExit("futex\-FUTEX_WAIT");
>      }
>  }
>  
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
