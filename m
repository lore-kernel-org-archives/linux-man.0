Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605946;
	b=P6AcDvqae2kqFf4xXMBHb7UNSLbqNGWQ+kgVygMAjWTsfa8Wv5xE9jfMlueMXwcaeLVn
	 txITmvYJJUScDmb9exzF2UddjCQuAJlbDP1/Q1Iac/wntRnxu0VqIfA/4JKU08ZbpCHDz
	 U4bawwte1V77N5vy2yXZbrGaoTjR3LfOjjQFUJjhGMslEm+lJu2SAkgacrC9IIew0ABs2
	 +DI+BVlj/jkoe8mnv6PD0eMkdlwow8mxjI6Bwr+fIqTBZu3wqo+pypthdCUrsEsHg19ee
	 76zBtZXHUvCmc3IfKXx5mWJeo5j2eU92V+MmZHmU9YFR4jmnOmfaUEcsnEaG9ip5oHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605946;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rVNfgdsp9CA9BwBVwpct2EZQ9FfpbnPY0UecemrheNw=;
	b=fJq9gZfidOk/VkicMplUP0zXOB+MQdfFYTqI6Oxao9bALDLEZoo6+Fw5FPylS9aLLABW
	 u5LTCbuAG6A4pSirObN27k/+iHpEs/0UQcC7zwkSyUImmKfene0hD7Y0jjmsfu9Klmy37
	 uYAxiG7DxRniigadJUjxSml5+/O0cNcfntDtIphy3Ux84o2zH7Umml9skloVS1Ftx6yU3
	 DY0EFI23Ww8+/t3AU+rOOAdgRTwFeYARf6JnKldZmNxQ/Tt++kLYJ2Tuxmk+s9CadPcMZ
	 8VRdLdnO7pttvlBFrkT6ivMxLU3UOD3irujwu02ApOiqTfw75aQuDVCnx1ewkTlUB4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9QT8lb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B122606A323
	for <linux-man@vger.kernel.org>; Fri, 13 Nov 2026 21:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e9QT8lb5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42CA1F000C4;
	Fri, 13 Nov 2026 21:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794605946;
	bh=rVNfgdsp9CA9BwBVwpct2EZQ9FfpbnPY0UecemrheNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e9QT8lb5MaRtq5547ZEMUOCCdJsooMst2r5TSYKtNAVkxACu1Q+sDTtyp9MgLYgme
	 hDuravZrGyCHoi5lpRG9H+R+B0BMNF97sTEogCxAcCFVaorcYaGQToDQRp9vAWU/x9
	 9f88+2j7JGJm7KA+rOiRdUhI3EOHiSinSPVSueUVJ3u3lLaNSUeFX7v1Z8xDv75Mcw
	 a7Ft4p+4Z73QFW/isHdghux3l3gMUIS4999PyaPYCGPXIijXfcVJs3LoYDDPLKrRAG
	 1bYTKf83XJZsKcuDl0s8t850Dx8oLh2rpXA/DTXBFA+PPDj6yrbFWrHFqinPtjNeGz
	 HTOTX/XjHyloQ==
Date: Fri, 13 Nov 2026 22:39:02 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <aveC_KnRVLx8eCkt@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="dmuapspri47huaat"
Content-Disposition: inline
In-Reply-To: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>


--dmuapspri47huaat
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <aveC_KnRVLx8eCkt@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>


Hi Jorge,

> Date: 2026-11-13 21:28:32+0000
> From: Jorge Almeida <jjalmeida@gmail.com>
>
> Hi,
>=20
> The opendir(3) manual page currently describes fdopendir() as being
> "like opendir(), but returns a directory stream for the directory
> referred to by the open file descriptor fd."
>=20
> However, it omits a critical detail documented in POSIX (fdopendir(3p))
> and the BSD man pages: fdopendir() uses the current file offset of fd
> rather than resetting it to zero.
>=20
> If a caller duplicates an open directory descriptor with dup() and
> exhausts the stream with readdir(), subsequent dup() + fdopendir()
> calls will immediately hit EOF unless rewinddir() or lseek() is called.
> By contrast, fdopen(3) explicitly warns that the stream's file
> position indicator is set to that belonging to fd.
>=20
> Could a similar note be added to the fdopendir() description in
> opendir(3)?

Would you mind sending a patch?

If so, you can have a look at
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING>
and
<https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/CONTRIBUT=
ING.d/>
for some help (and I will gladly help if you have any questions).


Have a lovely night!
Alex

>=20
> Thanks.
>=20

--=20
<https://www.alejandro-colomar.es>

--dmuapspri47huaat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr3g3YACgkQ64mZXMKQ
wqmS4A//e1twWtyw5YLSALYqyJ1Tk6zeSAzMq3hieGZPDZpg2h7Zb4Y73tKrbwHq
u1SfMjX8QiNQuNkAiwWEP7NMgxmIqEKoe37O5Bdsh2dzPd9AEL8GQIXikK5aUaVn
+qwOI6SqY+2YUp3/ZKkqEApmco/zZrTYrqwfn0SDJaXfZ8GUm9W/U1Cliq8XqCxT
3RgCUas8l5Ca08E3GqTRqFfaYPSBdg6X6tyKrVrOoS4E0Pg+zUpplq4BCyPSsdxz
UL3v5Aht+hPDcp2ymj2nmRYN1q+oMKNrYxMGWspVwApKd0KWbz12/i7LeYMTMsPc
Ls2vX0PcQxtvizn1DLbt4NuAh7+OEXXgePPyiO1Z1Mo7OdcZnu2qUHNAlbRw5i/4
10SlQ2Or0pD16fZ1seYgjYlPBMWpXvuhmgZe2fFbk28oou2NiTFDjFOZREBaYzZj
sb044mXEyWz6tft5kpS7oPxdrC048QWfIaw2904NboFWD0hd2kNBKHkUv8CpUVXF
F3tfp1FpKy2KpjwELlyUb6M1njqljPbQZ+1cZTOatdm3GgpxPh9vkA9pTtEXlRWd
Oi+FJwtYg6D6iKJsXY86TAzZMoaqEAP6eUKklXYOwuM9Jq+oYgG+pF4CCxuM0qxK
AK8TQYEe2uDIlsqAJjk/OHjwk9h67L4E+SqAlDLZBpwXZkvFikk=
=ayn+
-----END PGP SIGNATURE-----

--dmuapspri47huaat--
