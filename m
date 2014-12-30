From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] pow10.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 30 Dec 2014 14:19:10 +0100
Message-ID: <54A2A64E.3080102@gmail.com>
References: <1418201442-24965-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418201442-24965-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/10/2014 09:50 AM, Ma Shimiao wrote:
> The function pow10(), pow10f() and pow10l() are thread safe.
Thanks, Ma Shimiao. Applied in my local branch.

Cheers,

Michael



> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/pow10.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/pow10.3 b/man3/pow10.3
> index d6368fc..9a80827 100644
> --- a/man3/pow10.3
> +++ b/man3/pow10.3
> @@ -46,6 +46,20 @@ power
>  .IR x .
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw28 lb lb
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR pow10 (),
> +.BR pow10f (),
> +.BR pow10l ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  This is a GNU extension.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
