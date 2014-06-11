From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] siginterrupt.3: ATTRIBUTES: Note function that is not
 thread-safe
Date: Wed, 11 Jun 2014 10:41:18 +0200
Message-ID: <5398162E.3060707@gmail.com>
References: <1402470146-16506-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402470146-16506-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 06/11/2014 09:02 AM, Peng Haitao wrote:
> The function siginterrupt() is not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/siginterrupt.3 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man3/siginterrupt.3 b/man3/siginterrupt.3
> index bdf8b21..8365348 100644
> --- a/man3/siginterrupt.3
> +++ b/man3/siginterrupt.3
> @@ -84,6 +84,12 @@ set to indicate the cause of the error.
>  .TP
>  .B EINVAL
>  The specified signal number is invalid.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR siginterrupt ()
> +function uses a global variable that is not protected,
> +so it is not thread-safe.
>  .SH CONFORMING TO
>  4.3BSD, POSIX.1-2001.
>  POSIX.1-2008 marks
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
