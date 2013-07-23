From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] floor.3: ATTRIBUTES: Note functions that are thread-safe
Date: Tue, 23 Jul 2013 13:27:53 +0200
Message-ID: <51EE68B9.9020900@gmail.com>
References: <1374547940-18079-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374547940-18079-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/23/13 04:52, Peng Haitao wrote:
> The functions floor(), floorf() and floorl() are thread safe.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/floor.3 | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/floor.3 b/man3/floor.3
> index 9bfba32..2dba54a 100644
> --- a/man3/floor.3
> +++ b/man3/floor.3
> @@ -24,7 +24,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH FLOOR 3  2010-09-20 "" "Linux Programmer's Manual"
> +.TH FLOOR 3  2013-07-23 "" "Linux Programmer's Manual"
>  .SH NAME
>  floor, floorf, floorl \- largest integral value not greater than argument
>  .SH SYNOPSIS
> @@ -77,6 +77,14 @@ itself is returned.
>  .SH ERRORS
>  No errors occur.
>  POSIX.1-2001 documents a range error for overflows, but see NOTES.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR floor (),
> +.BR floorf (),
> +and
> +.BR floorl ()
> +functions are thread-safe.
>  .SH CONFORMING TO
>  C99, POSIX.1-2001.
>  The variant returning
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
