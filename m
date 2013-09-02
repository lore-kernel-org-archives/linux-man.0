From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mbsinit.3: ATTRIBUTES: Note function that is thread-safe
Date: Mon, 02 Sep 2013 07:36:26 +0200
Message-ID: <522423DA.5010007@gmail.com>
References: <1377504237-8474-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377504237-8474-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/26/13 10:03, Peng Haitao wrote:
> The function mbsinit() is thread safe.

Applied. Thanks.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mbsinit.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/mbsinit.3 b/man3/mbsinit.3
> index 04e3ce6..e7b5f60 100644
> --- a/man3/mbsinit.3
> +++ b/man3/mbsinit.3
> @@ -13,7 +13,7 @@
>  .\"   OpenGroup's Single UNIX specification http://www.UNIX-systems.org/online.html
>  .\"   ISO/IEC 9899:1999
>  .\"
> -.TH MBSINIT 3  2000-11-20 "GNU" "Linux Programmer's Manual"
> +.TH MBSINIT 3  2013-08-26 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  mbsinit \- test for initial shift state
>  .SH SYNOPSIS
> @@ -81,6 +81,11 @@ is an initial state, or if
>  .I ps
>  is a NULL pointer.
>  Otherwise it returns 0.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mbsinit ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
