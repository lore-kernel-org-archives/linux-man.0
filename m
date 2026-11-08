Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172543;
	b=d+JgDUT6iVjh1ILs9mQXFtv/lDr0qvu8cQ0G6S1HPVnNqY5LHq3qHD0oO7o1Htl2VTH6
	 RJp9OCiLdj9fhNrvID/ejkHWO9v6fM9uOld0X3yl/MjVMOzxjz/I8ZEtxwJRyLjj7Kxct
	 rz4RkXY+AxgQ3gouDM2VM4y7oLDwgcvpnUR+G9p6vxu99vKO9N9IHBBEKeY7FslkCpDJo
	 tQL2DCNp7wFJpop9zyILc97dUV9hfz/35EZ4DTV7B8wV8poUGMijIaLtZ98DIIEM/0DpR
	 3Dhvw8AMONE7hpuTke2AKXmQUZc6MPGQ5RcFQ3ci2Asq+Hr3yAxqYLcJOKfmyazi3gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172543;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=plYnVLgTIAqYX4f6z2DLWqZiC3QaXXAloGBzEJU9RRE=;
	b=ziXW1zXONuR7RkcSPAvbWGBwfzr1HckMl6y5V3YO9EoL2vU+QQfIa5L1utYGyliu9sMG
	 6n3v39xKh1CvfYZm6hoKLqMN5lp3HxK5jN5wxGvVZRCoAPhpS0fSyF9W9ZXgyoEAA6Yxd
	 zSjGj6ftikLgGKAG/IX52G0fJcPFhkwUW+RW51ZdSTDdpFkgz35dviOB76skFhG/unWnS
	 xyx0WG0ZYbfThBU6J8MpFxN3FVv3R/hlfl481a9DdtXD11viGscxLzI4H6IkW/RDcVINQ
	 ZJqDRPT9/KUFTzhsJDbEz/npyZ1rd0WrqVrFIDBFZAdVb0E4VFsx60bf8Ox8Z2CgWDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ibaYt/zZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ECB606A321
	for <linux-man@vger.kernel.org>; Sun,  8 Nov 2026 21:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibaYt/zZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB081F0089F;
	Sun,  8 Nov 2026 21:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172543;
	bh=plYnVLgTIAqYX4f6z2DLWqZiC3QaXXAloGBzEJU9RRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibaYt/zZv9Gipwnr/9lATFUD6YNo/qM3vt5+kaQfjtteh1wyDVQV6M4+4r9Labn7p
	 DDk0jg/Vm1EaVcIYVDG+cZAG/VtSnQyejKyxSjNIDHpPXRmtiAKay5VZmEQVmeNY3j
	 S4gQFLkpuImxXkTIoPKLMUtlO47dptqez0PapBbSVNodEfq7c6J6V0gTHfJ56OYl38
	 cXYmaf4jeuA9L4u+sLR3+83Mt1gckfFkvVhnl9ieQ792jjssEvXzsC6udZCmWQhium
	 x86PbUcxm6rLrRrp1vNNZ4l6cOwboeKFfucS97E4M15ZN0E/vA/n3ygHgDOtVV4a4S
	 QFDgrsqyCBesg==
Date: Sun, 8 Nov 2026 22:15:36 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: Re: groff 1.25.0 released
Message-ID: <avDd1g8KQ9tzkUzF@debian>
References: <20261108200022.5xbnilb3ut4qef6w@illithid>
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
	protocol="application/pgp-signature"; boundary="5ewc2cqmbozaimxq"
Content-Disposition: inline
In-Reply-To: <20261108200022.5xbnilb3ut4qef6w@illithid>


--5ewc2cqmbozaimxq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: groff@gnu.org, linux-man@vger.kernel.org
Subject: Re: groff 1.25.0 released
Message-ID: <avDd1g8KQ9tzkUzF@debian>
References: <20261108200022.5xbnilb3ut4qef6w@illithid>
MIME-Version: 1.0
In-Reply-To: <20261108200022.5xbnilb3ut4qef6w@illithid>

Hi Branden,

> Date: 2026-11-08 14:00:22-0600
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> We are pleased to announce the availability of groff 1.25.0.
[...]
>=20
>=20
> Acknowledgements
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> We'd like to thank the following people for helping ensure the quality
> of this release.
>=20
> Alex Colomar

:-)

Would you mind having a look at Mr. Sed and his friends?  (Unless/after
you have any regression reports.)

BTW, I have some old patches for you, and I'd need you to bump gnulib
to be able to work on them.  Would you mind bumping it?


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--5ewc2cqmbozaimxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrw5ngACgkQ64mZXMKQ
wqmHLRAAsmIX5GueoLUG3+d6KM6BTGu1wGabf0XUqfZpzGz74Gc5MP6uxppSfXmz
bL9liRiREiZ5GWyrQzCvtJDk2SnxI114k+p1O0ixMuy5WofhVfNCX0nltrK2eNu2
5cP3fKZTO5X9bv7y/VDFKkQHmNRFCJ21Ho+Eu1pBgcIaqYUQVcmJ7+xBVdj8kNbR
OVWBl/Hzc2SmqQbQ6/6YXQrOLoTxISQoOk9mwq6PveLxkxw5n1dNzG6htG7XcsgV
yYyBrcTvUIF/i6M8gfF0tlpcfplmzEYLuI3ugQWxiDMgWmi1gGO67edlNybE0a/y
479eSNcSWsZKtznxGevyS+Z1nEtK3cooPMPMvLljW7b3dE9gbjTLfpT4MU3NofDT
P6rRmCQq/ROYvJRiCPUAiM8KwCDJQdTWbEV1sZA+wg4lWyzOE4V2uZKD85R3Z9A2
/GmnAvjOumc1QWsG6P01Z2CL/ih72F811lSSsujS/uBqFShtELBT+GUJmT83ekHm
nKsJuZi6VN30f84MuvAPpnJYSvYOw+q6aoYAocAE+/PYjCbvzFR+qDu8Udrfbc5I
x9ck1LoL3z6MhB1VuBEljK3migd+5M3pYRdZ4Fzjz7OO9OPdh5Gw2rXMr5rfDEae
TrpYfuiGcJ0a3oBebEjQLFkfYY52QgjG7iw4CNfCyTvR20RnD9Y=
=xgaK
-----END PGP SIGNATURE-----

--5ewc2cqmbozaimxq--
