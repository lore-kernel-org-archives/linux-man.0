From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] remainder.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Feb 2015 08:13:17 +0100
Message-ID: <54DB010D.1080805@gmail.com>
References: <1423623364-18973-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423623364-18973-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/11/2015 03:56 AM, Ma Shimiao wrote:
> The markings match glibc markings.


Thanks, Ma Shimiao. Applied.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/remainder.3 | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/man3/remainder.3 b/man3/remainder.3
> index d2b4e79..7a18300 100644
> --- a/man3/remainder.3
> +++ b/man3/remainder.3
> @@ -177,6 +177,25 @@ is set to
>  An invalid floating-point exception
>  .RB ( FE_INVALID )
>  is raised.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw26 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR drem (),
> +.BR dremf (),
> +.BR dreml (),
> +.br
> +.BR remainder (),
> +.BR remainderf (),
> +.br
> +.BR remainderl ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  .\" IEC 60559.
>  The functions
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
