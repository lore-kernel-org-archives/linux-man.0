From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Explain how to read a single inotify event.
Date: Tue, 24 Apr 2012 09:43:11 +1200
Message-ID: <CAKgNAkgB3_SUsnH0-c8X6Lute8amtEkw0VtrsCqFGWn+c4yfQA@mail.gmail.com>
References: <4EDDE325.2080203@ubuntu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EDDE325.2080203-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi James,

On Tue, Dec 6, 2011 at 10:40 PM, James Hunt <james.hunt-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> man7/inotify.7:
>
> - Explain how to read a single inotify event.
> - Add missing "struct" in explanation of event size.

Re your patch:

> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -144,7 +144,7 @@ including the null bytes;
>  the length of each
>  .I inotify_event
>  structure is thus
> -.IR "sizeof(inotify_event)+len" .
> +.IR "sizeof(struct inotify_event)+len" .

Applied.

>  The behavior when the buffer given to
>  .BR read (2)
> @@ -417,6 +417,28 @@ be aware that by the time you create a watch for the new subdirectory,
>  new files may already have been created in the subdirectory.
>  Therefore, you may want to scan the contents of the subdirectory
>  immediately after adding the watch.
> +
> +To read a
> +.B single
> +event requires the buffer provided to
> +.BR read (2)
> +be large enough to hold the event. However, since inotify employs
> +variable-length events for files in a watched directory (via the
> +.I name
> +field), it is not possible to know exactly how big such a
> +buffer should be since the event itself has not yet been read. One
> +method to overcome this limitation is to start with a buffer of size
> +.I sizeof(struct inotify_event)
> +and attempt to read the event. If this fails with
> +.BR EINVAL ","
> +continue to increase the buffer size by one byte up to
> +.I "sizeof(struct inotify_event)+NAME_MAX"
> +until
> +.BR read (2)
> +does not returnvi
> +.BR EINVAL "."
> +Note that this technique is not particularly efficient.
> +
>  .SH "BUGS"
>  In kernels before 2.6.16, the
>  .B IN_ONESHOT

I've just now added a note to the page that specifying a buffer size
of at least "sizeof(struct inotify_event) + NAME_MAX + 1"  is
sufficient to read *at least* one event. My question is, why do you
want to propose this technique for reading a *single* event.?

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
