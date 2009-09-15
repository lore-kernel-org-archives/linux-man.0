From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] splice.2, tee.2, vmsplice.2: Update return type
Date: Tue, 15 Sep 2009 06:00:07 +0200
Message-ID: <cfd18e0f0909142100v3d687616w8cce5d2957bed193@mail.gmail.com>
References: <1252529280-3366-1-git-send-email-mark@pogo.org.uk>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1252529280-3366-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Mark

On Wed, Sep 9, 2009 at 10:48 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> Return type is ssize_t since glibc-2.7, see /usr/include/bits/fcntl.h

Thanks. Applied for man-pages 3.23.

Cheers,

Michael

> ---
> =A0man2/splice.2 =A0 | =A0 =A04 ++--
> =A0man2/tee.2 =A0 =A0 =A0| =A0 =A02 +-
> =A0man2/vmsplice.2 | =A0 =A04 ++--
> =A03 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/man2/splice.2 b/man2/splice.2
> index d9c192a..1d4b74f 100644
> --- a/man2/splice.2
> +++ b/man2/splice.2
> @@ -31,8 +31,8 @@ splice \- splice data to/from a pipe
> =A0.B #define _GNU_SOURCE
> =A0.B #include <fcntl.h>
>
> -.BI "long splice(int " fd_in ", loff_t *" off_in ", int " fd_out ,
> -.BI " =A0 =A0 =A0 =A0 =A0 =A0loff_t *" off_out ", size_t " len \
> +.BI "ssize_t splice(int " fd_in ", loff_t *" off_in ", int " fd_out =
,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 loff_t *" off_out ", size_t " len =
\
> =A0", unsigned int " flags );
> =A0.fi
> =A0.SH DESCRIPTION
> diff --git a/man2/tee.2 b/man2/tee.2
> index 323bee5..feda6c8 100644
> --- a/man2/tee.2
> +++ b/man2/tee.2
> @@ -31,7 +31,7 @@ tee \- duplicating pipe content
> =A0.B #define _GNU_SOURCE
> =A0.B #include <fcntl.h>
>
> -.BI "long tee(int " fd_in ", int " fd_out ", size_t " len \
> +.BI "ssize_t tee(int " fd_in ", int " fd_out ", size_t " len \
> =A0", unsigned int " flags );
> =A0.fi
> =A0.SH DESCRIPTION
> diff --git a/man2/vmsplice.2 b/man2/vmsplice.2
> index 2c95893..91b2d04 100644
> --- a/man2/vmsplice.2
> +++ b/man2/vmsplice.2
> @@ -32,8 +32,8 @@ vmsplice \- splice user pages into a pipe
> =A0.B #include <fcntl.h>
> =A0.B #include <sys/uio.h>
>
> -.BI "long vmsplice(int " fd ", const struct iovec *" iov ,
> -.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long " nr_segs ", unsigned=
 int " flags );
> +.BI "ssize_t vmsplice(int " fd ", const struct iovec *" iov ,
> +.BI " =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long " nr_segs ", uns=
igned int " flags );
> =A0.fi
> =A0.SH DESCRIPTION
> =A0.\" Linus: vmsplice() system call to basically do a "write to
> --
> 1.6.3.2
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
