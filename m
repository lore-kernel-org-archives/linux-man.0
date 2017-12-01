From: Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] vsock.7: document VSOCK socket address family
Date: Fri, 1 Dec 2017 13:09:01 +0000
Message-ID: <20171201130901.GA12803@stefanha-x1.localdomain>
References: <20171130112153.13885-1-stefanha@redhat.com>
 <33989114-7BC7-455A-BE36-9EEC989DBDF1@vmware.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <33989114-7BC7-455A-BE36-9EEC989DBDF1-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jorgen S. Hansen" <jhansen-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dexuan Cui <decui-0li6OtcxBFHby3iVrkZq2A@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 01:21:26PM +0000, Jorgen S. Hansen wrote:
> > On Nov 30, 2017, at 12:21 PM, Stefan Hajnoczi <stefanha-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wro=
te:

Thanks for the quick review!

I forgot to ask you: Is SOCK_DGRAM reliable and in-order over VMCI?

> > +.PP
> > +Valid socket types are
> > +.B SOCK_STREAM
> > +and
> > +.B SOCK_DGRAM .
>=20
> The space here results in a space between SOCK_DGRAM and the =E2=80=9C.=
=E2=80=9D in the formatted text. Is that intentional?

I haven't figured out the groff syntax to avoid the space :(.  Any
ideas?

> > +.PP
> > +There are several special addresses:
> > +.B VMADDR_CID_ANY
> > +(-1U)
> > +means any address for binding;
> > +.B VMADDR_CID_HYPERVISOR
>=20
> We use VMADDR_CID_HYPERVISOR for communicating with services in the hyper=
visor, so you could describe this as =E2=80=9Can address reserved for servi=
ces built into the hypervisor=E2=80=9D.

Will fix.

> > +.SH VERSIONS
> > +Support for VMware has been available since Linux 3.9.  KVM (virtio) is
>=20
> VMware (VMCI) for clarity.

Will fix.

> Apart from the nits, this looks great.

Please let me know if there are any other topics that we should cover in
the man page.

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJaIVRtAAoJEJykq7OBq3PIzycIAMXsJvs4hL0pp6dZoEKFhQLn
Z0O++aBm+cAISPs8jD6t4FgDiOcVn2yqXTfVUUIzt5xHx5JLvvgmbcIdLahO+Lz1
B7T7LtUXvUmdWedmFRGsBB9NaXbeQjGIYC4V8S0AqeGhbf/QkqNGSoJKFI7z12WM
k09xfqz9Xjr6ucnxIdmSgW+UQwhittOar1C5KgJ+1pkKMfektmusVUJtx5QLnvC5
unPTYcPGoPhkNmSyK8Nl36Ki10vELxIo11mK/7gmluibiJ5NX3lvUpIdbZWKEPM/
cNO/EWdRZvvWtj3VyKazuUM3tn/JnlqwKz7J1tFyZUp/m9WZnCWlC7vN5Kq4ThQ=
=/C2G
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
