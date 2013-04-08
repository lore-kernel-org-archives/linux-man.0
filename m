From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] io_cancel.2: fix up the description
Date: Mon, 8 Apr 2013 12:04:22 +0200
Message-ID: <CAKgNAki66jwQvKGLDWRomG0-s29EP34MZCoU=eUjHnQsn3x8wA@mail.gmail.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com> <1365104218-26042-2-git-send-email-jmoyer@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-2-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 4, 2013 at 9:36 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> The description for this sytem call was a bit inaccurate.  Cyril
> still takes issue with my wording, so this is up for further
> word-smithing, I think.  I'm open to suggestions.

Cyril, do you have any comment?

Thanks,

Michael


> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/io_cancel.2 |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/man2/io_cancel.2 b/man2/io_cancel.2
> index 0f974ed..6adddf3 100644
> --- a/man2/io_cancel.2
> +++ b/man2/io_cancel.2
> @@ -26,10 +26,10 @@ attempts to cancel an asynchronous I/O operation previously submitted with
>  .BR io_submit (2).
>  The
>  .I ctx_id
> -argument is the AIO context ID of the operation to be canceled.
> -If the AIO context is found, the event will be canceled and then copied
> -into the memory pointed to by \fIresult\fP without being placed
> -into the completion queue.
> +argument is the AIO context ID into which the operation was submitted.
> +If the operation is successfully canceled, the event will be copied into
> +the memory pointed to by \fIresult\fP without being placed into the
> +completion queue.
>  .SH RETURN VALUE
>  On success,
>  .BR io_cancel ()
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
