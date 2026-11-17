Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908852;
	b=jOehVBK8LiU/xB96eSr+Vw34IMd3QrPgsL0tAHdmvZZsqaTizOolMRkYmRbYQFE5yLIf
	 X3ylpggeqPNoGBUQUjfKo3bLobQOzhs5rfHrkdWt9TqrdjWjRfN5VxONhNi/+wTcdOwLs
	 fGIOaNwNq5ev25ez8J9wSt/cuvhg5p5m73DY39QGH8ziIsSbsIF0OvyaBzcFNOJBYJw8z
	 +vYX8X1cmKIlvN441K2jBj6uIDqk8pbLOFLZbIrRPnkkRhVE66ZqoV3T39IyuP3UGDSn7
	 CjiofSsk8jxzBioKv3Ijw/PvSdYrz6V+xZiIm6fSo4W5lzdx7kj/KxvxthdZCNRrOVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908852;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VCEo6u6IE2xkVY7dvRUVotw2Jy4zToqlp5X6HR3nAl8=;
	b=MAXBKQoSfuEVLBjRFhI/fMS5mBpW2xlVC4XWff01fxu3o+5W+3cJ/Zv6kB/Z/3+UWXfS
	 eCJt/eeZ2fnLzANgT2XU70cipTpC+5Pz0qV0rXIwaE2VMQPsB1FVMSRZQDuCm3nHVVVxo
	 yiCGYLScmaKbUiFVWtUrJOUsna9JMutw23c07IZb22AUQdEOWlS4yfSMTeOl4xhumqqZI
	 jVL5G2gH77SExC5G58G3n84U4HVCTy1vSc3LDuO2Mfrj7+x5HuQFakRRk9h4MLg9UGGeK
	 8eYSBXGHhH75fiusgEv5XXCSajfJmShKrLj0h0tM2J5yTnpDjypQtEOPpuorPYSRzxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJlsId23;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C70606A31C
	for <linux-man@vger.kernel.org>; Tue, 17 Nov 2026 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJlsId23
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CB41F000C5;
	Tue, 17 Nov 2026 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794908852;
	bh=VCEo6u6IE2xkVY7dvRUVotw2Jy4zToqlp5X6HR3nAl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJlsId23xE18u2kQeKDb5J5wPw+84HbqMGg2RpC300Oo1HQnocEQjo1jb60aXb84z
	 DKDrs8rLhhUbsFgXz6Rpru+qI8RFLYzNhalcGAmbBDmGWuShU9W5qnnFziqwKx77QO
	 3oWqtEdox2eoI701rjL6Wy2DNcEsNod3vQiAuvZ5T6Jo0V3dMBe715UttVp3+17src
	 +yKg2xauAOOIaOxFXP0rJv5Ze72z+q/RhNxLOk+92CbAKfjY6LAklxpaNM2EX9icAW
	 JVoExUT6JHmCAB80ct3MHW1ZsrThCraF4+fKgA4olOEyjxr0xrTb5Hme5Hty1ec+kA
	 ey37V2cM2FotQ==
Date: Tue, 17 Nov 2026 10:47:28 +0100
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <avwiSt7sMInH0_d-@devuan>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
 <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
 <avogyPekOEm-xBPV@devuan>
 <20261115215359.tcfw7u3apvbqxde5@illithid>
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
	protocol="application/pgp-signature"; boundary="jatvloovxso4n7p7"
Content-Disposition: inline
In-Reply-To: <20261115215359.tcfw7u3apvbqxde5@illithid>


--jatvloovxso4n7p7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Message-ID: <avwiSt7sMInH0_d-@devuan>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org>
 <au8HcBs37d1yUkZ0@debian>
 <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
 <avogyPekOEm-xBPV@devuan>
 <20261115215359.tcfw7u3apvbqxde5@illithid>
MIME-Version: 1.0
In-Reply-To: <20261115215359.tcfw7u3apvbqxde5@illithid>

Hi Branden,

