From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inotify_init.2: tfix
Date: Tue, 8 May 2012 22:36:58 +1200
Message-ID: <CAKgNAkht0rra08kygV0cf2d125edg+FyNAO8m8746yfrS0OdWQ@mail.gmail.com>
References: <CAMqf4EGTNsUGGWS6QGApr=P7_GG0BUAMXTXK3CrALB2act0UOw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EGTNsUGGWS6QGApr=P7_GG0BUAMXTXK3CrALB2act0UOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 8, 2012 at 7:18 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> Here is a trivial patch.

Thanks. Applied.

Cheers,

Michael


> =A0man2/inotify_init.2 | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man2/inotify_init.2 b/man2/inotify_init.2
> index 3772543..41fccb7 100644
> --- a/man2/inotify_init.2
> +++ b/man2/inotify_init.2
> @@ -91,10 +91,10 @@ Insufficient kernel memory is available.
> =A0.SH VERSIONS
> =A0.BR inotify_init ()
> =A0first appeared in Linux 2.6.1;
> -lbrary support was added to glibc in version 2.4.
> +library support was added to glibc in version 2.4.
> =A0.BR inotify_init1 ()
> =A0was added in Linux 2.6.27;
> -lbrary support was added to glibc in version 2.9.
> +library support was added to glibc in version 2.9.
> =A0.SH "CONFORMING TO"
> =A0These system calls are Linux-specific.
> =A0.SH "SEE ALSO"



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
