From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] aio_error.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 27 Jun 2013 00:35:19 +0200
Message-ID: <51CB6CA7.2010308@gmail.com>
References: <1372236430-13836-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372236430-13836-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/26/13 10:47, Peng Haitao wrote:
> The function aio_error() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>

Thanks. Applied.

Cheers,

Michael



> ---
>  man3/aio_error.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/aio_error.3 b/man3/aio_error.3
> index 8ec04e2..cd4ccce 100644
> --- a/man3/aio_error.3
> +++ b/man3/aio_error.3
> @@ -79,6 +79,11 @@ is not implemented.
>  The
>  .BR aio_error ()
>  function is available since glibc 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR aio_error ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001, POSIX.1-2008.
>  .SH EXAMPLE
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
