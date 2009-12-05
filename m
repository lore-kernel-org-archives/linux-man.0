From: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: Remove reference to non-existent strpcpy(3)
Date: Sat, 5 Dec 2009 10:05:14 +0000 (GMT)
Message-ID: <alpine.NEB.2.01.0912051003570.27923@jrf.vwaro.pbz>
References: <1258826146-4474-1-git-send-email-mark@pogo.org.uk>  <20091121205012.GF3708@machine.or.cz>  <alpine.NEB.2.01.0911212052050.25031@jrf.vwaro.pbz> <cfd18e0f0912042336i5deb6e19kdbfc6de94435035f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-128068389-1260007451=:27923"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0912042336i5deb6e19kdbfc6de94435035f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-ID: <alpine.NEB.2.01.0912051004230.27923-4Gsws06j5aKxDRllUHgonQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-128068389-1260007451=:27923
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.NEB.2.01.0912051004231.27923-4Gsws06j5aKxDRllUHgonQ@public.gmane.org>

On Sat, 5 Dec 2009, Michael Kerrisk wrote:

> On Sat, Nov 21, 2009 at 10:16 PM, Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org> wrote:
> > On Sat, 21 Nov 2009, Petr Baudis wrote:
> >
> >> On Sat, Nov 21, 2009 at 05:55:46PM +0000, Mark Hills wrote:
> >> > There is no man page or function by this name.
> >> >
> >> > Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> >> > ---
> >> > =A0man3/strcpy.3 | =A0 =A01 -
> >> > =A01 files changed, 0 insertions(+), 1 deletions(-)
> >> >
> >> > diff --git a/man3/strcpy.3 b/man3/strcpy.3
> >> > index 9d47e37..c79efb1 100644
> >> > --- a/man3/strcpy.3
> >> > +++ b/man3/strcpy.3
> >> > @@ -137,6 +137,5 @@ in ways that may make the impossible possible.
> >> > =A0.BR memcpy (3),
> >> > =A0.BR memmove (3),
> >> > =A0.BR strdup (3),
> >> > -.BR strpcpy (3),
> >> > =A0.BR wcscpy (3),
> >> > =A0.BR wcsncpy (3)
> >>
> >> In fact, this should be fixed by making it a reference to stpcpy().
> >
> > ... which is the function I was looking for when I stumbled across the
> > missing strpcpy() reference. Thanks for finding it for me :-)
> >
> > I grep'd for any other misleading references to strpcpy() and can't see
> > any, so I'll follow up with a revised (tiny) patch, and an extra refere=
nce
> > in string(3).
>=20
> Okay -- so in the light of your other report, this report is obsolete. Ri=
ght?

That's correct. And you've applied the revised patches, thanks.

> Cheers,
>=20
> Michael
>=20
>=20
>=20

--=20
Mark
--0-128068389-1260007451=:27923--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
