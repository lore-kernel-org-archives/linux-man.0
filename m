Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839310;
	b=i7YQRcnfG17Xx3+7ZnhYQ9VnMxXtnVP1wnGqkQfqEsvUrlaIN2M2/g1WOHpXKRfCvbP2
	 ZYbE9VYJVvykvSDD133BDxMqyN8uHFUchH6tQBLhv0jDpsKeJH8xPYASu8l7PEes4TopJ
	 g+LTZS2b3P8LV5hKroV9Z+vXqfV52ijUmjnY+AvoR/OXUEu8fr73TdZli5Ijoz5aralEo
	 o/8njwmKAT40NGNWPb2grGXLgz3dZWHafT+5Tj8VygkWka0TLSDuqlajgr7prcGp2PHWX
	 EHeaup1q6ZWCHZAob0TMlWCnweeRSSAUmMuryp9eUQqUKMVDhyV9dngxpKfk3bzS0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SEhVLOACEWoKkYwAbCrnn5j/REFmB2MgVadTUxSolNs=;
	b=v9OIKsT1v1RbG/Ryj+z8iJLF/DdWFqtWmseUuNFQIv8GnSTEX8TaE+H4N4z72Mt3I2SD
	 QaqNjWTVUCuQqPTMfIDRi1QcCWgWU78U2IR1JXWj/jqulq7ic9Wc0oqLt7PYkPTOZtYQH
	 gzhe9Y3eFrWvfewyU8kE4UXGo8eXPqdYA07l8lWGvhyCPyfHF8GoD0PEPldePSgcT8uFF
	 UvkX6kbamVRCSSD7KhXlDVh1bsar6KRJRNbpQZCtPqQyPTpP1vdvZrabh7fwMtyf9eUzp
	 tyFNc84g0yCcRmwCni1Ts2elG9i1aTzwjnirBgkd/CGTuDpTtm5RfchPNPRKp/48cfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNWvb3RJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D373606A31D
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNWvb3RJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA571F01825;
	Sat, 24 Oct 2026 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792839308;
	bh=SEhVLOACEWoKkYwAbCrnn5j/REFmB2MgVadTUxSolNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SNWvb3RJamymcH3y9LzKZqMxgXRgbAMGhjKF8KLPCWXK9R5wFvYOJ2DcNdPgYRUWK
	 lzly1kcu+ROHxoIsqxsRTR/jyZkaO8iv87kxmTidg+zCHMNe/NNQAooZ9Y5b2BvdRD
	 O5KPgb1s14u8UEsc4mc+jmeCbkFyVzDtwFT8J5r4dt/iJXLVAuwRljVXHNVIVVZ3qS
	 O+6E7hIBKM+1EPQ4XDUyvguG+Od62xc7hPr1P2bKrWRrhTbhekyuCLfG/ZgW7xT4Jx
	 h1XF4cfGyCny0nIW/Txxy6/RfrrG90i/h0YX43MKZZ4P8/5ReDAGp5U2oY2p0krIM9
	 gv9GiH0hYxA4A==
Date: Sat, 24 Oct 2026 12:55:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/3] man/man2const: Document fcntls F_DUPFD_QUERY,
 F_CREATED_QUERY
Message-ID: <atyOMv-m6bR1acFO@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="yg2ggbtxitvt36vz"
Content-Disposition: inline
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>


--yg2ggbtxitvt36vz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yannick Le Pennec <yannick.lepennec@live.fr>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v1 0/3] man/man2const: Document fcntls F_DUPFD_QUERY,
 F_CREATED_QUERY
Message-ID: <atyOMv-m6bR1acFO@debian>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>

Hi Yannick,

