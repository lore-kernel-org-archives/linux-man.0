From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] memmem.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 17 Mar 2014 15:00:49 +0100
Message-ID: <53270011.9060802@gmail.com>
References: <1395039680-10653-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395039680-10653-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 03/17/2014 08:03 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The function memmem() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/memmem.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/memmem.3 b/man3/memmem.3
> index 7b97d2d..5552e6e 100644
> --- a/man3/memmem.3
> +++ b/man3/memmem.3
> @@ -27,7 +27,7 @@
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 18:50:48 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
>  .\" Interchanged 'needle' and 'haystack'; added history, aeb, 980113.
> -.TH MEMMEM 3  2008-12-05 "GNU" "Linux Programmer's Manual"
> +.TH MEMMEM 3  2014-03-17 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  memmem \- locate a substring
>  .SH SYNOPSIS
> @@ -56,6 +56,11 @@ The
>  .BR memmem ()
>  function returns a pointer to the beginning of the
>  substring, or NULL if the substring is not found.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR memmem ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  This function is a GNU extension.
>  .SH BUGS
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
