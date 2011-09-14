From: Petr Pisar <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] console_codes(4): Add ESC [ 3 J
Date: Wed, 14 Sep 2011 10:21:41 +0200
Message-ID: <20110914082141.GC2598@dhcp-0-146.brq.redhat.com>
References: <1303479685-12475-1-git-send-email-ppisar@redhat.com>
 <CAKgNAkjiMtfAyTD5=5gz_Q1rpG7hikg_1o_L+FQo7GsfiSyhKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjiMtfAyTD5=5gz_Q1rpG7hikg_1o_L+FQo7GsfiSyhKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 08:51:51AM +0200, Michael Kerrisk wrote:
>=20
> 2011/4/22 Petr P=C3=ADsa=C5=99 <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> > Linux is going
> > (http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dco=
mmit;h=3Df8df13e0a901fe55631fed66562369b4dba40f8b)
> > to implement \E[3J to allow scrambling content of console including
> > scroll-back buffer (http://thread.gmane.org/gmane.linux.kernel/1125792).
>=20
> In which kernel version was this patch applied?
>=20
3.0.

-- Petr

> > This is useful at terminal lock to disallow attacker to scroll visible
> > window back and to see sensitive data. Other \E[J sequences do not
> > blank history. Terminal reset (\Ec) or DECSRC are not suitable for
> > extension too beacuse they reset font, keyboard locks, unicode mode
> > etc. that are needed after unlocking session.
> >
> > \E[3J is superset of \E[2J. IOW it clears visible screen too.
> >
> > Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> > =C2=A0man4/console_codes.4 | =C2=A0 =C2=A02 ++
> > =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/man4/console_codes.4 b/man4/console_codes.4
> > index 2a806b7..62f2247 100644
> > --- a/man4/console_codes.4
> > +++ b/man4/console_codes.4
> > @@ -188,6 +188,8 @@ H =C2=A0 CUP =C2=A0 =C2=A0 Move cursor to the indic=
ated row, column (origin at 1,1).
> > =C2=A0J =C2=A0 =C2=A0 =C2=A0ED =C2=A0 =C2=A0 =C2=A0Erase display (defau=
lt: from cursor to end of display).
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 1 J: erase=
 from start to cursor.
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 2 J: erase=
 whole display.
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ESC [ 3 J: erase who=
le display including scroll-back
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer.
> > =C2=A0K =C2=A0 =C2=A0 =C2=A0EL =C2=A0 =C2=A0 =C2=A0Erase line (default:=
 from cursor to end of line).
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 1 K: erase=
 from start of line to cursor.
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 2 K: erase=
 whole line.
> > --
> > 1.7.4.4
> >
> >

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iF4EAREIAAYFAk5wZBUACgkQEsnFx2fG+qLJSQEAjWlCvkKS2W781I/hxTlKe6pn
2Ga6drzphPUOcSTEw3MA/3eV7g1Hbm7KvkG7ial8s/dRCgBLIjMtaJLDpffihMxC
=T/fu
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
