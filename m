From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vsock.7: document VSOCK socket address family
Date: Fri, 1 Dec 2017 09:57:04 -0500
Message-ID: <20171201145702.saqodo5qqh4ucbaq@crack.deadbeast.net>
References: <20171130112153.13885-1-stefanha@redhat.com>
 <33989114-7BC7-455A-BE36-9EEC989DBDF1@vmware.com>
 <20171201130901.GA12803@stefanha-x1.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="37jfnr6zfuvwgkor"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171201130901.GA12803-lxVrvc10SDRcolVlb+j0YCZi+YwRKgec@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Jorgen S. Hansen" <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--37jfnr6zfuvwgkor
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2017-12-01T13:09:01+0000, Stefan Hajnoczi wrote:
> On Thu, Nov 30, 2017 at 01:21:26PM +0000, Jorgen S. Hansen wrote:
> > > On Nov 30, 2017, at 12:21 PM, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> w=
rote:
>=20
> Thanks for the quick review!
>=20
> I forgot to ask you: Is SOCK_DGRAM reliable and in-order over VMCI?
>=20
> > > +.PP
> > > +Valid socket types are
> > > +.B SOCK_STREAM
> > > +and
> > > +.B SOCK_DGRAM .
> >=20
> > The space here results in a space between SOCK_DGRAM and the =E2=80=9C.=
=E2=80=9D in the formatted text. Is that intentional?
>=20
> I haven't figured out the groff syntax to avoid the space :(.  Any
> ideas?

What you want is the .BR macro.

=2EBR SOCK_DGRAM .

The man macro package defines six "two-font" macros for switching
between roman, bold, and italic faces without intervening space.

See man(7) and groff_man(7).

--=20
Regards,
Branden

--37jfnr6zfuvwgkor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlohbbYACgkQ0Z6cfXEm
bc4orRAAoBpkmaxXOCQ9vOhwhfqtvMpR6T+yiOIMXn/xVR5X+REuIGWk6ipci3MX
VJ8DxCSWX1JTOAZ+AJ5tafAtvjfe6Sq6iqimtVpMT1+qt7jxaVGLra7BkDj5NLRL
hPpxDZdzuJ+XwxNVwkjFZnBE11q+k29jXrgatgNSkqpBHlAZjdbDa86yu4v9zIYA
opDWwbLLRuC1R/XlUiBmuokF8x0j/tGdjt7g1qbn65ER9ZbE6bNcMtSjJXbTi+er
9E3loqBu0KJjD33K0ZMx5Ydf5pkveOfRU2LFDUUABl7P8760cfFhvmDxtS7G7h9N
RdLXhIgxWipb83Ahh4+WNWahoqUwc2uArrslnxWINkMxI6oo7WMYBOu7fQxhpDrB
spWiD8p+Lwd+W8he/7i6yMWON3rSqFUorig1orrkkbXezsYuMipug35eNt8ysphP
7UO7A+ZAAKHBdIJmeQepbDHftTGxImO1OuFTwOpcHnwImzfZ0miCHQv/HknoZSQZ
cxL6rEtQo+vHeIKodJD32ouRf085jPch9fY1ks4VirmWZwsQzq8G0mvNo5LgCKgo
k61okIdzgfFr39fTgNHEyVDC8Jn1Dk2/J8UiqIIffUirDhvJwsXOG1VPdJj3cPPO
8UlXFoSWNPZKcSmq+IAXg3CawMQMkhMXP6w0zawDwoo6X+uX6P8=
=j7fQ
-----END PGP SIGNATURE-----

--37jfnr6zfuvwgkor--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
