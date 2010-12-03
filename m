From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Minor issues in man2/open.2 man2/pread.2 man2/readv.2
Date: Fri, 3 Dec 2010 06:55:12 +0100
Message-ID: <AANLkTinDL8gYQ2dxp6zf+OLpfGEGrJfrOKBW9kogWcXq@mail.gmail.com>
References: <AANLkTingGnMCm1zp09Y8h=BQHUT-NEwE5856Y3cgFtiH@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTingGnMCm1zp09Y8h=BQHUT-NEwE5856Y3cgFtiH-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Denis,

On Sun, Nov 28, 2010 at 9:38 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
> Hello,
>
> Here is a patch about minor issues in recent changes.

Thanks. Applied for 3.22.

Cheers,

Michael


> diff --git a/man2/open.2 b/man2/open.2
> index eeaf0e1..ff3aa88 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -339,8 +339,8 @@ can be used without
> =A0if
> =A0.I pathname
> =A0refers to a block device.
> -If the block device is in use by the system (e.g., mounted)
> -.BR open (),
> +If the block device is in use by the system (e.g., mounted),
> +.BR open ()
> =A0fails with the error
> =A0.BR EBUSY .
>
> diff --git a/man2/pread.2 b/man2/pread.2
> index 3f341fb..6966b31 100644
> --- a/man2/pread.2
> +++ b/man2/pread.2
> @@ -121,7 +121,7 @@ became
> =A0and
> =A0.BR pwrite ()
> =A0became
> -.BR pwrite64 (),
> +.BR pwrite64 ().
> =A0The system call numbers remained the same.
> =A0The glibc
> =A0.BR pread ()
> diff --git a/man2/readv.2 b/man2/readv.2
> index 7dded97..5cf3ca4 100644
> --- a/man2/readv.2
> +++ b/man2/readv.2
> @@ -173,7 +173,7 @@ The file referred to by
> =A0.I fd
> =A0must be capable of seeking.
> =A0.SH "RETURN VALUE"
> -On success, the
> +On success,
> =A0.BR readv ()
> =A0and
> =A0.BR preadv ()
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
