From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] io_getevents.2: timeout will not be updated
Date: Mon, 8 Apr 2013 11:53:24 +0200
Message-ID: <CAKgNAkgQ0tSe+Sk2-j1XjM7st+JZJnNuTyZhkCajGhyxk4_vSQ@mail.gmail.com>
References: <1365104218-26042-1-git-send-email-jmoyer@redhat.com> <1365104218-26042-4-git-send-email-jmoyer@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365104218-26042-4-git-send-email-jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Apr 4, 2013 at 9:36 PM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> I looked back through the kernel code, and the timeout was never updated
> in any case.  I've submitted a patch upstream to change the comment
> above io_getevents.

Thanks Jeff. I councur (but it would have been good also to add me to
the CC of that patch, so I could track the discussion). Patch applied.

Cheers,

Michael



> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/io_getevents.2 |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/man2/io_getevents.2 b/man2/io_getevents.2
> index 34ecd4a..72317c3 100644
> --- a/man2/io_getevents.2
> +++ b/man2/io_getevents.2
> @@ -30,8 +30,7 @@ specified by \fIctx_id\fP.
>  The \fItimeout\fP argument specifies the amount of time to wait for events,
>  where a NULL timeout waits until at least \fImin_nr\fP events
>  have been seen.
> -Note that \fItimeout\fP is relative and will be updated if not NULL
> -and the operation blocks.
> +Note that \fItimeout\fP is relative.
>  .SH RETURN VALUE
>  On success,
>  .BR io_getevents ()
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
