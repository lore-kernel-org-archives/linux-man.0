From: Andreas Jaeger <aj-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>
Subject: Re: math_error.7 draft 4, for review
Date: Fri, 25 Jul 2008 15:11:43 +0200
Message-ID: <m3y73qaz1s.fsf@gromit.moeb>
References: <cfd18e0f0807210323m4912a31pa5359c2b7409167c@mail.gmail.com>
	<cfd18e0f0807210325m7606441as19811b6802661a8c@mail.gmail.com>
	<m3zlo6b9b8.fsf@gromit.moeb>
	<cfd18e0f0807250236y476023fan90e97822e772859e@mail.gmail.com>
	<m37ibab7sr.fsf@gromit.moeb>
	<cfd18e0f0807250316k4bb6cbd1t8c6f20317f669c4a@mail.gmail.com>
	<m3y73q9ro3.fsf@gromit.moeb>
	<cfd18e0f0807250349jaa38928kaac968720c377322@mail.gmail.com>
	<m3myk6cel3.fsf@gromit.moeb>
	<cfd18e0f0807250556p40ae6cd3l8b6617fadabd6411@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0807250556p40ae6cd3l8b6617fadabd6411-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Fri, 25 Jul 2008 14:56:41 +0200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

"Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> [...]
> Yes.  My point is that there is no consistency across the math
> functions.  (And math_errhandling only tells about error reporting
> behavior across all functions, so it's presence or absence isn't
> really relevant to this inconsistency.)  Some set errno and give an
> exception, while some do one, but not the other.

My brain get's rusty, it's some time I looked at all of this.  So, let
me state what I remember thinking some more about this: I would expect
that the exceptions should be *all* correct.  Errno is a different
story,

Andreas
=2D-=20
 Andreas Jaeger, Director Platform/openSUSE, aj-l3A5Bk7waGM@public.gmane.org
  SUSE LINUX Products GmbH, GF: Markus Rex, HRB 16746 (AG N=FCrnberg)
   Maxfeldstr. 5, 90409 N=FCrnberg, Germany
    GPG fingerprint =3D 93A3 365E CE47 B889 DF7F  FED1 389A 563C C272 A126

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iD8DBQFIidEPOJpWPMJyoSYRAmmiAJsH54dtrBs0X9amv0Sxxpfb7XyHqQCfeGZ5
eCrxK2ZV1ZCll+LDNA6NDBA=
=bc+6
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
