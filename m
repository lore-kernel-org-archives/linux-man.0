From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] erfc.3: ATTRIBUTES: Note functions that are thread-safe
Date: Wed, 30 Oct 2013 14:43:49 +1300
Message-ID: <52706455.4090502@gmail.com>
References: <1383026473-30216-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383026473-30216-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 29.10.2013 19:01, Peng Haitao wrote:
> The functions erfc(), erfcf() and erfcl() are thread safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/erfc.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/erfc.3 b/man3/erfc.3
> index 708a1ee..800794d 100644
> --- a/man3/erfc.3
> +++ b/man3/erfc.3
> @@ -23,7 +23,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH ERFC 3  2010-09-20 "GNU" "Linux Programmer's Manual"
> +.TH ERFC 3  2013-10-29 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  erfc, erfcf, erfcl \- complementary error function
>  .SH SYNOPSIS
> @@ -119,6 +119,14 @@ These functions do not set
>  .IR errno .
>  .\" FIXME . Is it intentional that these functions do not set errno?
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6785
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR erfc (),
> +.BR erfcf (),
> +and
> +.BR erfcl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
