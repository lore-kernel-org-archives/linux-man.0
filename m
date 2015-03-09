From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: Handling of updates to kernel Documentation/ tree
Date: Mon, 9 Mar 2015 13:40:57 -0400
Message-ID: <20150309174057.GC12857@vapier>
References: <3421611.4D45Q2BAys@tauon>
 <20150309150739.GA6131@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j9XQ5cF5hebrmXqw"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150309150739.GA6131-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>, Michael Kerrisk <michael.kerrisk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--j9XQ5cF5hebrmXqw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09 Mar 2015 08:07, Christoph Hellwig wrote:
> On Mon, Mar 09, 2015 at 03:17:58PM +0100, Stephan Mueller wrote:
> > how shall an update to the Documentation/ tree be handled in man pages=
=20
> > that contain a pointer to these documents?
> >=20
> > Specifically, socket(2) contains a reference to=20
> > Documentation/crypto/crypto-API-userspace.txt. With the patch [1] the=
=20
> > document is gone and its contents is moved into a DocBook.
> >=20
> > Shall the kernel DocBook website [2] be referenced? If so, when is it=
=20
> > appropriate to add the patch (note, the change is expected to be=20
> > propagated to Linus' tree in 4.1-rc1).
>=20
> Referencing a kernel Documentation file from a man page sounds like
> a bad idea to me.  Why can't we include a nroff-yfied version of the
> content in the man-pages repository?

isn't that way worse ?  now we have to keep the man pages git repo in sync =
with=20
the kernel Documentation/ subtree.

i think having the man pages refer to the public docbook kernel.org pages s=
hould=20
be fine.
-mike

--j9XQ5cF5hebrmXqw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU/dspAAoJEEFjO5/oN/WBfCsQAIHvCHhNgQjofYkqR/N2IspP
pT4MwZAsQUe2wmnN9BZeEHOjyHp2kXA8badKOHotDiAKPiIdX72nV0ooSgY5aoAW
h6SChPaJAZe7lL1QlXkjVcgJD+Grai8fP9I4Rah61hRTeMYN+1yzGQHjIw7NcJD4
UoTzlPbPoyFzMEhp56DlRJcv05wvI61RnE95OWbSjPhKsY5vks6U6s6Er3ycFIKt
wLuBPAk6fYn4f3FRUTfgYgGLCPP9tHYjVRXEKqeudzIJRQbYVw+z2NdVRYGbLNOg
E+E2uIvlSNQBycHqUKltymtaixdUj8GHtIBbVEG5lDtjpJ92PZnjxnvgaipa7/FD
o0kywxxzzk6Kf63sF8+IgkCMQAfx5zsRJUBjDiDRupRW3ptuNbFP6u3qXGzHLEOg
C49gC6mfvj0t2U2oyupWNjbFiTQDnpZgEvGoNRNSZolIf/JNPK6wFsqQ6sFgXFxP
pUkCk+EVea+EWIChiYg8eY4V31y/eW6nUNSXEp0ZtaY0XEMxAjsdsY8O5nSBVrBH
2mkRDPKkZXvavxtLwlgii2b8QMeydxyYePiQthvTmv5YB3K2P0vH/sFoQpaQKkoS
fMGR0LRtVh7t1F0txFSdjV0I9w3Wxd5aMmU3ngViPQ1vIZz/1jvfOw/rtRsNSufw
0M7pKVaSfc7QRKjJ865X
=u6+D
-----END PGP SIGNATURE-----

--j9XQ5cF5hebrmXqw--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
