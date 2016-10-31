From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] readlink.2: tfix
Date: Mon, 31 Oct 2016 12:56:29 +0100
Message-ID: <01a92395-91fc-5ed1-6a9e-129ba6161e2e@gmail.com>
References: <1477843105-11701-1-git-send-email-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477843105-11701-1-git-send-email-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/30/2016 04:58 PM, Dr. Tobias Quathamer wrote:
> ---
>  man2/readlink.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, Tobias. Patch Applied.

Cheers,

Michael


> diff --git a/man2/readlink.2 b/man2/readlink.2
> index 936b494..aa8d33b 100644
> --- a/man2/readlink.2
> +++ b/man2/readlink.2
> @@ -155,7 +155,7 @@ for an explanation of the need for
>  On success, these calls return the number of bytes placed in
>  .IR buf .
>  (If the returned value equals
> -.IR busiz ,
> +.IR bufsiz ,
>  then truncation may have occurred.)
>  On error, \-1 is returned and
>  .I errno
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
