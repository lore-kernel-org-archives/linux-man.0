From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Mon, 19 Mar 2012 20:50:47 -0400
Message-ID: <201203192050.48882.vapier@gentoo.org>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org> <CAKgNAkjhzh+zZ+GhOcbKsZpkeAgn6ua5K=zS=0_AUsUQ3GsQ_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1555212.QuzUi2U8Zb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjhzh+zZ+GhOcbKsZpkeAgn6ua5K=zS=0_AUsUQ3GsQ_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1555212.QuzUi2U8Zb
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 19 March 2012 16:45:41 Michael Kerrisk (man-pages) wrote:
> A quick question about one piece:
> > +The count values might be individually capped according to
> > \fIUIO_MAXIOV\fP. +If the Linux kernel is capped at smaller values, the
> > C library will take care +of emulating the limit it exposes (if it is
> > bigger) so the user only needs to +care about that (what the C library
> > defines).
>=20
> I don't see anything in glibc that does this. Have I missed something?

i think you're correct.  the code in glibc atm is merely a syscall().  i th=
ink=20
the idea was to have the C library guarantee that and if moving forward the=
=20
kernel changes, the C library would update by adding a wrapper.  maybe just=
=20
drop this sentence until that day comes ?
=2Dmike

--nextPart1555212.QuzUi2U8Zb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJPZ9RoAAoJEEFjO5/oN/WBSS4P/R2OltAPlCBcnlXUJjzDv5xq
ZQottsquDb2lhKJmzROXFC16b/bvGOZzvJxEmhNUF5uWUphp9bqnaNCPad+g6qh/
jp9gq7cZB+UUujly37/4MOTwx/4gYhCHFodTDhFthUZyqRB1LJp7E9W1u74T0Yrp
fgn+Mq/6OiqZe7enImuh3fJz0DAHL3nv+6RFQeQNiXuCi0cuywMbTOfx4X3vuqBK
B9rtGWFaPNV1jRl9VIuo0u/jThzF3QCwlE1KeM3fwKfV+iR9z/Af6o5zYNLweNkz
7oRb/UQFrO7KOLZtNHbk7Ij9IBTXYRGdv+ZMY0SwF/LU1dyFhpCTOBhLjiXeurWB
tq4MyKbTX/Eq3oMfj4yyZ9WmwnRBWVV/iDeqX9MztZgaO7H8wSR57MACcympgnkQ
sNDXjBdPdDczHBZB8Z23iJD3jJ2MRamvBAM8r+nCZ93TT+R3sSl/5MeGwh1t7NFM
yuSVDK3ijZ8RHrhvNrMMHGR341pwG8ZSgtTJHFbGFgNnh9h7L81pD2ajUJjvr+7R
0ZEk7CAUkVLm55bREP0tgi8ksBVcnBpKBDZUMyzo7xKeYO/CE+Akn7Dtwx80/cYT
NJHHo29QqVbiVKisPQhKxd+ykpS0JYt/QTHf+IDRlsdV2uHIhS5oWqPeBP1QFv7r
RkZAMSBuXk8Ji5wUt1FG
=GNFF
-----END PGP SIGNATURE-----

--nextPart1555212.QuzUi2U8Zb--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
