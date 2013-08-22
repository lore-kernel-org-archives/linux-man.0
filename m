From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lseek64.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 22 Aug 2013 09:26:12 +0200
Message-ID: <5215BD14.6020504@gmail.com>
References: <1376902299-20386-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376902299-20386-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19/13 10:51, Peng Haitao wrote:
> The function lseek64() is thread safe.

Applied. Thanks.

Cheers,

Michael


> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/lseek64.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/lseek64.3 b/man3/lseek64.3
> index 8e5e88b..01e8e0d 100644
> --- a/man3/lseek64.3
> +++ b/man3/lseek64.3
> @@ -22,7 +22,7 @@
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\" %%%LICENSE_END
>  .\"
> -.TH LSEEK64 3 2004-12-11 "Linux" "Linux Programmer's Manual"
> +.TH LSEEK64 3 2013-08-19 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  lseek64 \- reposition 64-bit read/write file offset
>  .SH SYNOPSIS
> @@ -156,6 +156,11 @@ The prototype is:
>  .sp
>  For more details, see
>  .BR llseek (2).
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR lseek64 ()
> +function is thread-safe.
>  .SH SEE ALSO
>  .BR llseek (2),
>  .BR lseek (2)
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
