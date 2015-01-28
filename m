From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cosh.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 28 Jan 2015 12:06:13 +0100
Message-ID: <54C8C2A5.1060004@gmail.com>
References: <1422425420-21012-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422425420-21012-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/28/2015 07:10 AM, Ma Shimiao wrote:
> The functions cosh(), coshf() and coshl() in glibc are thread safe.
> It's markings match glibc markings.


Thanks, Ma Shimiao. Applied in the mt_attributes branch.

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/cosh.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/cosh.3 b/man3/cosh.3
> index c71b75c..912b9b3 100644
> --- a/man3/cosh.3
> +++ b/man3/cosh.3
> @@ -116,6 +116,20 @@ is set to
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
> +.BR cosh (),
> +.BR coshf (),
> +.BR coshl ()
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
