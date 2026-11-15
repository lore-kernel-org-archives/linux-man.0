Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777490;
	b=cAspbgz6DjU56FLkU7sD767Xj3o8XnXjaLZGBboVp3Z01QhABx5MsKfOyW5xikSev1mH
	 Y2rebFALqLGb2q8nWxQFgtZOiigr9A1gI6WCJdDfHVOtPK0MZq8RQTYxY1RvXrfaQiu7B
	 I14ujw92CW6K/hwwI1nJbsRCTNNtFJfjJ+EpfuLbwtGDe864rRV6MPcKyDFY28PYbwWzC
	 umtRECsyBKIHSS9Q4qfb026HEvo4wPFBfhzmZFt5WZoh9GrDIPremuHsFE6nm0/653M+C
	 As5o+KY/uWmmrRU2PKiWbiyGVimBWTRN/2aKnD5XSZZN9/rlmSLU8brkpebTZV3OsMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777490;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=68tAU2FlBZFhTCADRl8XIau7jrAbvtGA8wkDjrXY1Qo=;
	b=cQ/HgM/Ou800IN0AX5fyz1x7sWagdblWyypqHQ2ywX8ry0izENTYAQAz65N9Nf5LpbBS
	 8i/NHb8wpfhZbBirn9AQYU5XZlQLDBZV8RXYNLpta/bUvS7WLMwafKWQm2CaIXy/aX6iD
	 TIRVLU75KavlbmiIEUL8MLgx0awN9+7t6ufnAoR/1Ke6hRqdeu4J09Rh/+ZL09efLcn1w
	 EQlbLI/CWMglEpA1mvhI+KRl16yLK/JW0mo2GdHOlB4gDAqM/E/fQrfEjM0tnpUDbZ+LD
	 Sj2C4Zw8Yz1ZYbz89nDDdF1CEfaZpBM/UJIiKncX98QKcRsusyvnGgQKQhE/HRK0IQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g8/GTSTd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5A606A31F
	for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g8/GTSTd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61CD1F000C4;
	Sun, 15 Nov 2026 21:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794777489;
	bh=68tAU2FlBZFhTCADRl8XIau7jrAbvtGA8wkDjrXY1Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g8/GTSTdbNbdB51A+wxYWZD5M6W10EWIt7B6aZbo+2bzqdUxOyhCQhf5R7wGYt8o8
	 Zui9VqZd6MOhnK3aElJ+ISJdPe3AFk3dutLKkWj8ilD/eDCe2UP9h9bcPl96dPBiWH
	 Mc1h0B6GJprPJwN5+C68RA02VG4Iz15It9+qHNucYbmGj7V7ADhFXbvY2tGU35IELk
	 e/B6jvkmT7SpKbDoNW/nKoQbDOpE31GCOpC3gwDAcT03uigkYQNq7T9jWPN/CWE7me
	 MxXJVRX/ia8bMRntRoc4tCYHiSbvUcbOr0xWFZu3geHr7dheZPeEAHezt79OayHVvl
	 0Rgg0MHFS1ing==
Date: Sun, 15 Nov 2026 22:18:06 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org, g.branden.robinson@gmail.com
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <avogyPekOEm-xBPV@devuan>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
 <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
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
	protocol="application/pgp-signature"; boundary="udpcejblpquxcvpe"
Content-Disposition: inline
In-Reply-To: <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>


--udpcejblpquxcvpe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Matthieu Buffet <matthieu@buffet.re>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org, g.branden.robinson@gmail.com
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <avogyPekOEm-xBPV@devuan>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
 <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
MIME-Version: 1.0
In-Reply-To: <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>

[CC +=3D Branden]

Hi Matthieu,

> Date: 2026-11-15 21:55:50+0100
> From: Matthieu Buffet <matthieu@buffet.re>
>
> Hi G=C3=BCnther, Alejandro,
>=20
> On 11/6/26 11:02 PM, G=C3=BCnther Noack wrote:
> > On Tue, Nov 03, 2026 at 12:39:32AM +0100, Matthieu Buffet wrote:
> >>   A Landlock rule with port 0
> >>   and the
> >>   .B LANDLOCK_ACCESS_NET_BIND_TCP
> >> -right means that requesting to bind on port 0 is allowed
> >> -and it will automatically translate to binding on the related port
> range.
> >> +or
> >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> >> +right means that requesting to bind on port 0
> >> +(explicitly, or implicitly
> >> +for instance by sending a datagram on an unbound UDP socket)
> >> +is allowed
> >> +and it will automatically translate to binding on a kernel-assigned
> ephemeral port.
> >
> > With the caveat of not being a native speaker either, the commas in
> > this sentence feel wrong to me.
>=20
> I was trying to make the comma match the fact that the example only appli=
es
> to the implicit case, but if it sounds wrong let's use your suggestion.

