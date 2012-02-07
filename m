From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: aio_error query
Date: Wed, 8 Feb 2012 07:25:48 +1300
Message-ID: <CAKgNAkgjOss__FerDwEqMW2MY2Bs0pwyVuNURuvoKAw7si4u_w@mail.gmail.com>
References: <4F1B32A4.1010809@jguk.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F1B32A4.1010809-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jon,

On Sun, Jan 22, 2012 at 10:48 AM, Jon Grant <jg-hus3n9K41k0@public.gmane.org> wrote:
> Hello
>
> http://www.kernel.org/doc/man-pages/online/pages/man3/aio_error.3.htm=
l
>
> Is this really positive?

Do you have some counter-evidence?

> errno is an int, and the values I think are not
> guaranteed to be positive (like with glibc). I work on a system where=
 they
> are all negative.

Error numbers are all positive. I don't understand your last sentence a=
bove.

Cheers,

Michael


> =A0 =A0 =A0 * =A0A positive error, if the asynchronous I/O operation =
failed. This is
> the
> =A0 =A0 =A0 =A0 =A0same value that would have been stored in the errn=
o variable in the
> case of
> =A0 =A0 =A0 =A0 =A0a synchronous read(2), write(2), fsync(2), or fdat=
async(2) call.
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
