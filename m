From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify_init.2, fanotify_mark.2: ENOSYS if not available
Date: Thu, 01 May 2014 07:49:48 +0200
Message-ID: <5361E07C.9020608@gmail.com>
References: <1398890902-6696-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398890902-6696-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/30/2014 10:48 PM, Heinrich Schuchardt wrote:
> Both fanotify_init and fanotify_mark return ENOSYS, if the kernel
> was configured without setting CONFIG_FANOTIFY=y.
> 
> I tested both functions with an appropriately configured kernel 3.14.2.

Thanks, Heinrich. Applied.

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 | 7 +++++++
>  man2/fanotify_mark.2 | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> index e54fe7e..4824378 100644
> --- a/man2/fanotify_init.2
> +++ b/man2/fanotify_init.2
> @@ -191,6 +191,13 @@ The number of fanotify groups of the user exceeds 128.
>  .B ENOMEM
>  The allocation of memory for the notification group failed.
>  .TP
> +.B ENOSYS
> +This kernel does not implement
> +.BR fanotify_init ().
> +To make the fanotify API available,
> +.B CONFIG_FANOTIFY
> +has to be enabled in the Linux configuration.
> +.TP
>  .B EPERM
>  The operation is not permitted because the caller lacks the
>  .B CAP_SYS_ADMIN
> diff --git a/man2/fanotify_mark.2 b/man2/fanotify_mark.2
> index 693eff8..ad17ef8 100644
> --- a/man2/fanotify_mark.2
> +++ b/man2/fanotify_mark.2
> @@ -280,6 +280,13 @@ The number of marks exceeds the limit of 8192 and
>  was not specified in the call to
>  .BR fanotify_init (2).
>  .TP
> +.B ENOSYS
> +This kernel does not implement
> +.BR fanotify_mark (). 
> +To make the fanotify API available,
> +.B CONFIG_FANOTIFY
> +has to be enabled in the Linux configuration.
> +.TP
>  .B ENOTDIR
>  .I flags
>  contains
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