> Date: 2026-11-15 15:53:59-0600
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-11-15T22:18:06+0100, Alejandro Colomar wrote:
> > > Date: 2026-11-15 21:55:50+0100
> > > From: Matthieu Buffet <matthieu@buffet.re>
> > > On 11/6/26 11:02 PM, G=C3=BCnther Noack wrote:
> > > > On Tue, Nov 03, 2026 at 12:39:32AM +0100, Matthieu Buffet wrote:
> > > >>   A Landlock rule with port 0
> > > >>   and the
> > > >>   .B LANDLOCK_ACCESS_NET_BIND_TCP
> > > >> -right means that requesting to bind on port 0 is allowed
> > > >> -and it will automatically translate to binding on the related port
> > > range.
> > > >> +or
> > > >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
> > > >> +right means that requesting to bind on port 0
> > > >> +(explicitly, or implicitly
> > > >> +for instance by sending a datagram on an unbound UDP socket)
> > > >> +is allowed
> > > >> +and it will automatically translate to binding on a kernel-assign=
ed
> > > ephemeral port.
> > > >
> > > > With the caveat of not being a native speaker either, the commas in
> > > > this sentence feel wrong to me.
> > >=20
> > > I was trying to make the comma match the fact that the example only a=
pplies
> > > to the implicit case, but if it sounds wrong let's use your suggestio=
n.
> >=20
> > Perhaps you could use two levels of separation, with ';':
> >=20
> > 	(explicitly;
> > 	or implicitly,
> > 	for instance, by sending a datagram ...)
> >=20
> > But this is a bit beyond my expertise.  I've CCd Branden, which will
> > surely be able to help.
>=20
> Well, maybe.
>=20
> I don't know of hard rules governing this sort of construction, but use
> of a semicolon here "feels" wrong, as you're not joining independent
> clauses nor are you separating list items, at least some of which
> contain commas.
>=20
> I might use an em dash here.  But, trying to interpret this language for
> myself, I think the best solution might be to recast to break up this
> long sentence into shorter ones.
>=20
> Thus:
>=20
> A Landlock rule with port 0
> and the
> .B LANDLOCK_ACCESS_NET_BIND_TCP
> or
> .B LANDLOCK_ACCESS_NET_BIND_UDP
> right means that a port 0 binding request is allowed,
> automatically translating
> to a binding on a kernel-assigned ephemeral port.
> Such binding can be done explicitly or implicitly.
> Sending a datagram on an unbound UDP socket is one implicit means.

Thanks!  That sounds good.  Perhaps we could put the last sentence in
parentheses, as it's not part of the specification.

	A Landlock rule with port 0
	and the
	.B LANDLOCK_ACCESS_NET_BIND_TCP
	or
	.B LANDLOCK_ACCESS_NET_BIND_UDP
	right means that a port 0 binding request is allowed,
	automatically translating
	to a binding on a kernel-assigned ephemeral port.
	Such binding can be done explicitly or implicitly
	(sending a datagram on an unbound UDP socket is one implicit means).

Have a lovely day!
Alex

>=20
> I also recast the text to tighten wording, to reduce use of passive
> voice, and to favor present tense over future.
>=20
> Does this help?
>=20
> Regards,
> Branden



--=20
<https://www.alejandro-colomar.es>

--jatvloovxso4n7p7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr8IqUACgkQ64mZXMKQ
wqmJTw//W4MzC2AxxQ6Fb9uWb0WWqUs+9DsHoeacxs/gDdJQ7ZY843ckP6HReLxg
XLFOn2yhvKGv0iqcNij0k8trlWEj9Tnxe5ivNHGOlvUeiKkieDAkVPr5CsxukzbY
QYLGx218mdtbn1plZ4Dmx+so18n+bYUUpxsBvTt4zYIALW0GjPWkaB6xQPdK+wCm
UKnwzssen0PxZSR6B95OegouecCbc/DWQYzIY3VTnXocXva2Xey7RyQFcuTorqJR
vWmgzK1CsPUD7TXQkcek97lxsMWxe020WSFKEZF4wai3RyoB9jQhot1DKpGIKOza
7UlKOI1/lZdFyV/OhwWTYnPTYtvNfcHN3dLKa/80IFhrLWOEnyqiuz8yaQDlCzON
OkxB/UcOlbRYlusv5/io8eOg46TkPYOCcyU9AS/Nv34lPiJAQFGJhIokEEGGh+PH
knoWz9W2tmNlFoVH3Wlezr5wUzpAZ55ENfVJClTpFx2uyfaFjgbZYrM+K9bwuaN6
0u4bZBuddDwvtZUbT+lH5C0JaG36H3Xv5ipYZ6PT5MeFPwaWzvvaX7N4z684/5VX
4ZkLRNhNViyPMJnTaA/NXDCqBla6mdKKieKh6JpbkyBF0PcQZicEyOpmyeD8yGch
Pm5QcLAFkZkdxtHgYZ26ngEx82rZXpSN4Q9jj4fUSY0F2niJAfY=
=a1hm
-----END PGP SIGNATURE-----

--jatvloovxso4n7p7--
