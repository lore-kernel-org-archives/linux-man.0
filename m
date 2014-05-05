From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: tfix
Date: Mon, 05 May 2014 19:55:08 +0200
Message-ID: <5367D07C.2050201@gmail.com>
References: <1399312034-4691-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399312034-4691-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Yuri. Applied.

Cheers,

Michael

On 05/05/2014 07:47 PM, Yuri Kozlov wrote:
> ---
>  man3/termios.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index 60413f5..71a1e6c 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -374,7 +374,12 @@ If \fBICANON\fP is also set, terminal is uppercase only.
>  Input is converted to lowercase, except for characters preceded by \\.
>  On output, uppercase characters are preceded by \\ and lowercase
>  characters are converted to uppercase.
> -[requires _BSD_SOURCE or _SVID_SOURCE or _XOPEN_SOURCE]
> +[requires
> +.B _BSD_SOURCE
> +or
> +.B _SVID_SOURCE
> +or
> +.BR _XOPEN_SOURCE ]
>  .\" glibc is probably now wrong to allow
>  .\" Define
>  .\" .B _XOPEN_SOURCE
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
