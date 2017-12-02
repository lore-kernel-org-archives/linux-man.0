From: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] vsock.7: document VSOCK socket address family
Date: Sat, 2 Dec 2017 17:57:09 +0000
Message-ID: <20171202175709.GA24349@stefanha-x1.localdomain>
References: <20171130112153.13885-1-stefanha@redhat.com>
 <33989114-7BC7-455A-BE36-9EEC989DBDF1@vmware.com>
 <20171201130901.GA12803@stefanha-x1.localdomain>
 <20171201145702.saqodo5qqh4ucbaq@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171201145702.saqodo5qqh4ucbaq-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Jorgen S. Hansen" <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2017 at 09:57:04AM -0500, G. Branden Robinson wrote:
> At 2017-12-01T13:09:01+0000, Stefan Hajnoczi wrote:
> > On Thu, Nov 30, 2017 at 01:21:26PM +0000, Jorgen S. Hansen wrote:
> > > > On Nov 30, 2017, at 12:21 PM, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>=
 wrote:
> >=20
> > Thanks for the quick review!
> >=20
> > I forgot to ask you: Is SOCK_DGRAM reliable and in-order over VMCI?
> >=20
> > > > +.PP
> > > > +Valid socket types are
> > > > +.B SOCK_STREAM
> > > > +and
> > > > +.B SOCK_DGRAM .
> > >=20
> > > The space here results in a space between SOCK_DGRAM and the =E2=80=
=9C.=E2=80=9D in the formatted text. Is that intentional?
> >=20
> > I haven't figured out the groff syntax to avoid the space :(.  Any
> > ideas?
>=20
> What you want is the .BR macro.
>=20
> .BR SOCK_DGRAM .
>=20
> The man macro package defines six "two-font" macros for switching
> between roman, bold, and italic faces without intervening space.
>=20
> See man(7) and groff_man(7).

Excellent, thank you!

Stefan

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaIul1AAoJEJykq7OBq3PIk1IIAI3aem5i+KNTYMdkXRJYGmbR
Kc3Zp0/K8AFW0AoHsgYK46zQL7E02/zthIWOn4CRGyg3YoGuA8VkraQpK02rFNK/
54qPSoddli3YmhshIzRLRtMxIU8ZQ68dtlWGnLBNXMOYh1F84wz/WD/6KldnRup+
9g59KcfEt9zp3JZ9OS0f0WsKPeIy1TtIHYiedpaYbN4nztlTfoPViy3gi1THhHZF
SzxOcZS3cLiA7xf3QvsGAxkw1WYcwMWobRlZgxJHfv5o/z6EP3cn1HJNaL3UNdN0
Fe8LhBtHN1eEwQcmciKqmXKuU/Flt3Ag0YJprHMEfr0Lv8rGivjBqF0hhImDsc0=
=GYrL
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
