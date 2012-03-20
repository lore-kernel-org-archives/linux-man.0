From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mallopt(3) manpage found in Debian
Date: Wed, 21 Mar 2012 06:48:04 +1300
Message-ID: <CAKgNAkhhk9yZYwowAbNhPL04Ycj1mXvfgKj7xeB612A_YDSrAg@mail.gmail.com>
References: <20120302013034.GA15580@dcvr.yhbt.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120302013034.GA15580-yBiyF41qdooeIZ0/mPfg9Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Justin Pryzby <justinpryzby-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Martin Schulze <joey-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 2, 2012 at 2:30 PM, Eric Wong <normalperson-rMlxZR9MS24@public.gmane.org> wrote=
:
> Hello, I noticed there's a mallopt(3) manpage found in Debian
> but not the official upstream sources.
>
> =A0http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D419751
>
> Can we get this included in upstream?
>
> I'm hoping sections for M_ARENA_TEST and M_ARENA_MAX can be
> be added, too.

There will be a better mallopt(3) page in upstream 3.38 (though the
ARENA parameters remain to be documented).

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
