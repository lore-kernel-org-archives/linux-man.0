From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getdtablesize.3: ATTRIBUTES: Note function that is thread-safe
Date: Wed, 11 Jun 2014 11:25:59 +0200
Message-ID: <539820A7.3050804@gmail.com>
References: <1402478144-25758-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402478144-25758-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks. Applied.

Cheers,

Michael


On 06/11/2014 11:15 AM, Peng Haitao wrote:
> The function getdtablesize() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getdtablesize.3 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man3/getdtablesize.3 b/man3/getdtablesize.3
> index ba5c221..f42a15b 100644
> --- a/man3/getdtablesize.3
> +++ b/man3/getdtablesize.3
> @@ -66,6 +66,11 @@ On Linux,
>  can return any of the errors described for
>  .BR getrlimit (2);
>  see NOTES below.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getdtablesize ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.4BSD (the
>  .BR getdtablesize ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
