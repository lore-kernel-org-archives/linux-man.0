From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ferror.3: ATTRIBUTES: Note functions that are thread-safe
Date: Sat, 08 Jun 2013 05:53:48 +0200
Message-ID: <51B2AACC.3090308@gmail.com>
References: <1370399498-6355-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370399498-6355-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/05/13 04:31, Peng Haitao wrote:
> The functions ferror(), clearerr(), feof() and fileno() are
> thread safe.


Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/ferror.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/ferror.3 b/man3/ferror.3
> index c78a4ea..976a37b 100644
> --- a/man3/ferror.3
> +++ b/man3/ferror.3
> @@ -103,6 +103,15 @@ return \-1 and set
>  .I errno
>  to
>  .BR EBADF .)
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR clearerr (),
> +.BR feof (),
> +.BR ferror ()
> +and
> +.BR fileno ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  The functions
>  .BR clearerr (),
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
