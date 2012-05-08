From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] symlinkat.2: tfix
Date: Tue, 8 May 2012 22:38:09 +1200
Message-ID: <CAKgNAkhgugGUrV73rXXf8uH+KqL6wnq_3MQk3mB4=HX+RJ4g=g@mail.gmail.com>
References: <CAMqf4EEmGDZF-NKxKvBmujjFXD7xPQCZ1rmSV3MsMOCRM+gSzQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMqf4EEmGDZF-NKxKvBmujjFXD7xPQCZ1rmSV3MsMOCRM+gSzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, May 8, 2012 at 8:09 PM, D. Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> =A0man2/symlinkat.2 | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)

Thank Denis. Applied

Cheers,

Michael


> diff --git a/man2/symlinkat.2 b/man2/symlinkat.2
> index ac5981b..5eed360 100644
> --- a/man2/symlinkat.2
> +++ b/man2/symlinkat.2
> @@ -114,7 +114,7 @@ is a file descriptor referring to a file other
> than a directory.
> =A0.SH VERSIONS
> =A0.BR symlinkat ()
> =A0was added to Linux in kernel 2.6.16;
> -library support was added to glibc in version 2.4..
> +library support was added to glibc in version 2.4.
> =A0.SH "CONFORMING TO"
> =A0POSIX.1-2008.
> =A0.SH NOTES



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
