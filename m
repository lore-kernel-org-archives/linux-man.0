From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tmpnam.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Sat, 08 Jun 2013 05:53:50 +0200
Message-ID: <51B2AACE.3000907@gmail.com>
References: <1370398370-4574-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370398370-4574-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/05/13 04:12, Peng Haitao wrote:
> The function tmpnam() is thread safe with exceptions.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/tmpnam.3 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/man3/tmpnam.3 b/man3/tmpnam.3
> index b2bc3b2..0b92970 100644
> --- a/man3/tmpnam.3
> +++ b/man3/tmpnam.3
> @@ -74,6 +74,16 @@ function returns a pointer to a unique temporary
>  filename, or NULL if a unique name cannot be generated.
>  .SH ERRORS
>  No errors are defined.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR tmpnam ()
> +function is thread-safe with exceptions.
> +It is not thread-safe if called with a NULL parameter.
> +.LP
> +The
> +.BR tmpnam_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, C89, C99, POSIX.1-2001.
>  POSIX.1-2008 marks
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
