From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] fanotify.7: BUGS, error handling in fanotify_read
Date: Thu, 15 May 2014 05:32:11 +0200
Message-ID: <5374353B.7000601@gmail.com>
References: <5373ADF9.4020505@bfs.de> <1400091016-17670-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400091016-17670-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/14/2014 08:10 PM, Heinrich Schuchardt wrote:
> The patch in
> http://www.spinics.net/lists/linux-man/msg05589.html
> was not accepted.
> 
> Michael Kerrisk suggested in a private mail to add a comment
> in the BUGS section.

Hi Heinrich,

Thanks! I've applied this patch (and fixed a few typos) and added
Reviewed-by: Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>

Cheers,

Michael


> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/fanotify.7 | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/fanotify.7 b/man7/fanotify.7
> index 2a92908..c6cec7c 100644
> --- a/man7/fanotify.7
> +++ b/man7/fanotify.7
> @@ -164,7 +164,7 @@ so that multiple events can be retrieved by a single
>  The return value of
>  .BR read (2)
>  is the number of bytes placed in the buffer,
> -or \-1 in case of an error.
> +or \-1 in case of an error (but see BUGS).
>  
>  The fields of the
>  .I fanotify_event_metadata
> @@ -468,7 +468,7 @@ The event queue can overflow.
>  In this case, events are lost.
>  .SH BUGS
>  As of Linux 3.15,
> -the following bug exists:
> +the following bugs exists:
>  .IP * 3
>  .\" FIXME: A patch was proposed.
>  When an event is generated,
> @@ -478,6 +478,16 @@ before passing a file descriptor for that file.
>  This poses a security risk, when the
>  .B CAP_SYS_ADMIN
>  capability is set for programs executed by unprivileged users.
> +.IP *
> +If a call to
> +.BR read( 2 )
> +processes multiple events from the fanotify queue and an error occurs, the
> +return value will be the cumulated length of the events successfully copied to
> +the user space buffer before the error occured.
> +The return value will not be \-1.
> +.I errno
> +will not be set.
> +Thus, the user program has no way to detect the error.
>  .SH EXAMPLE
>  The following program demonstrates the usage of the fanotify API.
>  It marks the mount point passed as a command-line argument
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
