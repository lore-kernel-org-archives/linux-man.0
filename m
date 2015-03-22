From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lgamma.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 22 Mar 2015 15:51:03 +0100
Message-ID: <550ED6D7.3050407@gmail.com>
References: <1426742587-32262-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426742587-32262-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/19/2015 06:23 AM, Ma Shimiao wrote:
> The markings match glibc markings.

Hello Ma Shimiao,

Patch applied. 

Thanks,

Michael



> ---
>  man3/lgamma.3 | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/man3/lgamma.3 b/man3/lgamma.3
> index 26859c1..fabdda0 100644
> --- a/man3/lgamma.3
> +++ b/man3/lgamma.3
> @@ -155,6 +155,28 @@ An overflow floating-point exception
>  is raised.
>  .\" glibc (as at 2.8) also supports an inexact
>  .\" exception for various cases.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR lgamma (),
> +.BR lgammaf (),
> +.br
> +.BR lgammal ()
> +T}	Thread safety	MT-Safe race:signgam
> +T{
> +.BR lgamma_r (),
> +.BR lgammaf)r (),
> +.br
> +.BR lgammal_r ()
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  The
>  .BR lgamma ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
