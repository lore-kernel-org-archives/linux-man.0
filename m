From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exp10.3:ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 06 Jan 2015 07:33:45 +0100
Message-ID: <54AB81C9.3060207@gmail.com>
References: <1420007144-9624-1-git-send-email-mashimiao.fnst@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420007144-9624-1-git-send-email-mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/2014 07:25 AM, Ma Shimiao wrote:
> The function exp10(), exp10f() and exp10l() are thread safe.


Thanks, Ma Shimiao. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/exp10.3 | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/man3/exp10.3 b/man3/exp10.3
> index d1dbb36..6ddfeac 100644
> --- a/man3/exp10.3
> +++ b/man3/exp10.3
> @@ -72,6 +72,20 @@ For a discussion of the errors that can occur for these functions, see
>  .BR exp (3).
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
> +.BR exp10 (),
> +.BR exp10f (),
> +.BR exp10l ()
> +T}	Thread safety	MT-Safe
> +.TE
>  .SH CONFORMING TO
>  These functions are GNU extensions.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