Perhaps you could use two levels of separation, with ';':

	(explicitly;
	or implicitly,
	for instance, by sending a datagram ...)

But this is a bit beyond my expertise.  I've CCd Branden, which will
surely be able to help.


Have a lovely night!
Alex

>=20
> >> +To allow this if
> >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> >> +is handled
> >> +(even if
> >> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> >> +is not),
> >
> > This phrasing is different to the kernel documentation, where it says:
> >
> >     To allow this if both LANDLOCK_ACCESS_NET_BIND_UDP and
> >     LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP are handled, [...]
> >
> >     (see https://docs.kernel.org/userspace-api/landlock.html)
> >
> > Is this intentional?
>=20
> Absolutely, it's bullet point #1 (the most important imho) in the three
> divergences I listed in the patch description. My current text in the ker=
nel
> docs is not technically wrong, but it does not highlight the most
> non-trivial case (connect+send not handled, but bind handled, causing
> connect+send denials).
>=20
> >> +Note on
> >> +.BR AF_UNSPEC :
> >> +Calling
> >> +.BR connect (2)
> >> +on a TCP or UDP socket
> >> +with an address of the
> >> +.B AF_UNSPEC
> >> +family
> >> +can only dissolve existing associations,
> >> +and as such is always allowed.
> >> +On IPv6 UDP sockets, if
> >> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
> >> +is handled,
> >> +sending datagrams to
> >> +.B AF_UNSPEC
> >> +addresses is not supported
> >> +and will always result in a denial,
> >> +as if the policy rejected it:
> >> +use a
> >> +.I NULL
> >> +address instead to get the same semantics
> >> +inside and outside a Landlock domain.
> >> +Other uses of the
> >> +.B AF_UNSPEC
> >> +family have unchanged semantics.
> >
> > This second "note" discussion seems to deviate in its meaning from
> > what the second "note" box said in the kernel documentation.
> >
> > https://docs.kernel.org/userspace-api/landlock.html#network-flags
> >
> > Is this intentional?
>=20
> Yes that's bullet point #2, a better description ("always result in a
> denial, as if the policy rejected it" instead of just "not supported") of
> this deviation from normal network stack behavior.
>=20
> > I admittedly have trouble following the documentation in this
> > rewritten note (and also the kernel documentation).  What does
> > "sending datagrams to AF_UNSPEC" mean in the context of IPv6?
>=20
> You are correct about connect(AF_UNSPEC) semantics, and here I meant
> sendto()/sendmsg()/etc. on an IPv6 UDP socket with a msg_name whose family
> is AF_UNSPEC (which is interpreted as "no address" by the network stack).=
 I
> changed this to a hopefully more explicit wording in v3.
>=20
> > Is the new man page phrasing one that you'd also like to carry over
> > into the kernel documentation?
>=20
> Absolutely, tell me what you think about v3, and once we agree on the
> changes I will send a patch to sync them into the docs.
>=20
> Have a nice day!
>=20
> Matthieu

--=20
<https://www.alejandro-colomar.es>

--udpcejblpquxcvpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr6IYcACgkQ64mZXMKQ
wqm3yBAAvaZ6pMDbhLtlEfUU5aFo4qeCIm13R3HH+l0RCn0zl6YdcQr2QOqXbom8
PbHynVSo+ROMKI6gX10/onC1JF4CwuOoRYw1uhRdaioFNtSBu0Csbi3fG5fG3DO5
uNzTAZr/xG9Eqn04/s/LGIuzB11LADNuCHmcClm694D3ezIz9KwmuYeKGN43MKZ3
rr9EVTO5pH1TjEeoX0LOoaeAUY/0J2taAXtK0UKnyuSQQiH/44BTvkAFRUr1pA0Y
Eq+FXCiaAzFXl5BmPsbrWIfWrHPeNWeLy+LviWOf/iYSRQuXEAgfxUcyXkr9zJwX
Gfy8GXMeNp+cYnaZr+MjaCodn2Kv/YBTMl4K3PNx9iWVuV3pXR1C0K4WUEC68HLk
COBST30FkN6Ic8owseRRDSJp4yNDEXJc2G+MB2lXU/roxvzPrIZcMKzQ2E4ts1ER
MKjoxEK31+xjHljeftBVNFcfNSXtPcJIjIJV63242OZqiYTmDpWdkAS/VK2cONrz
HS3+hTluoua+iRy6flUjSfpWyN8swv+wQ5Fo0ZjZz6XjkS+0btBN8Fa1HWdWu/EM
6Ax5Tz/cXV7hutQ2yp5oHtH15NF7nXzsITYFScK31pgwwtC3LWdARj8vguG2rkCX
ARaxMlzpsv0etan9968J6+qEe4F1mY4PXzPhEQK/h3/ItSmNquk=
=74hJ
-----END PGP SIGNATURE-----

--udpcejblpquxcvpe--
