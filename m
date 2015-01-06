From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sinh.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 06 Jan 2015 07:33:10 +0100
Message-ID: <54AB81A6.9010103@gmail.com>
References: <1420007616-10271-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420007616-10271-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/2014 07:33 AM, Ma Shimiao wrote:
> The function sinh(), sinhf() and sinhl() are thread safe.


Thanks, Ma Shimiao. Applied in my local branch.

I just now noticed a small problem with all of your patches:
could you please ensure that in the subject line, there is a space
following the colon (:) after the page name. Thus

[PATCH] sinh.3:ATTRIBUTES: Note functions that are thread-safe

should be 

[PATCH] sinh.3: ATTRIBUTES: Note functions that are thread-safe

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/sinh.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/sinh.3 b/man3/sinh.3
> index ad838ad..0bb79c0 100644
> --- a/man3/sinh.3
> +++ b/man3/sinh.3
> @@ -121,6 +121,20 @@ is set to
>  An overflow floating-point exception
>  .RB ( FE_OVERFLOW )
>  is raised.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw24 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR sinh (),
> +.BR sinhf (),
> +.BR sinhl ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
