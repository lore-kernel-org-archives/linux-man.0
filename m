From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] io_destroy.2: fix up the description
Date: Mon, 8 Apr 2013 12:02:54 +0200
Message-ID: <CAKgNAkhCWFFZY=8L_no_3v2OGrXYx5wZOz3gtjwgAEjPRCbSjA@mail.gmail.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com> <1365104218-26042-3-git-send-email-jmoyer@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-3-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jeff,

On Thu, Apr 4, 2013 at 9:36 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The description was rather vague, citing a "list of I/O contexts" and
> stating that it "can" cancel outstanding requests.  This update makes
> things more concrete so that a reader knows exactly what's going on.

Thanks. Applied.

Cheers,

Michael


> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/io_destroy.2 |    9 +++------
>  1 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/man2/io_destroy.2 b/man2/io_destroy.2
> index 26a84f3..ea318bd 100644
> --- a/man2/io_destroy.2
> +++ b/man2/io_destroy.2
> @@ -21,12 +21,9 @@ There is no glibc wrapper for this system call; see NOTES.
>  The
>  .BR io_destroy ()
>  system call
> -removes the asynchronous I/O context specified by
> -.I ctx_id
> -from the list of
> -I/O contexts and then destroys it.
> -It can also cancel any outstanding asynchronous I/O
> -actions on \fIctx_id\fP and block on completion.
> +will attempt to cancel all outstanding asynchronous I/O operations
> +against \fIctx_id\fP, will block on the completion of all operations
> +that could not be cancelled, and will destroy the the \fIctx_id\fP.
>  .SH RETURN VALUE
>  On success,
>  .BR io_destroy ()
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
