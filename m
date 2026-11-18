Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963393;
	b=tD/ZfwZbjMycgLqJJsXQf+SUrwvfdDAslOKS7ntNy1q59GBJPpnf71rr8Owi77XngGPL
	 n9gTfTlqswgfk/NK0yOzVbVJF5OFI1Wk4drmFvRGkBdaNJCgf/KnpvlDv91FN02pSOA4N
	 E1BeVSZQh6XvecnHmAGTo5PFjCYvTPmgYQJJVfnqCukA5fRd0WhNdbwXUhr89hGLIlWQX
	 DELQGDJ30l7uE1J+9GIoiEE83vCQXJCB0RlJ5h4qjq05COOyAO0KKg+AjO8ok0A2S+fx7
	 YlAdgmZXRQUsBmzCipjc4qMry3+dwqo/9sJ7wDxIrzQWt9RCEEyL6TPAP/I8uiynexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963393;
	h=Received:DKIM-Signature:Resent-From:Resent-Date:Resent-Message-ID:
	 Resent-To:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hSFSV1o3BBVUgxVZgA8QFkYqkl2evwkFMjVFAFiJiWo=;
	b=uInYwqeUY1FQ9rqlfpLu4X/zaV/dfrMN1OZxNbvwtkSriVenDpTRGOq8DazFZMI78gpY
	 9RPGQ8hLapMge9DHNF0rnAIiAE5KNwcXKzElw6k3JMYr99n4/X4pxIhI1eFu/05/N0F9q
	 oCEZKtpf3E8rnBGieUOz/j97xBkCWVhawtekt2B5lc0uivT27I/y5duR/+Zh1vS6oYk3J
	 7tbWYRtSEjwnFvTOr4pc4TgBVbT3T8zjGwr9X7kjGLueKaXDUROTWxGuypF48yWK0l5rt
	 89zSQfW64NCAJ3G9TVockIq8vgXBtdIuC4qxS60ZCUmKwL4AfSbUq+1OTOzpiW1d6iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUKVS7Lg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927C606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HUKVS7Lg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0A01F000C4
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794963393;
	bh=hSFSV1o3BBVUgxVZgA8QFkYqkl2evwkFMjVFAFiJiWo=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:
	 References:In-Reply-To;
	b=HUKVS7Lg643E34/8sw9sP8hxbE+r+46I6qXD9sucF4nEWAG8YmfSz9X8+3PjZ3K8/
	 4bYmiNZABIxMAdCTZSXuW30hIaYcBE9G/FYaEbvqLOYMqEeREOJakTCurhbZYLK7Pt
	 WkZ8/9nKdA2OGNUuvDalppY29klJ+0WyGfleCwwHHugIwkuqIpo7MXiLIQPRjNTWef
	 Jb5LWs6uuulOxoXXiuPglckYLgfpjLxkZwCGjmVHdY8FG+t5OX03iZfp6ROn8xPouo
	 A18dMUBb49vGuEDCpLyR7RdkITjgDxsXec1kIS/reQDOweh49Ge4djnljI6AQKSj1G
	 PIvLQD7916dJA==
Resent-From: Alejandro Colomar <alx+linux-man@kernel.org>
Resent-Date: Wed, 18 Nov 2026 01:56:30 +0100
Resent-Message-ID: <avz3vpb4HLayaty8@devuan>
Resent-To: linux-man@vger.kernel.org
Date: Wed, 18 Nov 2026 01:30:21 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <codonell@redhat.com>
Cc: Patsy Griffin <patsy@redhat.com>, linux-man@vger.kernel.org, 
	fweimer@redhat.com, Carlos O'Donell <carlos@redhat.com>
Subject: Re: [PATCH] man/man7/credentials.7: Mention potential SELinux impact
 on credentials
Message-ID: <avzxg3GZmPo1k0Le@devuan>
References: <20261117161046.2037417-1-patsy@redhat.com>
 <1458827a-f1eb-41cb-8b42-d4a088fcb550@redhat.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xekqg4d7l64m3q4e"
Content-Disposition: inline
In-Reply-To: <1458827a-f1eb-41cb-8b42-d4a088fcb550@redhat.com>


--xekqg4d7l64m3q4e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <codonell@redhat.com>
Cc: Patsy Griffin <patsy@redhat.com>, linux-man@vg.kernel.org, 
	fweimer@redhat.com, Carlos O'Donell <carlos@redhat.com>
