From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify_mark.2: mention FAN_Q_OVERFLOW
Date: Wed, 9 Nov 2016 08:42:35 +0100
Message-ID: <aa26643a-86e5-9422-0757-baae6fdee9a7@gmail.com>
References: <20161108221338.9611-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161108221338.9611-1-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Heinrich,

On 11/08/2016 11:13 PM, Heinrich Schuchardt wrote:
> To receive overflow events it is necessary to set this bit
> in fanotify_mark().

Thanks! Patch applied.

Cheers,

Michael

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_mark.2 | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> index 88aa17e..4933ecc 100644
> --- a/man2/fanotify_mark.2
> +++ b/man2/fanotify_mark.2
> @@ -149,6 +149,13 @@ Create an event when a read-only file or directory is closed.
>  .B FAN_OPEN
>  Create an event when a file or directory is opened.
>  .TP
> +.B FAN_Q_OVERFLOW
> +Create an event when an overflow of the event queue occurs.
> +The size of the event queue is limited to 16384 entries if
> +.B FAN_UNLIMITED_QUEUE
> +is not set in
> +.BR fanotify_init (2).
> +.TP
>  .B FAN_OPEN_PERM
>  Create an event when a permission to open a file or directory is requested.
>  An fanotify file descriptor created with
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
