From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/7] Improve support for compressed man pages
Date: Mon, 18 Apr 2016 10:49:18 -0400
Message-ID: <20160418144918.GK5369@vapier.lan>
References: <20160416022503.1df762cb.alex.miller@gmx.de>
 <20160416045058.GS6588@vapier.lan>
 <20160416183013.352f4ba6.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xssso5lpTBgMxDfe"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160416183013.352f4ba6.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org


--Xssso5lpTBgMxDfe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16 Apr 2016 18:30, Alexander Miller wrote:
> On Sat, 16 Apr 2016 00:50:58 -0400
> Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> >  if no one
> > is using this code, then it's just sucking up space.
>=20
> I'm not concerned about the space, but code needs to be maintained.
> IMO, as long as it works, we can keep it; if it has issues we'd
> better remove it.

sorry for the ambigious term ... i'm not referring to disk space, but
to the code "sucking up space in the Makefiles and our eyes".

> We can drop compression support or do it right - I'm fine with
> either option. We shouldn't keep the status quo, though.

i'm not advocating for the status quo ;)
-mike

--Xssso5lpTBgMxDfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXFPPuAAoJEEFjO5/oN/WBaQYQAMQOikrai0UKKRo0g9Oa4j3J
1JTmVm+Q7w8aW2AMluUvzQHQYsomViCYnbSs2OvYvpvQnRrJfZL56fs3C7xWBw5v
x2VuY5adHmjz6AOynQvxQFCbOes6dOg8i6UBBotq2EAGQTHtSUC3geGmKoUZrIEs
qr+jSHvTRpGoS7Z1lchSSDxgAabZiJmQaJt1uK5+LNHHE1KRzV4ZnHVhFei33Tk+
ipee7nKbY3fuHLTnhQrCH1lFRlxfeAeyeTrSARoQTB1T3P5asDbJU2uGLrtxExfb
CQ9OUAdXWwQWaO82YbBDeBSkCS4uGRW6xuFWw30JAxkjBsZmkMfIhJlDVhPPC9zG
/eSgjJ9dqs2nReu2/V1hJ6W/7YBuzi2Ep8M5rfg41niWpoqudFKn1D6YQMf8rpQd
W+GNivYsC4gH0xo581S5oIJl5+1j+FpLux0ggq+e6fX2GSlo5AiYx+P4O9enmfUF
cVxjsXXRvTWZNwrKEPEN066h8d2FomBjwFdnUFeeLFkzKygqQIzLZ62FBbEWrWHQ
DS1mdr54Om4yJBa5usmJ66sgXercOT76Sxnzr0S73N0wGXH6zl7c5yOkKqtc8Hds
JTKHzNWoEa0Sg3ThOi3bxrCSYe4a/YaF7icHv1rjT52BRrm1B/xXe4cURu4lbiAa
rBChuqywPoy4HRA38Jn7
=iRkO
-----END PGP SIGNATURE-----

--Xssso5lpTBgMxDfe--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
