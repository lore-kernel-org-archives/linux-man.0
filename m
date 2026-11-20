Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134889;
	b=Grb+CfLhKCg/ONDtRRqi2yY7o88ke5FjfSeA01KGtOXZHuae+V8auAsnhxCIVgIACS9X
	 EvarhHzlhPf35vBSi9/h9GlUTijeyeUZA5n7hsMHq0xZt/wE6HUF3fv2IwFQDSqdI/Vnc
	 PKJES38/iDGC1cywDWlMb15chE8v/rgxOI6XNZo9eVVfcy5xWksIVy8QaI9K0wTYlh/lM
	 tvKfnQ7jINJrGP9HvVfl5Nd6qCKi3HwM0K8VTZVtT8ggZJoV0VlnEFz+eTRo1QJt3sQ5g
	 25V7zLp79JdT1brT07Kk4SF3D6nuT2wo2iNXfBj7aIkaBeF82qQfodNiB2eiNdqjo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134889;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JcOCgKK83tI620ccd7QGXNdEcRDvt0uf9IVVSCZNoXo=;
	b=kXh05A09Gsih5yHpFgDaWhPAUQVIRo/1kIUjWDRmFZ+DyTcHSlS7xr03K0r1E7vIBHew
	 0g+LHdlMM7+98HKoK3TqPFkpSmDEi4U9uyZYpMU+B8um5ng+Hib/n2jsIa0Sh8+B71X+E
	 iWMlO4n3l10ABmbNvTdAVboKiyWtLUERwMlrEZHGpSlqV8BTww2Of6GJpysjMnToPaDvG
	 sx/3b61xZ2koA9vfrUoIeURqG9gBt0PJzMIfRq/CGBQD1+583f6TZKVnBr6OLjT1JOwHK
	 CDyUGxE/VBaRPWiwsblT1ZKCgHgOHrjtcIcJg7Cbimmorwo0Apvjm0TyM9hAsPWgm4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aelra8RV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1586606A325
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 00:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aelra8RV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145321F000C6;
	Fri, 20 Nov 2026 00:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795134889;
	bh=JcOCgKK83tI620ccd7QGXNdEcRDvt0uf9IVVSCZNoXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aelra8RVPROXTjx0A71Z4bMDD/nRdoR8vfRWV1dFHOuEuz2WNHY+PUEbizw8jc0Kt
	 g5gXmblLansa+nxZVEiPK0m76uXNNpYZIKGhGHybQNkoFT/dAnh7/hkl+Juwb68KsZ
	 WURmNxoE8hUfmu/qV3KWyQboQ726jiMJh6+nAijo6oWuiWpNTi1SPBjEL0DkcsrMbA
	 rpphCIYe632sLKFfPKXBdhJ2H7wIdiehImGkjsZWPZ0QkyM1mIfdgIDs7mJkon9Kkh
	 e25mRCJss9Vg8E30TrM48fWPlHy18YRiCduakYRYa2xoZmRf40lhln4W+Gl60iIo4l
	 KXUKPvvXcR9og==
Date: Fri, 20 Nov 2026 01:34:45 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <av-UBJhM_77OtKJA@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
 <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
 <au0J1MGwWEwdnUSK@devuan>
 <e2835e4f-3cb4-4b39-9a1d-a6b222e8bbb4@redhat.com>
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
	protocol="application/pgp-signature"; boundary="3ovmueibzat73h7s"
Content-Disposition: inline
In-Reply-To: <e2835e4f-3cb4-4b39-9a1d-a6b222e8bbb4@redhat.com>


--3ovmueibzat73h7s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Carlos O'Donell <carlos@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, 
	Xavier Leroy <Xavier.Leroy@inria.fr>, linux-man <linux-man@vger.kernel.org>, 
	Michal Schorm <mschorm@redhat.com>
