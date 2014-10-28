From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] fanotify.7: fallocate creates no events
Date: Tue, 28 Oct 2014 12:44:25 +0100
Message-ID: <544F8199.7040700@gmail.com>
References: <1412287353-5234-1-git-send-email-xypron.glpk@gmx.de> <1412287571-5352-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412287571-5352-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Heinrich.

Applied.

Cheers,

Michael

On 10/03/2014 12:06 AM, Heinrich Schuchardt wrote:
> fallocate(2) should create FAN_MODIFY events but does not.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index bc5a11c..e718249 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -488,6 +488,10 @@ In this case, events are lost.
>  As of Linux 3.17,
>  the following bugs exist:
>  .IP * 3
> +Calling
> +.BR fallocate (2)
> +does not create any fanotify events.
> +.IP *
>  .\" FIXME . A patch was proposed.
>  When an event is generated,
>  no check is made to see whether the user ID of the
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
