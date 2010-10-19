From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for mbind.2 (more)
Date: Tue, 19 Oct 2010 12:38:39 +0200
Message-ID: <AANLkTi=dJ6qH126JC0Sz6S2vRbc0KdvEuP2xJdQZ0Qdv@mail.gmail.com>
References: <20101019104022.062a4205@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101019104022.062a4205-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Tue, Oct 19, 2010 at 8:40 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/mbind.2 =9A2010-03-26 17:46:41.000000000 +0300
> +++ /tmp/mbind.2 =9A =9A =9A =9A2010-10-19 10:38:48.000000000 +0400
> @@ -48,11 +48,12 @@
>
> =9AIf the memory range specified by the
> =9A.IR addr " and " len
> -arguments includes an "anonymous" region of memory\(emthat is
> +arguments includes an "anonymous" region of memory \(em that is
> =9Aa region of memory created using the
> =9A.BR mmap (2)
> =9Asystem call with the
> -.BR MAP_ANONYMOUS \(emor
> +.BR MAP_ANONYMOUS
> +\(em or

Usual typesetting usage in English is not to surround em-dashes with
spaces, so I didn't apply this piece.

> =9Aa memory mapped file, mapped using the
> =9A.BR mmap (2)
> =9Asystem call with the
> @@ -247,7 +248,7 @@
> =9Ais passed in
> =9A.I flags
> =9Aand
> -.I policy
> +.I mode
> =9Ais not
> =9A.BR MPOL_DEFAULT ,

Thanks. This piece applied for man-pages-3.29.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
