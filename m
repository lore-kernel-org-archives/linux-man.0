Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049616;
	b=S2q8oljLKi7BSGRrciVIKxJyFTAJrn23WdfRndmJeAALCpJmZySMgS1fvOwewtDPYNKW
	 sMSUle5ekrR6shnz1Pqp8RDxhTbDCNq6DV30eMGv1T/4w+QeGRa9EVfIf1HO7b68ThRrw
	 eOMunWPlq3lJyHTcCJz47oXo77+v7/QMMbCGmn4Diz9tJAUvJfPhfUxPyVr43hkth/oYq
	 yWIe92ZfcIu1W74Y5nMIS8bL+tPism6ibEc3jiOT1bEZ3cvbbXbNPnMFMiT3E8d787X1H
	 bfEJBA8QWRFg4DSDgGweLC7elGmO4TlVV+5D9nFUKdn9Evt24Iz2Gb6Fkw/EgmXBfAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049616;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ur5Y7X1SHA23N07WIwLaHVZ9ClIEdoAV32QcXnFLm/s=;
	b=oSpv8bb/E8duY06zMqo6c4IQkEZzSLkk/EooAHIhHM/HxLy81PRbMR0SKEaFzG/5R8qR
	 JTPtETAIIOGyW3PQwDrwkIdJsf0aY0cBI+6m1TGbWkNk+XjNsbbX2bxh61Y955qAkj1Pv
	 loWKo3EDiWLONYnGrDqFhc90mF4EV6B1iNUliSCs/pRYN3PdElXsAIK1mAxLtgy3kg/Pf
	 MgeujNiCLDxzzOrxCgJkSZx9grIwrCUGS0O3VomkgtNhFjEMoE4lL+aXjQ0Chy/YBoMGf
	 oz3nGLfQIXRWidZxmAb//fs6g/Na19InZD2rrSzLdZ2SAYmAn/gmmEowfzBhf9rAmpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjyFKrE4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C1606A32C
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HjyFKrE4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C079B1F008A3;
	Sat,  7 Nov 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049616;
	bh=Ur5Y7X1SHA23N07WIwLaHVZ9ClIEdoAV32QcXnFLm/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HjyFKrE4I+b+rClAGHZltGAny54/9ibfPQWhjKuBHK83hUXoCSLREqYs4buCu/c5T
	 cgaUHbdWnQy0DO69UjqJE3C/4njoVHYPky8typwwFDc+ED/2ejtOxLn+pQIzT5+QiD
	 91jMFUvLiexU3Imp6PirJGui2ekc1FP0YznaTK9l3XGa0iClB/2A+48etCircSwKsl
	 vymX+li2nQZdpWgd4hIrw808ap1iv+8sAlyGwr/DRi7w56KVopSTKXT4c2bz/5GT9O
	 lVZ35zMpW+B/F6Xa8d2KqAPuAk9S2BP3u/BZ1zpOthRtNiHAYlXV/Q2XaI5BkV7yBF
	 hzQMvOeDEVc0w==
Date: Sat, 7 Nov 2026 12:06:48 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: PR_SET_PTRACER can also EINVAL when Yama is not configured
Message-ID: <au8GKjxzoGpp4MqU@debian>
References: <d18b61d8-640e-4474-9a61-9cc5aac1c7d9@cesarb.eti.br>
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
	protocol="application/pgp-signature"; boundary="vizdaa5fjx3gf7zb"
Content-Disposition: inline
In-Reply-To: <d18b61d8-640e-4474-9a61-9cc5aac1c7d9@cesarb.eti.br>


--vizdaa5fjx3gf7zb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
Cc: linux-man@vger.kernel.org
Subject: Re: PR_SET_PTRACER can also EINVAL when Yama is not configured
Message-ID: <au8GKjxzoGpp4MqU@debian>
References: <d18b61d8-640e-4474-9a61-9cc5aac1c7d9@cesarb.eti.br>
MIME-Version: 1.0
In-Reply-To: <d18b61d8-640e-4474-9a61-9cc5aac1c7d9@cesarb.eti.br>

Hi Cesar,

> Date: 2026-11-07 07:26:32-0300
> From: Cesar Eduardo Barros <cesarb@cesarb.eti.br>
>
> The man page for PR_SET_PTRACER mentions three cases in which
> prctl(PR_SET_PTRACER, ...) can fail with EINVAL, but there's a fourth cas=
e:
> when CONFIG_SECURITY_YAMA=3Dn
>=20
> The code which deals with the three currently documented cases is at
> security/yama/yama_lsm.c which is only compiled when "Yama support" is
> configured. When it isn't, it falls through to the default case at
> kernel/sys.c which returns EINVAL.
>=20
> (I was alerted to this at
> https://github.com/cesarb/count_instructions/pull/1 where I was told that=
 it
> fails with EINVAL when the Yama LSM is not installed. I had written the c=
ode
> based on the man page, so I hadn't considered this fourth case.)

Thanks for the report!  Would you mind sending a patch?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--vizdaa5fjx3gf7zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvBkgACgkQ64mZXMKQ
wqmNkBAAl+yaGh+GJcvbFTfxdm9VIwmh+5yNMq75jD61rVJJ4Kql36ISJ3BNx38w
1q/4mVDot7rwL4QUnC+GSSeFufyvxMlag961JNYOsbV9qzAV+EmNWwG9NpC6laxl
qdB+iRhfJOpN8OabEhnGBqXIGwiOBkHTUf8dqVEK6US3v9Cia/LimFZifov8JXW8
HOpm39zkyTGulHDQ0MSQWOvOrLebsOPLgyalbUvunbbSAgDSN7tfnMjEJoZ5dmfU
Wq48FVjwe2yh+bFEXprQuQ9q2fkxv6oOZtATHws20h3hWM2qoQoalmtSIX+NKSFb
qqlF7A6DxIt6PLKKh3mKiULH3aUcJkmrgD+2K0lsMA72X9YyWlWf2CX6eOOHAVb3
kwlP/ULlOnwFQFXLAfp5SR89ExEGDGV6FOloKR82wdWYCxTcP3dITH6KeZYIPlhV
npTJMFIrFr7RHhQd6a+XSUNTdnL1o5nt6sXgyzUiiNKJ7TzToZrgHkVtHzrskNN+
SB75OBxY3+qsmvYfb2NpdXJNECDzWiqnejSrvE1gwvyaFL+SzK1pCjohUsxmjvY9
bE4ifwaoCJtKrP8/XFVa4VOHskDSN4UhPHaw4340oHxWNCLKbqDdW0a2LEdlPeKn
07wCeDCaBwe6BatVI6XDPWZTRi447fUDPgJTYXmR4uVQw0WS5gs=
=3IF5
-----END PGP SIGNATURE-----

--vizdaa5fjx3gf7zb--
