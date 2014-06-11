From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mkstemp.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 11 Jun 2014 10:42:58 +0200
Message-ID: <53981692.8030408@gmail.com>
References: <1402465041-9951-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402465041-9951-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 06/11/2014 07:37 AM, Peng Haitao wrote:
> The functions mkstemp(), mkostemp(), mkstemps() and mkostemps()
> are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mkstemp.3 | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
> index d2367bb..b57a254 100644
> --- a/man3/mkstemp.3
> +++ b/man3/mkstemp.3
> @@ -192,6 +192,15 @@ is available since glibc 2.7.
>  and
>  .BR mkostemps ()
>  are available since glibc 2.11.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mkstemp (),
> +.BR mkostemp (),
> +.BR mkstemps (),
> +and
> +.BR mkostemps ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  .BR mkstemp ():
>  4.3BSD, POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
