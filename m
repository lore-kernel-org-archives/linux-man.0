From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] des_crypt.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 26 Sep 2013 15:17:36 +0200
Message-ID: <524433F0.6030001@gmail.com>
References: <1379487545-27711-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379487545-27711-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 18.09.2013 08:59, Peng Haitao wrote:
> The functions ecb_crypt(), cbc_crypt() and des_setparity() are
> thread safe.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/des_crypt.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/des_crypt.3 b/man3/des_crypt.3
> index 2694a58..f673424 100644
> --- a/man3/des_crypt.3
> +++ b/man3/des_crypt.3
> @@ -11,7 +11,7 @@
>  .\" can be distributed under GPL.
>  .\" %%%LICENSE_END
>  .\"
> -.TH DES_CRYPT 3  2007-05-18 "" "Linux Programmer's Manual"
> +.TH DES_CRYPT 3  2013-09-18 "" "Linux Programmer's Manual"
>  .SH NAME
>  des_crypt, ecb_crypt, cbc_crypt, des_setparity, DES_FAILED \- fast
>  DES encryption
> @@ -131,6 +131,14 @@ is false only for the first two statuses.
>  .SH VERSIONS
>  These routines are present in libc 4.6.27 and later, and in
>  glibc 2.1 and later.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR ecb_crypt (),
> +.BR cbc_crypt (),
> +and
> +.BR des_setparity ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  4.3BSD.
>  Not in POSIX.1-2001.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
http://blog.man7.org/2013/09/linuxunix-system-programming-course.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
