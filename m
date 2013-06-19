From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] strerror.3: ATTRIBUTES: Note function that is not thread-safe
Date: Wed, 19 Jun 2013 03:21:59 +0200
Message-ID: <51C107B7.2090001@gmail.com>
References: <1371461376-28573-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371461376-28573-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/17/13 11:29, Peng Haitao wrote:
> The function strerror() is not thread safe.

Thanks Peng. Applied in my branch.


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/strerror.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/strerror.3 b/man3/strerror.3
> index 60d3112..d93bc8a 100644
> --- a/man3/strerror.3
> +++ b/man3/strerror.3
> @@ -172,6 +172,15 @@ is not a valid error number.
>  .TP
>  .B ERANGE
>  Insufficient storage was supplied to contain the error description string.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR strerror ()
> +function is not thread-safe.
> +.LP
> +The
> +.BR strerror_r ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  .BR strerror ()
>  is specified by POSIX.1-2001, C89, C99.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
