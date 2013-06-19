From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scalbln.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 19 Jun 2013 12:34:17 +0200
Message-ID: <51C18929.1000503@gmail.com>
References: <1371621503-16580-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371621503-16580-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/19/13 07:58, Peng Haitao wrote:
> The functions scalbn(), scalbnf(), scalbnl(), scalbln(),
> scalblnf() and scalblnl() are thread safe.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/scalbln.3 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/man3/scalbln.3 b/man3/scalbln.3
> index 5235684..06128e0 100644
> --- a/man3/scalbln.3
> +++ b/man3/scalbln.3
> @@ -152,6 +152,17 @@ These functions do not set
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6803
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR scalbn (),
> +.BR scalbnf (),
> +.BR scalbnl (),
> +.BR scalbln (),
> +.BR scalblnf (),
> +and
> +.BR scalblnl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
