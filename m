From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] stpncpy.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 13 Jan 2014 21:42:45 +1300
Message-ID: <52D3A705.2070008@gmail.com>
References: <1389597732-12413-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389597732-12413-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/13/2014 08:22 PM, Peng Haitao wrote:
> The function stpncpy() is thread safe.

Applied. Thanks, Haitao.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/stpncpy.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/stpncpy.3 b/man3/stpncpy.3
> index 378f05a..fdf5139 100644
> --- a/man3/stpncpy.3
> +++ b/man3/stpncpy.3
> @@ -11,7 +11,7 @@
>  .\"   GNU glibc-2 source code and manual
>  .\"
>  .\" Corrected, aeb, 990824
> -.TH STPNCPY 3  2011-09-28 "GNU" "Linux Programmer's Manual"
> +.TH STPNCPY 3  2014-01-13 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  stpncpy \- copy a fixed-size string, returning a pointer to its end
>  .SH SYNOPSIS
> @@ -88,6 +88,11 @@ or, if
>  .I dest
>  is not null-terminated,
>  .IR dest + n .
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR stpncpy ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function was added to POSIX.1-2008.
>  Before that, it was a GNU extension.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
