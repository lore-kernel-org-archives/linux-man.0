From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usleep.3: usleep suspends calling thread, not process
Date: Fri, 3 Dec 2010 06:47:28 +0100
Message-ID: <AANLkTik41f5HfW_9QbJhRqwLYU+A2r4zDoCz5ZZd=pJo@mail.gmail.com>
References: <20101201171225.GA21870@foxbat.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101201171225.GA21870-hLZXBWembXzjFM9bn6wA6Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Dec 1, 2010 at 6:12 PM, Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org> wrote:
> Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>

Thanks Petr. Applied for 3.22.

Cheers,

Michael


> ---
> =A0man3/usleep.3 | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/man3/usleep.3 b/man3/usleep.3
> index b4b70bc..79d89a8 100644
> --- a/man3/usleep.3
> +++ b/man3/usleep.3
> @@ -65,7 +65,7 @@ _XOPEN_SOURCE\ &&\ _XOPEN_SOURCE_EXTENDED
> =A0.SH DESCRIPTION
> =A0The
> =A0.BR usleep ()
> -function suspends execution of the calling process for
> +function suspends execution of the calling thread for
> =A0(at least) \fIusec\fP microseconds.
> =A0The sleep may be lengthened slightly
> =A0by any system activity or by the time spent processing the call or=
 by the
> --
> 1.7.1
>
>
> Petr
>
> --
> Petr Uzel
> IRC: ptr_uzl @ freenode
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
