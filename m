From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcpncpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Fri, 27 Dec 2013 07:44:58 +1300
Message-ID: <52BC792A.9090502@gmail.com>
References: <1387158484-13971-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387158484-13971-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/16/13 14:48, Peng Haitao wrote:
> The function wcpncpy() is thread safe.

Thanks, Peng Haitao! Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcpncpy.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcpncpy.3 b/man3/wcpncpy.3
> index 910dd6f..8b434e8 100644
> --- a/man3/wcpncpy.3
> +++ b/man3/wcpncpy.3
> @@ -12,7 +12,7 @@
>  .\"   Dinkumware C library reference http://www.dinkumware.com/
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"
> -.TH WCPNCPY 3 2011-10-01 "GNU" "Linux Programmer's Manual"
> +.TH WCPNCPY 3 2013-12-16 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wcpncpy \- copy a fixed-size string of wide characters,
>  returning a pointer to its end
> @@ -90,6 +90,11 @@ characters at
>  .BR wcpncpy ()
>  returns a pointer to the last wide character written, that is,
>  .IR dest + n \-1.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcpncpy ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2008.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
