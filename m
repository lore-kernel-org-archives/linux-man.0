From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] log2.3: log2 functions do not conform to C89
Date: Sun, 12 Sep 2010 09:19:50 +0200
Message-ID: <AANLkTimKMXVdn0QTKD2T-GrtHt-RCmP9ZFnZjjJwoV9G@mail.gmail.com>
References: <4BDE1C23.2090707@gatech.edu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4BDE1C23.2090707-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthew Flaschen <matthew.flaschen-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Matthew,

On Mon, May 3, 2010 at 2:43 AM, Matthew Flaschen
<matthew.flaschen-/4noJB3qBVQ3uPMLIKxrzw@public.gmane.org> wrote:
> Patch against latest git. =A0log2, log2f, and log2l do not conform to=
 C89.
> =A0They are defined in C99. =A0See http://flash-gordon.me.uk/ansi.c.t=
xt and
> http://www.schweikhardt.net/identifiers.html

Thanks. Applied for man-pages-3.27.

Cheers,

Michael


> diff --git a/man3/log2.3 b/man3/log2.3
> index 6a86b9a..7505039 100644
> --- a/man3/log2.3
> +++ b/man3/log2.3
> @@ -86,7 +86,7 @@ C99, POSIX.1-2001.
> =A0The variant returning
> =A0.I double
> =A0also conforms to
> -SVr4, 4.3BSD, C89.
> +SVr4, 4.3BSD.
> =A0.SH "SEE ALSO"
> =A0.BR cbrt (3),
> =A0.BR clog2 (3),
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
