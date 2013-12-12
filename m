From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcpcpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 12 Dec 2013 16:14:02 +1300
Message-ID: <52A929FA.2050801@gmail.com>
References: <1386670503-5704-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386670503-5704-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/10/13 23:15, Peng Haitao wrote:
> The function wcpcpy() is thread safe.

Thanks! Applied.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcpcpy.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcpcpy.3 b/man3/wcpcpy.3
> index e0eba54..3d437e9 100644
> --- a/man3/wcpcpy.3
> +++ b/man3/wcpcpy.3
> @@ -12,7 +12,7 @@
>  .\"   Dinkumware C library reference http://www.dinkumware.com/
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"
> -.TH WCPCPY 3  2011-10-01 "GNU" "Linux Programmer's Manual"
> +.TH WCPCPY 3  2013-12-10 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  wcpcpy \- copy a wide-character string, returning a pointer to its end
>  .SH SYNOPSIS
> @@ -64,6 +64,11 @@ wide characters at
>  returns a pointer to the end of the wide-character string
>  .IR dest ,
>  that is, a pointer to the terminating null wide character.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcpcpy ()
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
