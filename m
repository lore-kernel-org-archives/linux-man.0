From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] proc(5): maps: document the "pathname" field
Date: Sun, 17 Mar 2013 11:18:05 -0400
Message-ID: <201303171118.06195.vapier@gentoo.org>
References: <1363384034-11106-1-git-send-email-vapier@gentoo.org> <CAKgNAkhr2msKaPOJVZq2Pe2vaWGQQTSmQTLdPQ5wRVTcbYVxkw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart56826860.zKJdGP14pO";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhr2msKaPOJVZq2Pe2vaWGQQTSmQTLdPQ5wRVTcbYVxkw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart56826860.zKJdGP14pO
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sunday 17 March 2013 04:57:48 Michael Kerrisk (man-pages) wrote:
> On Fri, Mar 15, 2013 at 10:47 PM, Mike Frysinger wrote:
> > +[stack:#] =3D A thread's stack (where the # is the thread's TID)
> > +[vdso]    =3D The virtual dynamically linked shared object
> > +[heap]    =3D The process's heap (no joke!)
>=20
> Why "no joke"? I don't get it.

because it's obvious that is the meaning behind it

> > +function.  There is no easy way to coordinate this back to a process's
> > +source short of running it through gdb/strace/etc...  Sorry!
>=20
> I removed "Sorry!" -- it's kind or redundant.

np ... the idea was to commiserate
=2Dmike

--nextPart56826860.zKJdGP14pO
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRRd6uAAoJEEFjO5/oN/WBapMP/2kJJXsTkP/6XA5ryWD4+LNY
rHq6Ym/bNq6EK97xJ92F33HCBO8eSg1/4sk1gbIZolo1kpD6Xsb4RSzZUvMiWGig
zuxsKkLCVl0ARIaQNkw4QIZnYqwkNOU0L8vr6dn4ZF9BNZN8hBEHMrfU1Xj9j1x2
W+I+maMz7HtHEqc+aYwn0EjEV5PbtuaUs+uviA7OJvjBfUOLOEMjVsDorkwWO4yQ
IVyhwLrMOOUA1JHxellNX06cr59P6O8fuRRHMCDu5ePuP2gw0N0tzciunfnapN8A
T8vIP6AhkQKZyVjmesqPPIPNW0t9oKKCAWxMlnsQ7Bd2JMZWUL0aWsiCTEFrP2eo
k+aanrRenhUSGyAbB2nYsTgMSg/KasXA6ZFMlx3giSiMR1AiPfnDW0QI2f8uBtnf
b/3bPr2iWSDFhbIwomwo79+G0tDIaqVq7OJ53sZZjJIwjs0KVJVTEIfTLIKVkcSo
WEmb26XVSLcgNlAjnbXZcHsyMmrajaGWQlsMrHMyhuSiM9Xk8ZUN/JyxTqVpcv4B
uEKJ8uIPNE9T1n51oQgAw71CXpP9sAbUgGy7a+cHGDcjYL6wubPD4w6sSa9VMQOQ
Gxnq7g6QYgEZtSflwYLXX+lGQpS4YYjZPjsIDi2+jRHHZ8kl1cEUZO4xOJENfXw3
u4Ia3nIxI94Gw5L8A7w1
=A7CD
-----END PGP SIGNATURE-----

--nextPart56826860.zKJdGP14pO--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
