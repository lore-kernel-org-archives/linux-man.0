Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795470504;
	b=DWj2Nfrh0RdsYvWWIIQ33VI597DluYF7yrpTH3rZZ/6pdv5E+sS5PuDpjOELokpodClM
	 6Hj29ZmCJlQYGm1dPIrQ+wx35o1M35hxFGwckM21QMLP1T+vCFl6dOH/p4eeE/iLnV+W2
	 OU9Vs6dyXLzRIm9ABpMzlgTOaGQ9Z5Dm/sn2yRzX2v8Aiy5nN9cw093OnohMII24Okc09
	 9g9DeNI8qBrawSvieGezDnKpk4qADfA7tpUiRmLwswE0KzDTJ4Z981sf5KujyMwc0Ev/M
	 dYBMlulOGIxu7woEjUtEitF6s2JbRuBeWBkQLCMBQ+M+F8ACVCRvBR+9oCU0Xm6IgEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470504;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YvSGIjJRxy+rfGRIZUonYG3O7LGC8Oe+eCt1lubmhdc=;
	b=G4NBfe0u7OpO2c6PE3chLuLI/QoISpsCjHbaRFhnEpECp3ooZtCW1NPUvwpFDNoG9CRK
	 4esUL8XirH1cvTT5Vd40lYOwpdKp5dVKXK+lcCNXSS/lRs2tey0xYoZaYldFQthBYFGMg
	 Ym0AO+gGXywPDNkPabwcqMu9MnivWCoHhsAvBNxnttzMI3YU7bK4qRBOJFA89mPPFg4X+
	 5say4moEOcJrq/RsPe/xTOgrlPnnnzXdkfeI3aq2kKUMhujCtWjwzTK/lyUPBzJCknzvl
	 hPfeTxQIYiiGpa2Mpts87SpNknIJ0ukBJ7z7jslzKdcVgAt+81YNuUOyK2wzEtPFKxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPpceA9n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF8D606A31E
	for <linux-man@vger.kernel.org>; Mon, 23 Nov 2026 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VPpceA9n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7291F000C4;
	Mon, 23 Nov 2026 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470503;
	bh=YvSGIjJRxy+rfGRIZUonYG3O7LGC8Oe+eCt1lubmhdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VPpceA9nBDfI+7u1PeR7hH+Enrm5rZ63+8+vQE1l2lao+S/NL08K6Z1VrUbSY3R4V
	 VqvxdQ1dba8Ahf8d0C+G/uey4hfOMq2fh0yS9kH0oI1+ZALKxM4f27gbc5cmtQzPgo
	 QV0RBXrto4yTpl1yMV0IYRxV76RPfwgz2iYUeuSswBGKVMfqCvYaYyhiNma8cUOgfs
	 lkt9VKyxnQ0pTXDDFXFTPSQ3N453Skg/wl/eQGpzgLF+0rOhK6gG7xxwnpSfjrRyso
	 ocUgqX6DC+DAsD63LIIMSzYHr0LarXgUP+QSYBZGEoVdF1BD3bhMqg+6rtigFh3+Ba
	 92VeosUB/LojA==
Date: Mon, 23 Nov 2026 22:48:20 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Graham Manson <manson.graham@outlook.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: broken link in man7 man pages footer
Message-ID: <awS0d1MMJf06YOiY@devuan>
References: <DD6CA25F-158C-47ED-B99A-9EB6ED7BA515@outlook.com>
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
	protocol="application/pgp-signature"; boundary="ibguaeze4uv2nw63"
Content-Disposition: inline
In-Reply-To: <DD6CA25F-158C-47ED-B99A-9EB6ED7BA515@outlook.com>


--ibguaeze4uv2nw63
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Graham Manson <manson.graham@outlook.com>
Cc: "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
Subject: Re: broken link in man7 man pages footer
Message-ID: <awS0d1MMJf06YOiY@devuan>
References: <DD6CA25F-158C-47ED-B99A-9EB6ED7BA515@outlook.com>
MIME-Version: 1.0
In-Reply-To: <DD6CA25F-158C-47ED-B99A-9EB6ED7BA515@outlook.com>

Hi Graham,

> Date: 2026-11-23 19:41:22+0000
> From: Graham Manson <manson.graham@outlook.com>
>
> Hi,
>=20
> The footer for man pages on man7.org has the line =E2=80=9CHosting by jam=
bit
> GmbH.=E2=80=9D  That links to www.jambit.com/index_en.html, which doesn=
=E2=80=99t
> exist anymore.  I believe it should point to www.jambit.com/en.

You should report that to Michael Kerrisk (it's his website).
<man-pages@man7.org>


Have a lovely night!
Alex

>=20
> Thanks,
> Graham

--=20
<https://www.alejandro-colomar.es>

--ibguaeze4uv2nw63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsEtKQACgkQ64mZXMKQ
wqlipg/9EKTEhD7308Q0DMMDA6F1VePyyKrLOHmyLlIVKdBqEkYJmZ58s/51Jbfd
0ld628/NOIE/U2AzLW3EMmvOqSGAw+vycbF4USGkGeF2ZvdCpw+X3gjMhZDSgKEp
HvVz3CEIb4ViTlUaF2h9q2RDThKjeBocp4zE9alt9oM3leF1W7WBCKevP7Vfyqni
Q+8W6CdkP0qUxJnQnptOJSVsUBGnH2y6dvR4rnPl8GkArRzUmvRZSMcPF2EKSQVY
yjLI/LtxISwBjd7uUT3zpt0rbFHPJ8yIZlRDLI7wQtRvdGkr6k65sAfCaihoPxuB
YSMHFYCDXgu8hz3cojr/hql3dwyijTYxgcJ/9Zugqb4Bg+prSJCV3n6vK3g23Nn9
FhbQ61DC9Dcl82pwakXA7ZHrcTHbOOImZZI5P4DYynQnjxbvNT9/IaxV8WVA8nWe
OgCXhroTl9JwfgE9Mr73bIaa/phYLQVjTxw0gPb2pwbom9mjSowiCXW9D+oGELFg
5I05wAXcgTFWk3sRJ8Hn0uUvsijX9JmgJ8yg8mxWoQhVNB4xhXG7pR9zAo6fKfq9
Z7488o7gBx0Y7NuoN0+7lUpSuK6M1O8eBopwzDOntrsapRoIjTOXNcmS5N1g0nYv
yDFYD48yhOQF4B3DbKtsWFOm7OB8Auvax/4J/GQ5IRWXEX4Dcfk=
=2VBy
-----END PGP SIGNATURE-----

--ibguaeze4uv2nw63--
