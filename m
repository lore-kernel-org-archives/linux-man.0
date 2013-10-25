From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bzero.3: ATTRIBUTES: Note function that is thread-safe
Date: Sat, 26 Oct 2013 11:27:00 +1300
Message-ID: <526AF034.1000607@gmail.com>
References: <1382433880-30187-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382433880-30187-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 22.10.2013 22:24, Peng Haitao wrote:
> The function bzero() is thread safe.

Applied.

Thanks,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/bzero.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/bzero.3 b/man3/bzero.3
> index c89a3e1..71fd124 100644
> --- a/man3/bzero.3
> +++ b/man3/bzero.3
> @@ -28,7 +28,7 @@
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 21:28:17 1993 by Rik Faith <faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org>
>  .\" Modified Tue Oct 22 23:49:37 1996 by Eric S. Raymond <esr-4uCgticg2UFBDgjK7y7TUQ@public.gmane.org>
> -.TH BZERO 3  2008-08-06 "Linux" "Linux Programmer's Manual"
> +.TH BZERO 3  2013-10-22 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  bzero \- write zero-valued bytes
>  .SH SYNOPSIS
> @@ -47,6 +47,11 @@ bytes of the area starting at
>  to zero (bytes containing \(aq\\0\(aq).
>  .SH RETURN VALUE
>  None.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR bzero ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  4.3BSD.
>  This function is deprecated (marked as LEGACY in POSIX.1-2001): use
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
My next Linux/UNIX system programming course:
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
