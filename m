From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] io_setup.2: clarify nr_events
Date: Mon, 8 Apr 2013 11:58:27 +0200
Message-ID: <CAKgNAkhGAiDETDcQSFhYNCqJgbRH20SVHfV4=osW9=xAr1Zk4Q@mail.gmail.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com> <1365104218-26042-5-git-send-email-jmoyer@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-5-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 4, 2013 at 9:36 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> nr_events is technically the number of completion events that can
> be stored in the completion ring.  The wording of the man page:
>   "capable of receiving at least nr_events"
> seems dubious to me, only because I worry that folks might interpret
> that to mean nr_events total, instead of nr_events concurrently.
>
> Further, I've added information on where to find the per-user limit
> on nr_events, /proc/sys/fs/aio-max-nr.  Let me know if you think that
> is not relevent.

All looks good to me. Applied.

Cheers,

Michael


> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/io_setup.2 |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/man2/io_setup.2 b/man2/io_setup.2
> index 2a541bf..8527b80 100644
> --- a/man2/io_setup.2
> +++ b/man2/io_setup.2
> @@ -21,7 +21,7 @@ There is no glibc wrapper for this system call; see NOTES.
>  The
>  .BR io_setup ()
>  system call
> -creates an asynchronous I/O context capable of receiving
> +creates an asynchronous I/O context capable of concurrently processing
>  at least \fInr_events\fP.
>  The
>  .I ctx_idp
> @@ -37,7 +37,8 @@ For the failure return, see NOTES.
>  .SH ERRORS
>  .TP
>  .B EAGAIN
> -The specified \fInr_events\fP exceeds the user's limit of available events.
> +The specified \fInr_events\fP exceeds the user's limit of available events,
> +as defined in /proc/sys/fs/aio-max-nr.
>  .TP
>  .B EFAULT
>  An invalid pointer is passed for \fIctx_idp\fP.
> --
> 1.7.1
>



--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
