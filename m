From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages 3.45, if_nameindex(3): double negation
Date: Mon, 24 Dec 2012 03:53:38 +0100
Message-ID: <CAKgNAkh_TjhSz-BHH1aK=xsUaT02s4A3onpqE2VM81UOwvDYqw@mail.gmail.com>
References: <20121223224439.GA8129@spin>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121223224439.GA8129@spin>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?C=E9dric_Boutillier?= <cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello C=E9dric

On Sun, Dec 23, 2012 at 11:44 PM, C=E9dric Boutillier
<cedric.boutillier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I noticed a double negation in the man page of if_nameindex(3) (prese=
nt
> in 3.45 and online version dating from 2012-12-20):
> ERRORS         top
>
>        if_nameindex() may fail and set errno if:
>
>        ENOBUFS
>               Insufficient resources unavailable.
>               ^^^^^^^^^^^^           ^^^^^^^^^^^
>
> Patch attached replacing unavailable into available.

Thanks! Applied.

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
