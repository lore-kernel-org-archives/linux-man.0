From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] getline(3) was added to POSIX 2008
Date: Fri, 6 Nov 2009 15:41:30 -0400
Message-ID: <200911061441.31540.vapier@gentoo.org>
References: <1257370830-12899-1-git-send-email-vapier@gentoo.org> <87fx8t89aa.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart5272498.ucgagAVkVU";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fx8t89aa.fsf-3rXA9MLqAseW/qJFnhkgxti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: Michael Kerrisk <public-mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>, public-linux-man-u79uwXL29TY76Z2rM5mHXA-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: linux-man@vger.kernel.org




--nextPart5272498.ucgagAVkVU
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday 05 November 2009 07:07:25 Andi Kleen wrote:
> Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> writes:
> > Signed-off-by: Mike Frysinger
> > <vapier-aBrp7R+bbdUdnm+yROfE0A-XMD5yJDbdMReXY1tMh2IBg@public.gmane.org> ---
> >  man3/getline.3 |    4 +---
> >  1 files changed, 1 insertions(+), 3 deletions(-)
> >
> > diff --git a/man3/getline.3 b/man3/getline.3
> > index 2687809..622b5c8 100644
> > --- a/man3/getline.3
> > +++ b/man3/getline.3
> > @@ -26,7 +26,6 @@
> >  getline, getdelim \- delimited string input
> >  .SH SYNOPSIS
> >  .nf
> > -.B #define _GNU_SOURCE
> >  .B #include <stdio.h>
>=20
> Dropping the symbol wouldn't work on any older libc.

the description section needs a feature_test_macros section added to it
=2Dmike

--nextPart5272498.ucgagAVkVU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.13 (GNU/Linux)

iQIcBAABAgAGBQJK9HvrAAoJEEFjO5/oN/WB0b8P/RaBM4ZkBqk32iS4HdlJhT2+
Ek56kOOaC198HCUiKeJLJw4yS57PKT/YSecMvaf/uacK3TGLBIY9k73IuyAtY5NI
5fwaaT2tLKVFiJn/sEYh4+X+kNkaboreV4amz6qcKakQZ6U7U23UneYN/m0QEFU9
63wCqvE2KtCqMzJrmIwihIZgXUdAfKZN51Y+Bm1YFHt+I5kJH/n2hbOz5+IfkRyN
C8KdMAZw6YwFWoyjgSFf61Ys26nS5JZt4t/sWTHHOaL3FVT6Ac1t1FmYgOyMdl8H
D09N+yKY/t3FoOuWTDuNr7ojrVgLL3SxAjCKq5w7m85eN12D8i/euwwzQd05/Jmq
GjmYeRWVWxYUhZljkEjUfpqpO0waXXYy4HhukA2rr6gM+EPaIX9rMAtcbfPAOziQ
w7/1t5STm5afEA9TYcEbXh3Ch57CO+PqHvwyA/SbQMMr9+C50vGhUD/nZbL5Q6Qj
kuUWako+S1A6ZwbvX5yjK/4PBd7/UFf5ivLdURPNWT7kF/CoVWHezPF17EH8GfLM
FMTD6z0cScHjDvM/oj+BjsjEzG0mhaa9gM0x/BCdE2aAbdzntfE5tXH2sxGsLgkL
MtKA+bhzmfkfeUAU5ouLrMpxAu3EkKn+tSRhBtT/zOUzoW8W1nhvgrbUOKkeFhmT
Oe8uZOl794vbDJzXG2Pc
=u2QI
-----END PGP SIGNATURE-----

--nextPart5272498.ucgagAVkVU--


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
