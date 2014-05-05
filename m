From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] prctl.2: ffix
Date: Mon, 05 May 2014 08:23:36 +0200
Message-ID: <53672E68.6080407@gmail.com>
References: <1399235267-16903-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399235267-16903-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Simon. Applied.

Cheers,

Michael


On 05/04/2014 10:27 PM, Simon Paillard wrote:
> ---
>  man2/prctl.2 | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/prctl.2 b/man2/prctl.2
> index fcc8922..1199891 100644
> --- a/man2/prctl.2
> +++ b/man2/prctl.2
> @@ -962,7 +962,8 @@ is nonzero.
>  .TP
>  .B EINVAL
>  .I option
> -is PR_SET_THP_DISABLE
> +is
> +.BR PR_SET_THP_DISABLE
>  and
>  .IR arg3 ,
>  .IR arg4 ,
> @@ -972,7 +973,8 @@ is nonzero.
>  .TP
>  .B EINVAL
>  .I option
> -is PR_GET_THP_DISABLE
> +is
> +.BR PR_GET_THP_DISABLE
>  and
>  .IR arg2 ,
>  .IR arg3 ,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
