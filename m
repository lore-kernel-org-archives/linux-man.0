From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] trunc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 17 Jun 2013 02:19:37 +0200
Message-ID: <51BE5619.60608@gmail.com>
References: <1371200877-28470-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371200877-28470-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/14/13 11:07, Peng Haitao wrote:
> The functions trunc(), truncf() and truncl() are thread safe.

Thanks, Peng. Applied in my branch for this work.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/trunc.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/trunc.3 b/man3/trunc.3
> index c60ae46..a2cd0d8 100644
> --- a/man3/trunc.3
> +++ b/man3/trunc.3
> @@ -66,6 +66,14 @@ If \fIx\fP is integral, infinite, or NaN, \fIx\fP itself is returned.
>  No errors occur.
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR trunc (),
> +.BR truncf (),
> +and
> +.BR truncl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
