From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] catan.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 04 Feb 2015 07:14:07 +0100
Message-ID: <54D1B8AF.7070407@gmail.com>
References: <1423029320-11638-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423029320-11638-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/04/2015 06:55 AM, Ma Shimiao wrote:
> The functions catan(), catanf() and catanl() are thread safe.
> Their markings match glibc markings.

Hello Ma Shimiao,

Applied, but fixups were required. See below.

> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/catan.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/catan.3 b/man3/catan.3
> index 13e1023..ee4fbe9 100644
> --- a/man3/catan.3
> +++ b/man3/catan.3
> @@ -33,6 +33,20 @@ One has:
>  .fi
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lb
> +l l l.
> +Interface  Attribute   Value

The whitespace above should have been tabs.

> +T{
> +.BR catan (),
> +.BR catanf (),
> +.BR catanl ()
> +T} Thread safety   MT-Safe

The whitespace above should have been tabs.

> +.TE
>  .SH CONFORMING TO
>  C99.
>  .SH EXAMPLE

The above errors caused the table not to render. Please do check the
rendered output for each patch.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
