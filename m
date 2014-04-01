From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] exit.3: ATTRIBUTES: Note function that is not thread-safe
Date: Tue, 01 Apr 2014 20:14:22 +0200
Message-ID: <533B01FE.3020505@gmail.com>
References: <1395716530-22042-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395716530-22042-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org" <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org" <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>, "aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Thanks, Haitao! Applied.

Cheers,

Michael


On 03/25/2014 04:04 AM, penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org wrote:
> The function exit() is not thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/exit.3 | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/exit.3 b/man3/exit.3
> index 51163e4..69f42bc 100644
> --- a/man3/exit.3
> +++ b/man3/exit.3
> @@ -26,7 +26,7 @@
>  .\" could be listed on this page. See, for example, the list in the
>  .\" POSIX exit(3p) page.
>  .\"
> -.TH EXIT 3  2013-02-14 "Linux" "Linux Programmer's Manual"
> +.TH EXIT 3  2014-03-25 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  exit \- cause normal process termination
>  .SH SYNOPSIS
> @@ -87,6 +87,12 @@ termination, respectively.
>  The
>  .BR exit ()
>  function does not return.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR exit ()
> +function uses a global variable that is not protected,
> +so it is not thread-safe.
>  .SH CONFORMING TO
>  SVr4, 4.3BSD, POSIX.1-2001, C89, C99.
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
