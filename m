Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793538534;
	b=tB5h4+Ny9AMDE9knAvGhh8regeEeGS74Df6lhOa6EmHFP8vgpkS903YyD+AqNWkpFIvz
	 W0rVssX/uqiOaJe7f7V9xx2h0ZOfYzdAOUZXxYr2t7gM+eqO6VpIAUSIfB6U/aO5Y6Cdn
	 gXz5y8Rp7ZtsB4xjjf9s+7mXDoSyGvMkxHZRn1mdklRegR/1C1PnMuk4MFISpslml2y3k
	 Bz96UUjAgWutsPfCObJsoVDFpsD0O/m+fhckrOE01daNpv4ptlojNfPDBdFQjyHIUvWlu
	 vSdGbk+pp8CVR4urt9ROHB6tBJFLE9gpAxEt5FnDntxA7lJBjDTe1+1yJKI+X8ZXNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793538534;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WkVZZ07LuXNslu50KOWtXPho//VGbNf2V30rYYVn9No=;
	b=pjcc+XABXpNsWzBUzCS1vLm5j5QOL8B4r8Cv+wAKGRHME61frzVaRgZvE+84BV+JHJci
	 Advut72mnvfUG2SJ1gZyyJ5haTAQHQcWBzFCAeaVEiwM+bZ3qEj4+Dk6wy9DLry5oyN1p
	 zIyE5wEcN6SaTvUMJWXmnLfld3VbfTGdWMDvso4GxXdv4CWjeN0SDkCyYS9Ukgelc3EpX
	 AWiVGooGE0R8q+u88Uw83FRq2pq8cZtQtmX7qmsXEG6t76Ble7dGK+Q/MiRCP9tVDCU8P
	 TJwG5jc/aRsiP4Xx49GVn+P4WfwV3v0wykw8z27ndRYWmrG2x1VqFwkpi23CRVyE1Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnMhoCev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A1606A324
	for <linux-man@vger.kernel.org>; Sun,  1 Nov 2026 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnMhoCev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAB81F000C1;
	Sun,  1 Nov 2026 13:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793538533;
	bh=WkVZZ07LuXNslu50KOWtXPho//VGbNf2V30rYYVn9No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nnMhoCevCLE0VbarjRtvbbKOvoFwHAtEEnIa56Run5g8+ZvSx1iji6UHbEme+6oDD
	 Aflb7Pt7BDm+JPuIJcuIUuvQQXON0IBO7Cb7sq447Qdr1Q7LaCqrTT1PrlQSAF3Cno
	 9P1VRgVX2GE3g+SU2VMLjp+aGPPg2zh3MoPk+XJQS7V6tEGGr0tLtTYtr06Qb5YTkj
	 A3uHda4Q92PlBjUvKkzivGvwuqQ8iU+LxMKRO2L6Btw2TqhYC5kksLccElhRhAOEWZ
	 pCAunHvpeZ0qVR7IX3MLZ8E3pU3krlVWs1jp3Hmy8i3GOJhw01lu0Ol0c2XNRMc7eZ
	 2lZU42yRfKTAw==
Date: Sun, 1 Nov 2026 14:08:50 +0100
From: Alejandro Colomar <alx@kernel.org>
To: ben.kuo.tw@proton.me
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/epoll.7: Note that an edge-triggered listener
 needs an accept loop
Message-ID: <auc5xI6XmdOUN0QA@devuan>
References: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>
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
	protocol="application/pgp-signature"; boundary="u7v6rlddpgyvg6z6"
Content-Disposition: inline
In-Reply-To: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>


--u7v6rlddpgyvg6z6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: ben.kuo.tw@proton.me
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man7/epoll.7: Note that an edge-triggered listener
 needs an accept loop
Message-ID: <auc5xI6XmdOUN0QA@devuan>
References: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>
MIME-Version: 1.0
In-Reply-To: <20261015-epoll-et-listener-v1-1-2cc0027b658c@proton.me>

Hi Ben,

