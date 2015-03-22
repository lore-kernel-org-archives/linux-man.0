From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fmemopen.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sun, 22 Mar 2015 15:50:03 +0100
Message-ID: <550ED69B.4060508@gmail.com>
References: <1426138426-3801-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426138426-3801-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/12/2015 06:33 AM, Ma Shimiao wrote:
> The markings match glibc markings.

Hello Ma Shimiao,

Patch applied. 

Thanks,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/fmemopen.3 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/man3/fmemopen.3 b/man3/fmemopen.3
> index 824754e..4e84bf8 100644
> --- a/man3/fmemopen.3
> +++ b/man3/fmemopen.3
> @@ -196,6 +196,23 @@ and
>  were already available in glibc 1.0.x.
>  .BR open_wmemstream ()
>  is available since glibc 2.4.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR fopenmem (),
> +.br
> +.BR open_memstream (),
> +.br
> +.BR open_wmemstream
> +T}	Thread safety	MT-Safe
> +.TE
> +
>  .SH CONFORMING TO
>  POSIX.1-2008.
>  These functions are not specified in POSIX.1-2001,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
