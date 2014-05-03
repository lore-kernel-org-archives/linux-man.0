From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify: read(2) error handling
Date: Sat, 03 May 2014 21:21:41 +0200
Message-ID: <536541C5.40001@gmail.com>
References: <1399136269-7930-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399136269-7930-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += Eric]

Hello Heinrich,

On 05/03/2014 06:57 PM, Heinrich Schuchardt wrote:
> The last lines of fanotify_read() in fanotify_user.c are:
> 	if (start != buf && ret != -EFAULT)
> 		ret = buf - start;
> 	return ret;
> 
> This implies that an error code is only returned, if reading the first
> event on the queue fails or if EFAULT occurs.

I'm not quite sure if this text is needed. What sort of errors
are we talking about here that are not reported?

Cheers,

Michael



> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 083244f..6936b88 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -131,6 +131,14 @@ until either a file event occurs or the call is interrupted by a signal
>  The return value of
>  .BR read (2)
>  is the length of the filled buffer, or \-1 in case of an error.
> +If multiple events are on the fanotify queue,
> +.BR read (2)
> +will only report an error, if reading the first event fails or an error
> +.B EFAULT
> +occurs.
> +If reading the first event is successful but reading any further event fails,
> +.BR read (2)
> +returns the length of the buffer filled with all prior events.
>  After a successful
>  .BR read (2),
>  the read buffer contains one or more of the following structures:
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