> Date: 2026-10-15 21:48:33+0800
> From: Ben Kuo via B4 Relay <devnull+ben.kuo.tw.proton.me@kernel.org>
>
> From: Ben Kuo <ben.kuo.tw@proton.me>
>=20
> The example registers the listening socket as level-triggered and
> calls accept(2) once per event, but doesn't say that this only works
> for a level-triggered listener.  If a reader adds EPOLLET to the
> listening socket in the example, connections are left in the accept
> queue and the server stalls.
>=20
> Tested on Linux 6.12 (Debian 13, arm64) with an echo server whose
> listening socket is registered with EPOLLET, and a client that opens
> 2000 connections at once.  With one accept4(2) call per listener
> event, the client never finishes: ss(8) shows 1420 connections left
> in the accept queue (Recv-Q), while the server stays blocked in
> epoll_wait(2).  With accept4(2) called in a loop until EAGAIN, all
> connections are echoed.
>=20
> Link: <https://github.com/benkuotw/epoll-lab>
> Signed-off-by: Ben Kuo <ben.kuo.tw@proton.me>
> ---

Thanks!  I've applied the patch.


Have a lovely day!
Alex

>  man/man7/epoll.7 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/man/man7/epoll.7 b/man/man7/epoll.7
> index 2628cbb168b499786e495cf3c614fc5e58217295..aff844a568a5cd6d8eb310ed8=
33266a0ccfd0a4d 100644
> --- a/man/man7/epoll.7
> +++ b/man/man7/epoll.7
> @@ -339,6 +339,16 @@ for (;;) {
>  .EE
>  .in
>  .P
> +The listening socket in this example is level-triggered.
> +If it is registered with
> +.BR EPOLLET ,
> +.BR accept (2)
> +must be called in a loop until it fails with
> +.BR EAGAIN :
> +a single event may report several pending connections,
> +and no further event is reported for those still queued
> +until another connection arrives.
> +.P
>  When used as an edge-triggered interface, for performance reasons, it is
>  possible to add the file descriptor inside the
>  .B epoll
>=20
> ---
> base-commit: c6cefe27dd02beaf518bb654493e5f09e62b3225
> change-id: 20261015-epoll-et-listener-c9873cce62bc
>=20
> Best regards,
> --=20
> Ben Kuo <ben.kuo.tw@proton.me>
>=20
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--u7v6rlddpgyvg6z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrnOdYACgkQ64mZXMKQ
wql4Dg//XEaMYuRKyMK/uHY2enNZ384sGkcZASFQ0HoyOIbDHNZth++WLZ4A7AuV
8EexmjWKnAJ9YEum75hvScq8PtZdmQR97TkskM9fNXU0thZb4+fdZ+uH8G01SlXI
9bT7kGC9PMT3ZFazypk6gZ3zsnVHp/H06pgP8MiTEhpkznAcRWV76H1tZDl3dnMJ
fPr3s3bI7lLhsNdB2vUB1NGwMDbnoO1tXMwRa1faHNxKGKF8X+k+2gQyQUkhvFmK
O1sF+UoWHEcBwPKDGBBFkTT9DQZ7UbY4n0ubk/11Jy13tnS11eXCVWOTn9LvbZa3
xL57AWa/exsbZTmOgL6KVMmLKZ5KVvlV9JcT8ErKgYVqb3KmuxylA7yhWZveDUSh
ceAkieuDxdvYo/lMKLGrwSDkWkAt7kBmpzlC8IyTTKmxhrcN+KwGo6z9A7EkvOGZ
90+Ec77Mwk2cfF4wXzvT1lxCMKdzj4SLB133KB/k/XpGrsKYCux+BoTZd7b6biVl
rHD18SXTJASz4QlDyCmVhM+oimNe1yJJagQ9q26KnROm/LQLlpzMpd/5lwkBahqe
bU8xsR/jvfaXMz+f/5aAeM3ZM9MFsLQdW4cyVkbHXqaNf+4nOhGlEnhOjR8M3toW
LOmUKmZZXUWs6XyGtC2r9uSH/s+JBHONkHMnIZVSF/hz4a7TmBc=
=Y65H
-----END PGP SIGNATURE-----

--u7v6rlddpgyvg6z6--
