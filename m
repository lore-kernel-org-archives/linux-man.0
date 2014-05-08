From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] remquo.3: ATTRIBUTES: Note functions that are thread-safe
Date: Thu, 08 May 2014 11:42:10 +0200
Message-ID: <536B5172.60403@gmail.com>
References: <1399352536-18667-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399352536-18667-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thank you, Haitao. Applied.

Cheers,

Michael



On 05/06/2014 07:02 AM, Peng Haitao wrote:
> The functions remquo(), remquof() and remquol() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/remquo.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/remquo.3 b/man3/remquo.3
> index b683a97..43191bb 100644
> --- a/man3/remquo.3
> +++ b/man3/remquo.3
> @@ -9,7 +9,7 @@
>  .\" based on glibc infopages
>  .\" polished, aeb
>  .\"
> -.TH REMQUO 3 2010-09-20 "GNU" "Linux Programmer's Manual"
> +.TH REMQUO 3 2014-05-06 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  remquo, remquof, remquol \- remainder and part of quotient
>  .SH SYNOPSIS
> @@ -121,6 +121,14 @@ These functions do not set
>  .\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=6802
>  .SH VERSIONS
>  These functions first appeared in glibc in version 2.1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR remquo (),
> +.BR remquof (),
> +and
> +.BR remquol ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
