From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getauxval.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 10 Apr 2014 21:18:57 +0200
Message-ID: <5346EEA1.3030309@gmail.com>
References: <1396941355-7580-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396941355-7580-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 04/08/2014 09:15 AM, Peng Haitao wrote:
> The function getauxval() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getauxval.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index efcb28f..bbb1e55 100755
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -26,7 +26,7 @@
>  .\"
>  .\" FIXME glibc 2.18 added AT_HWCAP2
>  .\"
> -.TH GETAUXVAL 3  2014-01-11 "GNU" "Linux Programmer's Manual"
> +.TH GETAUXVAL 3  2014-04-08 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getauxval \- retrieve a value from the auxiliary vector
>  .SH SYNOPSIS
> @@ -184,6 +184,11 @@ No errors are diagnosed.
>  The
>  .BR getauxval ()
>  function was added to glibc in version 2.16.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getauxval ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is a nonstandard glibc extension.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
