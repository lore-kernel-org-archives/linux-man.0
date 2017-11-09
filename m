From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ioctl_tty.2: tfix
Date: Thu, 9 Nov 2017 08:38:27 +0100
Message-ID: <bddf92ac-59d1-ae47-e4dd-60dca246f066@gmail.com>
References: <20171108223250.1924-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171108223250.1924-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/08/2017 11:32 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael

> ---
>  man2/ioctl_tty.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/ioctl_tty.2 b/man2/ioctl_tty.2
> index 346f86bf5..cd2a30425 100644
> --- a/man2/ioctl_tty.2
> +++ b/man2/ioctl_tty.2
> @@ -281,7 +281,7 @@ Set the foreground process group ID of this terminal.
>  .TP
>  .BI "TIOCGSID	pid_t *" argp
>  Get the session ID of the given terminal.
> -This fails fail with the error
> +This fails with the error
>  .B ENOTTY
>  if the terminal is not a master pseudoterminal
>  and not our controlling terminal.
> @@ -293,7 +293,7 @@ Put the terminal into exclusive mode.
>  No further
>  .BR open (2)
>  operations on the terminal are permitted.
> -(They fail fail with
> +(They fail with
>  .BR EBUSY ,
>  except for a process with the
>  .BR CAP_SYS_ADMIN
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
