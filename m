From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: alphabetic index feedback
Date: Wed, 18 Apr 2012 07:55:36 +1200
Message-ID: <CAKgNAkgwE-ih9eCOeECfATbSbOCBy_3n9PprjiYpVL5peqcjBA@mail.gmail.com>
References: <4E922739.8050900@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E922739.8050900-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Mon, Oct 10, 2011 at 11:59 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hi
>
> Just looking at this page:
>
> http://www.man7.org/linux/man-pages/online/dir_all_alphabetic.html
>
>
> I propose to clarify a few entries:
> "accept4(2) - accept a connection on a socket"
>
> Changed to:
> "accept4(2) - accept a connection on a socket with flags"

The reason that the title is what it is is that "accept4" and "accept"
are on a single man page.

> current:
> =A0 =A0acos(3) - arc cosine function
> =A0 =A0acosf(3) - arc cosine function
>
> Propose to change to:
> =A0 =A0acos(3) - double precision arc cosine function
> =A0 =A0acosf(3) - float precision arc cosine function
> =A0 =A0acosl(3) - long double precision arc cosine function

See above.

> ^ Note, the last one is missing from current alphabetic index current=
ly.

At least now, that no longer appears to be a problem:
http://man7.org/linux/man-pages/dir_all_alphabetic.html

> There are other similar variations in function returns, float, double=
, so
> could be good to update those as well.
>
>
> " aio_init(3) - POSIX asynchronous I/O initialization"

I've just fixed that now.

Cheers,

Michael


> All the other aio functions don't mention "POSIX", so thinking of
> consistency, could be removed from this one. Or perhaps added to all =
the
> others.
>
> Best regards, Jon



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