Subject: Re: [PATCH] man/man7/credentials.7: Mention potential SELinux impact
 on credentials
Message-ID: <avzxg3GZmPo1k0Le@devuan>
References: <20261117161046.2037417-1-patsy@redhat.com>
 <1458827a-f1eb-41cb-8b42-d4a088fcb550@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1458827a-f1eb-41cb-8b42-d4a088fcb550@redhat.com>

Hi Patsy, Carlos,

> Date: 2026-11-17 19:13:30-0500
> From: Carlos O'Donell <codonell@redhat.com>
>
> On 11/17/26 11:10 AM, Patsy Griffin wrote:
> > An SELinux context may impact traditional credential access control.
> >=20
> > Link: <https://bugzilla.redhat.com/show_bug.cgi?id=3D884625>
> > Cc: Florian Weimer <fweimer@redhat.com>
> > Cc: Carlos O'Donell <carlos@redhat.com>
> > Signed-off-by: Patsy Griffin <patsy@redhat.com>
>=20
> LGTM.
>=20
> Reviewed-by: Carlos O'Donell <carlos@redhat.com>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

>=20
> > ---
> >   man/man7/credentials.7 | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >=20
> > diff --git a/man/man7/credentials.7 b/man/man7/credentials.7
> > index b538b1702..21e42ec30 100644
> > --- a/man/man7/credentials.7
> > +++ b/man/man7/credentials.7
> > @@ -335,6 +335,12 @@ is carried through to all of the POSIX threads in =
a process.
> >   See
> >   .BR nptl (7)
> >   for further details.
> > +.P
> > +Credentials may also be impacted by Security-Enhanced Linux (SELinux),
>=20
> OK. Semantic newlines.
>=20
> > +if enabled.
> > +See
> > +.BR selinux (8)
> > +for further details.
>=20
> OK. Yes, they can have an impact, and selinux.8 is a starting point.
>=20
> >   .SH SEE ALSO
> >   .BR bash (1),
> >   .BR csh (1),
> > @@ -386,4 +392,5 @@ for further details.
> >   .BR system_data_types (7),
> >   .BR unix (7),
> >   .BR user_namespaces (7),
> > +.BR selinux (8),
>=20
> OK. Correctly sorted after 7 and then alpha.
>=20
> >   .BR sudo (8)
>=20

--=20
<https://www.alejandro-colomar.es>

--xekqg4d7l64m3q4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr88ZkACgkQ64mZXMKQ
wqnW8w/+NSCKug2Reaou6rALw5Vd3BeNkAQs/+9L9qu+ohr+FcFwxupLN9q+5mrV
jvstUAdACQGJ6Wxlu2GQCH94VZc/D8KibxqQ7fKn9c98Ri62DQfxdsjDyrHn56xY
nDtmGFyU3+8qtEUekUL6RrS5nV6j4dtz7+t5sRPSV52opkUKKgDKu9p9G4R/ztO9
vnvb8P+nyIfcqLSp5/dCx6ChoSqxC4Z821jhW+05kmDsv+AIXXJtc1wy1xTPGNSs
yjZdwv9gRzZLY8JNGcbsd9QWiBxqElaGC14G/+xO1I+LaqFlloQlwKIJ3BVneGWT
UIjcFh5Es8SmW42yX+bRBATezdTb+M51m7ZwJBypdKwDYhdenEe8/WUF9tWvKNBV
AJCs+K7dZpsioK41M5vNLu6A7mXQEevrt7L7+LrVMirFTEtCd/JRMfM+sjyzh2T7
04S3wu6vtznBVyLMTxgIM88kqJjGNYZQsnp4MysMemrW11H7uVZm6wohmtVzAIi1
oamlVMTsg5WShxp4wqM6IBvDQFwbYBtDuF/ii/bABftTxN2+EOFvrFmWkp4elOdw
nDaRRBzkqF9N6PvEeOHVXLIrmnKnEkgHJMaO4zetBw1ZcEmAJRee+e8Zzkfo7egI
uIWvZqEsHrkFOEp4MIQqi6CJlIcUbn9i28ak70Oewa6CmiSwVS0=
=fR2n
-----END PGP SIGNATURE-----

--xekqg4d7l64m3q4e--
