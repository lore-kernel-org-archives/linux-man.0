From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] futex.7: SEE ALSO
Date: Tue, 17 Feb 2015 06:03:37 +0100
Message-ID: <54E2CBA9.3060201@gmail.com>
References: <1424101333-19091-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424101333-19091-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/16/2015 04:42 PM, Heinrich Schuchardt wrote:
> futex.7 is meant as overview of the usage of futexes. It should
> point to the related man-pages.
> 
> pthreads are the main usage of futexes, refer to pthread.7.
> Implementation of robust futexes requires knowledge of set_robust_list.2
> and get_robust_list.2.
> It is noworthy that a closing thread can wake up a futex. Hence mention
> clone.2 and set_tid_address.2.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/futex.7 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/futex.7 b/man7/futex.7
> index 2be1511..87d2997 100644
> --- a/man7/futex.7
> +++ b/man7/futex.7
> @@ -115,7 +115,12 @@ primitives; it is by no means the only one.
>  .\" Rusty Russell (IBM Linux Technology Center).
>  .\" This page written by bert hubert.
>  .SH SEE ALSO
> -.BR futex (2)
> +.BR clone (2),
> +.BR futex (2),
> +.BR get_robust_list (2),
> +.BR set_robust_list (2),
> +.BR set_tid_address (2),
> +.BR pthreads (7)
>  
>  .IR "Fuss, Futexes and Furwocks: Fast Userlevel Locking in Linux"
>  (proceedings of the Ottawa Linux Symposium 2002),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
