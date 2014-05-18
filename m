From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] fanotify_init.2: checking event_f_flags
Date: Sun, 18 May 2014 09:49:23 +0200
Message-ID: <53786603.9060704@gmail.com>
References: <1400175344-11599-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400175344-11599-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jan Kara <jack-AlSwsSmVLrQ@public.gmane.org>, Eric Paris <eparis-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/15/2014 07:35 PM, Heinrich Schuchardt wrote:
> With a new patch included in the mm tree event_f_flags is checked for
> allowable values.

Thanks Heinrich. Applied, with minor tweaks.

Cheers,

Michael


> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/fanotify_init.2 | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/man2/fanotify_init.2 b/man2/fanotify_init.2
> index 2cb2887..9e0a36c 100644
> --- a/man2/fanotify_init.2
> +++ b/man2/fanotify_init.2
> @@ -152,7 +152,9 @@ For details of these flags, see the description of the
>  .I flags
>  values in
>  .BR open (2).
> -Useful values are:
> +.I event_f_flags
> +comprises a multi-bit field for the access mode.
> +This field can take the following values:
>  .TP
>  .B O_RDONLY
>  This value allows only read access.
> @@ -162,9 +164,10 @@ This value allows only write access.
>  .TP
>  .B O_RDWR
>  This value allows read and write access.
> -.TP
> -.B O_CLOEXEC
> -Enable the close-on-exec flag for the file descriptor.
> +.PP
> +Additional bits can be set in
> +.IR event_f_flags .
> +The most useful values are:
>  .TP
>  .B O_LARGEFILE
>  Enable support for files exceeding 2 GB.
> @@ -172,6 +175,20 @@ Failing to set this flag will result in an
>  .B EOVERFLOW
>  error when trying to open a large file which is monitored by
>  an fanotify group on a 32-bit system.
> +.TP
> +.B O_CLOEXEC
> +Enable the close-on-exec flag for the file descriptor.
> +.PP
> +The following are also allowable:
> +.BR O_APPEND ,
> +.BR O_DSYNC ,
> +.BR O_NOATIME ,
> +.BR O_NONBLOCK ,
> +and
> +.BR O_SYNC .
> +All other values will lead to an error
> +.B EINVAL
> +(but see BUGS).
>  .SH RETURN VALUE
>  On success,
>  .BR fanotify_init ()
> @@ -183,9 +200,12 @@ is set to indicate the error.
>  .TP
>  .B EINVAL
>  An invalid value was passed in
> -.IR flags .
> +.I flags
> +or
> +.IR event_f_flags .
>  .B FAN_ALL_INIT_FLAGS
> -defines all allowable bits.
> +defines all allowable bits for
> +.IR flags .
>  .TP
>  .B EMFILE
>  The number of fanotify groups for this user exceeds 128.
> @@ -213,7 +233,7 @@ This system call is Linux-specific.
>  As of Linux 3.15,
>  the following bug exists:
>  .IP * 3
> -.\" FIXME: Patch proposed.
> +.\" FIXME: Patch accepted to mm tree.
>  The
>  .I event_f_flags
>  argument is not checked for invalid flags.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
