From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] standards.7: Added more references
Date: Mon, 1 Jun 2009 14:39:00 +0200
Message-ID: <cfd18e0f0906010539w7dc1b0aw2b53901bd32994dd@mail.gmail.com>
References: <45544.118.208.205.39.1243685024.squirrel@h4c.kr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <45544.118.208.205.39.1243685024.squirrel-pV9j36CBp5Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alfie-pV9j36CBp5Q@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Alfie,

On Sat, May 30, 2009 at 2:03 PM, Alfie <alfie-pV9j36CBp5Q@public.gmane.org> wrote:
> Hi guys,
>
> I have added more references to standards.7 (Version 3.22). IMHO, the=
se
> books are the definitive guides in their subject matter.

I don't doubt that these are the best currently available books on
their subject matter, but in the end, I don't think standards(7)
should act as a bibliography.

Yes, I know there are a few books listed there already, and, yes, I
wrote the page.

But my inclination would be to take the references to Gallmeister and
Lewine out (both now rather dated), rather than add more references.
And in fact, that is what I've done. (Adding more books to
standards(7) would only lead me into temptation one day in the
future.)

So, sorry -- but I won't take this patch.

Cheers,

Michael

> -- 8< --
>
> diff --git a/man7/standards.7 b/man7/standards.7
> index 1c7dbdd..a8c8e90 100644
> --- a/man7/standards.7
> +++ b/man7/standards.7
> @@ -130,13 +130,18 @@ For further information, see
> =A0by Bill O. Gallmeister (O'Reilly & Associates, Inc. ISBN 1-56592-0=
74-0).
> =A0.TP
> =A0.B POSIX.1c
> -IEEE Std 1003.1c-1995 describing the POSIX threads interfaces.
> +IEEE Std 1003.1c-1995 describing the POSIX threads interfaces. For f=
urther
> +information, see "Programming with POSIX Threads" by David R. Butenh=
of
> +(Addison-Wesley. ISBN 0-201-63392-2).
> =A0.TP
> =A0.B POSIX.1d
> =A0IEEE Std 1003.1c-1999 describing additional real-time extensions.
> =A0.TP
> =A0.B POSIX.1g
> -IEEE Std 1003.1g-2000 describing networking APIs (including sockets)=
=2E
> +IEEE Std 1003.1g-2000 describing networking APIs (including sockets)=
=2E For
> +further information, see "UNIX Network Programming: Networking APIs:=
 Sockets
> +and XTI; Volume 1" by W. Richard Stevens (Prentice-Hall, Inc. ISBN
> +0-13-490012-X).
> =A0.TP
> =A0.B POSIX.1j
> =A0IEEE Std 1003.1j-2000 describing advanced real-time extensions.
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