> Date: 2026-10-12 23:08:13+0200
> From: Yannick Le Pennec <yannick.lepennec@live.fr>
>
> Linux 6.10 and 6.12 added two new fcntl(2) operations, respectively:
>=20
>   F_DUPFD_QUERY
>     since linux 6.10  c62b758bae6a ("fcntl: add F_DUPFD_QUERY fcntl()")
>     since glibc 2.41  28f8cee64a32 ("Add F_DUPFD_QUERY from Linux 6.10 to
>                                     bits/fcntl-linux.h")
>     Checks whether two fds point to the same open file description.
>=20
>   F_CREATED_QUERY
>     since linux 6.12  820a185896b7 ("fcntl: add F_CREATED_QUERY")
>     since glibc 2.41  322e9d4e4430 ("Add F_CREATED_QUERY from Linux 6.12 =
to
>                                     bits/fcntl-linux.h")
>     Checks whether a file was created by a call to open(2) with O_CREAT.
>=20
> This patch series documents both operations individually, with usage exam=
ples,
> then adds a new category in fcntl.2 that references them.
> I hesitated somewhat on whether F_DUPFD_QUERY should belong in the
> 'Duplicating a file descriptor' section of fcntl.2, or whether it should =
go with
> F_CREATED_QUERY in a separate 'Open file description queries' section, th=
is
> series proposes the latter.

I agree with the proposal, since it doesn't duplicate an fd.  Thanks!


Have a lovely day!
Alex

>=20
> Link: <https://lore.kernel.org/dri-devel/CAHk-=3DwixO-fmQYgbGic-BQVUd9RQh=
wGsF4bGk8ufWDKnRS1v_A@mail.gmail.com/>
> Link: <https://lore.kernel.org/all/20240724-work-fcntl-v1-1-e8153a2f1991@=
kernel.org/>
> Link: <https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D28f8cee64a=
3223636d15c78f69432503d8ef1c22>
> Link: <https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3D322e9d4e44=
3084336ea41a8e7bf72456ab273b73>
>=20
> Yannick Le Pennec (3):
>   man/man2const/F_DUPFD_QUERY.2const: Add page
>   man/man2const/F_CREATED_QUERY.2const: Add page
>   man/man2/fcntl.2: Add section
>=20
>  man/man2/fcntl.2                     |   5 ++
>  man/man2const/F_CREATED_QUERY.2const | 107 +++++++++++++++++++++++++++
>  man/man2const/F_DUPFD_QUERY.2const   | 105 ++++++++++++++++++++++++++
>  3 files changed, 217 insertions(+)
>  create mode 100644 man/man2const/F_CREATED_QUERY.2const
>  create mode 100644 man/man2const/F_DUPFD_QUERY.2const
>=20
> Range-diff against v0:
> -:  ---------- > 1:  8fc8c6255e man/man2const/F_DUPFD_QUERY.2const: Add p=
age
> -:  ---------- > 2:  a29379d2a6 man/man2const/F_CREATED_QUERY.2const: Add=
 page
> -:  ---------- > 3:  fcc62e822a man/man2/fcntl.2: Add section
> --=20
> 2.55.0
>=20

--=20
<https://www.alejandro-colomar.es>

--yg2ggbtxitvt36vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrcjn0ACgkQ64mZXMKQ
wqkn8A/+NkIAwuKlawrXW+c7VZTwCoNMvt/BXB4V6TU7pKW1+5ttbK9YoPz7L/wd
X4yx/KdNDaDdP99J8tvQZDsgTNcpufqhFPi8fWW07ESp3reZBfONYPtGp9GP7xdB
PoBHoyuMQaibzdtELJ2dyEmlM2kvQ6AL2xnVGpdhrUrRVoGMcga3kZ4+b+OL2qZb
HQqQF/vR5zlBlGObIfrYI1b8K+B177kZsKe6KqNhqlGJto50tWm83iNWYW2mQjvj
+sRRr4+jubHD2z0keCPiQ8IDTIwQfTf7azmQI8EASpBdawC6BMOaGhKu0oo/W7bJ
25fFpctaPovMc2g45KSYw7LV9OQi3t6vduP7AlBxepIZTyz4CQ3sghZi9MfpQ04W
lKw9oLi8cQVAga1Ky/V2FDNIF1yuQLJ7LwlmMZUUtksi+2KV3mhBGQ21/IlGEluN
C+9WfTNyXdJettTh1nJIYGGMHIfVhBbmZh1KPPoUPhG9vTFahxyl8mM0F0DuD/kn
L0xuKv+95pMilfxyJPY31bi3Q7dKoTS56t0foXs1gpW12JsjTWmAAvzEsefqMIX/
IVVofH9BowzVPp4km2p5qRouW8X4t0vmzbqdvD7kRsDZQx59GTottTSoDwWDxxNr
kfJlAX38tf5/6qkdMLD9oxngMxWb4+sha1RmtMQortNgFIJ+jDU=
=P67u
-----END PGP SIGNATURE-----

--yg2ggbtxitvt36vz--
