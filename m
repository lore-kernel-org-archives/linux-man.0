From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] modf.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 17 Jun 2013 02:19:58 +0200
Message-ID: <51BE562E.1050309@gmail.com>
References: <1371202039-28986-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371202039-28986-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/14/13 11:27, Peng Haitao wrote:
> The functions modf(), modff() and modfl() are thread safe.

Thanks, Peng. Applied in my branch for this work.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/modf.3 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man3/modf.3 b/man3/modf.3
> index 7b30002..1532ac6 100644
> --- a/man3/modf.3
> +++ b/man3/modf.3
> @@ -87,6 +87,14 @@ is positive infinity (negative infinity), +0 (\-0) is returned, and
>  is set to positive infinity (negative infinity).
>  .SH ERRORS
>  No errors occur.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR modf (),
> +.BR modff (),
> +and
> +.BR modfl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