Subject: Re: Two copyright notices missing in 6.20?
Message-ID: <av-UBJhM_77OtKJA@devuan>
References: <9d4eec62-bfab-4cf9-ac48-c77dd57b60ac@redhat.com>
 <aukT75oZFuvhwiEd@devuan>
 <0b9233b7-3c3f-4209-9d01-a1c94aaa8439@redhat.com>
 <aun6mEuYKQG-1IKv@devuan>
 <40697762-75d5-4d08-9740-4e68b379d80b@redhat.com>
 <au0J1MGwWEwdnUSK@devuan>
 <e2835e4f-3cb4-4b39-9a1d-a6b222e8bbb4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e2835e4f-3cb4-4b39-9a1d-a6b222e8bbb4@redhat.com>

Hi Carlos,

> Date: 2026-11-09 16:42:39-0500
> From: Carlos O'Donell <carlos@redhat.com>
>
> On 11/5/26 6:06 PM, Alejandro Colomar wrote:
> > Actually, I've looked at memcpy(3), and the text I thought might have
> > come from glibc is not present in the glibc manual, so I guess it's
> > from this project only.  The text from glibc might have been replaced
> > entirely over time.
>=20
> Agreed.
>=20
> > Now we have a Ship of Theseus problem here.  The page doesn't seem to
> > contain any copyrighted text, but are we allowed to just drop that
> > license notice?  Any suggestions about memcpy(3)?
> I think at this point the interface is so well understood and the text
> sufficiently simple that we can keep memcpy.3 as-is for 6.20+.
>=20
> However, signbit.3 clearly says "Based on glibc infopages, copyright Free=
 Software Foundation"
>=20
> Likewise "heavily based on glibc infopages, copyright Free Software Found=
ation"
>=20
> Both of these should be rewritten from scratch IMO if we're going to ship
> something that is legally permissible without being GFDL.
>=20
> I can't write these since I'm involved in reviewing artih.texi updates
> for glibc.
>=20
> I think anyone else could probably write them.

I've rewritten the pages.


Have a lovely night!
Alex

>=20
> --=20
> Cheers,
> Carlos.
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--3ovmueibzat73h7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr/laUACgkQ64mZXMKQ
wqmb+g//UobCkNh89cdePh1YHI5Mm9StwjpDQmvHhcPdu94vMj/kijOVT2htfRAi
smHA5o7byRey87RdBMQts/guQEtV4Rbj9iID3Z8LzXXwPsHTqkrkAiOGpY5rKAJL
pAzjPtd7UcKKeLTso7/A6Hdtgo9XTpUY/DpVoNZEBCp5+plk4nr1eX759KhPy740
uGW46q2Y+DkL7RTFqjfz4UCdN/tP2Iaf4H+xdmnwtti3M/RFh/S2rikOiRyxTmJ2
5dKfdEmIZksWgNcZOyVKmaAFTCuriIsU4NIJP+mTvqkiRTve51B5qpGBifO9KE3W
by4bpOKazcicbPAIGGAQ8Im5aLEBNB9WkZB9yW0rxdjY7ng2jYOqFYjJh5NTQEY1
ue1RHeY1F57k3eb9TUdGJc7L4z2sToCXmUe5wKe1C/7PNfdxI3FNpsu4O3y2nxXO
wQwTpVtRnd/KVq50SLvvvpcmTMqMtvloSPMoNeNTmFqn+Xh8p51qrBIP+sDDPkpo
7GG7xIMyFiKL0sz9BGuVvMarSYPcS93dYrFpxP0hX+pN4Nw9XMZR5B+2v7PjY/x2
6YFyWk+b+/Nj+90X+r2P/y6TuEYpBIOSbCTOiwIT5j3Z58/JIh7nD4CbJgz9kixA
LiznaOVjA98ImkL+/76cIq3lFqArp//HWjswK2wfzIw1Y3Zzv08=
=bnD8
-----END PGP SIGNATURE-----

--3ovmueibzat73h7s--
