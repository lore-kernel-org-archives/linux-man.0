From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memchr.3: ATTRIBUTES: Note functions that are thread-safe
Date: Mon, 10 Mar 2014 15:09:59 +0100
Message-ID: <531DC7B7.1050001@gmail.com>
References: <1394438130-32010-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394438130-32010-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao. Applied.

Cheers,

Michael


On 03/10/2014 08:55 AM, Peng Haitao wrote:
> The functions memchr(), memrchr() and rawmemchr() are thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/memchr.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/memchr.3 b/man3/memchr.3
> index c67689e..7e35784 100644
> --- a/man3/memchr.3
> +++ b/man3/memchr.3
> @@ -29,7 +29,7 @@
>  .\" Modified Wed Feb 20 21:09:36 2002, Ian Redfern (redferni-AhJhbHGVnpvQT0dZR+AlfA@public.gmane.org)
>  .\" 2008-07-09, mtk, add rawmemchr()
>  .\"
> -.TH MEMCHR 3  2012-04-23 "" "Linux Programmer's Manual"
> +.TH MEMCHR 3  2014-03-10 "" "Linux Programmer's Manual"
>  .SH NAME
>  memchr, memrchr, rawmemchr \- scan memory for a character
>  .SH SYNOPSIS
> @@ -121,6 +121,14 @@ first appeared in glibc in version 2.1.
>  
>  .BR memrchr ()
>  first appeared in glibc in version 2.2.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR memchr (),
> +.BR memrchr (),
> +and
> +.BR rawmemchr ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  The
>  .BR memchr ()
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
