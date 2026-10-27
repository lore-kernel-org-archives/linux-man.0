Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098791;
	b=NJlx/auhr7WnOuyiOaJzkC3Fh0ed1Gf1PKANNz8j9uEuh0sFUKlgFlxybWVn+ZP/1DSG
	 abpFYPFipDUQNWTtU6CAaXQVSYoL8z8WQkhJKiYiXZkPwEwd8nAzphhb8pe2faGX08iin
	 wq+8kPwSvJvk/1uopWgK6U+aBEsYoZ2/o4zfPx7P+SAXtj2NDwMd9m6VrOezZ9dJsF/bT
	 abFXw4S7VV55xCp9iE5hHisYJmGISvXYv2lsMdP7zWUOw2dPD5rDNZ+bt0KbEkXVQb+Ov
	 eRzbGfGrfDQ4Jsz964Xbi8Us5PWwiIBOmXOdwUzST1ZS4D31EwwhaZFaw2JkDUxDMsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098791;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1ROHMGp/FKdoMHqZw2gdeBZjIkDj24pDcrqeUuKX7Tc=;
	b=qAhCK5ZR0QsSt6rrZTsyMqXJSzJaGyUrG/+ppQqec4SDdrAUblfVTJhAZPZatysw3d+i
	 Ky61w90FnF47aT2Z/AoZY6gHhg7y0bw+lHRJNYSkeOfm9wwM8dGPJLouEUlQ2+EenXhus
	 1Sr1LkLiQx6ERi0wFGYUJ5qlTTkAaVgExkN24fYsdYmsSrew7Gu7UL/Jshdyz9BL+4LPk
	 jdXi1sV6TnVHQRpuwbrlyQSHDv0NVYTMyJXr4Uvj1BlCmyOhG7O6K32MKhVefOoIi5cnr
	 A2zgx8/3NPQQ8hagHq7DD9mwBGUKCm0ohsVnIZuwhBAsOr60fumUNtxUwbelDQZJIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abdvlfZ3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA2606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abdvlfZ3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3F51F01825;
	Tue, 27 Oct 2026 10:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098790;
	bh=1ROHMGp/FKdoMHqZw2gdeBZjIkDj24pDcrqeUuKX7Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=abdvlfZ3jtOvHZCNeoM7k1ZXY/SsJQ009GGM4r2yPjTFpTFqDcrF/xG9C/j1+IAW9
	 eHDoaVcxtISHbzmzGzlwMmQpkxLkQPwzp2BlNWpK78G38VJ8B8xXybnCm1hOH5ZJlg
	 Y889UQpDLWv+pmwT2CF6GKE5XxSsfdBWN23qB3Lwawyz/NIOFknFo/CiTeQygWYBQj
	 CgxfqmXAp/hOYFLFP4VmYuYsqs+oqklBM1t4vjYa1A+Cz0Yn9YRB5LBWEg+4dlIMSu
	 CaaBtk5kGGgjbTN3OhQq4TXtEy/Css8iWBs92zgPFzIxK0gPabBkIe42ZMfg5VPnJE
	 HVIXhQNVHPjeQ==
Date: Tue, 27 Oct 2026 11:59:47 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Aaron Rainbolt <arraybolt3@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: PR_SET_NO_NEW_PRIVS still in need of three trailing 0L arguments?
Message-ID: <auCDlqzrGbvj49hm@devuan>
References: <20261027003229.158e4f7b@gmail.com>
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
	protocol="application/pgp-signature"; boundary="kehbegtfwszkgnqo"
Content-Disposition: inline
In-Reply-To: <20261027003229.158e4f7b@gmail.com>


--kehbegtfwszkgnqo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Aaron Rainbolt <arraybolt3@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: PR_SET_NO_NEW_PRIVS still in need of three trailing 0L arguments?
Message-ID: <auCDlqzrGbvj49hm@devuan>
References: <20261027003229.158e4f7b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261027003229.158e4f7b@gmail.com>

Hi Aaron,

> Date: 2026-10-27 00:32:29-0400
> From: Aaron Rainbolt <arraybolt3@gmail.com>
>
> At one point, prctl always required five arguments. At some point
> thereafter, it became a variadic function. Some of the PR_*(2const) man
> pages recognize it as a variadic function, such as
> PR_SET_DUMPABLE(2const), which states that you can use something like
> `prctl(PR_SET_DUMPABLE, 1L);` without problems. On the other hand,
> PR_SET_NO_NEW_PRIVS(2const) documents the only allowable method of use
> as `prctl(PR_SET_NO_NEW_PRIVS, 1L, 0L, 0L, 0L);`, which looks like the
> non-variadic form is still being assumed.
>=20
> Is there some historical reason that three trailing 0L arguments must
> or at least should be passed?

The kernel just behaves that way:

	alx@devuan:~/src/linux/linux/master$ grepc prctl . | sed -n /PR_SET_DUMPAB=
LE/,/\\bcase\\b/p;
		case PR_SET_DUMPABLE:
			if (arg2 !=3D TASK_DUMPABLE_OFF && arg2 !=3D TASK_DUMPABLE_OWNER) {
				error =3D -EINVAL;
				break;
			}
			task_exec_state_set_dumpable(arg2);
			break;

		case PR_SET_UNALIGN:
	alx@devuan:~/src/linux/linux/master$ grepc prctl . | sed -n /PR_SET_NO_NEW=
_PRIVS/,/\\bcase\\b/p;
		case PR_SET_NO_NEW_PRIVS:
			if (arg2 !=3D 1 || arg3 || arg4 || arg5)
				return -EINVAL;

			task_set_no_new_privs(current);
			break;
		case PR_GET_NO_NEW_PRIVS:

I don't know why it behaves differently for those, though.  Maybe those
conditions could be relaxed.

If you're interested in it, I suggest CCing the relevant kernel
maintainers in this discussion, and asking them whether they're okay
lifting those requirements.


Have a lovely day!
Alex

> Or is the manpage simply out of date? I'd
> be happy to send patches for this and other prctl functions that are
> mistakenly non-variadic if there is a need to. If there is a historical
> reason to pass three trailing 0L arguments, maybe that reason could be
> documented.
>=20
> Thanks for your time,
>=20
> --
> Aaron



--=20
<https://www.alejandro-colomar.es>

--kehbegtfwszkgnqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrghB0ACgkQ64mZXMKQ
wqm/VhAAlo4KcVtv9KaxHPn3ZuTEDKz5Ko81OjelXRoF5Q+qbA5gcDNjnTU9gxoP
bRNntxUcKLSNWoAxLz3Vqr7+xuR3gF2+CZDKq8HWD7woFD4PJ2YQfS7hNf7Ejsbh
ptzRLYW12UDPsGO7P2r7MCqnUIeCDuUYaN1vnNUNoGChQPP1SA37nZfQi2Zq+3QH
JvQyU8ZHYKCNSvcHHMWpBLeQieKLVx1rHSlx7TB1Os2btAbpi1obKh0uo87Pn7Et
Ab3ZAZ9Lj+uBe9F+dRh0bXJoCYdSQaBJeq3vPJpkH1dt+N27HLoG8eAY9AI78ilC
Y71Pu7rCtW/Uc9rO29rBBX2S1iiXDAhTSncPFKlFgcqlvygtPHjc3gzrkj0EeXS9
nSdQo2KeRX61xftHkv4/pgk1W5txnbK/9pSQnaojr55jNMYIvnJ2ie1LJYS8upHm
SEN1TioVlKtSajG0TJov29qll+Rt2gii0829xu/UFRyaF4qLsVwiYF1gltqsmRFC
bFncKEibIaWBjyUSy8mor7/vw0ULsRLDwki4xENOa2OEXv6rrjDCsSox1fSqaaST
rvP+uC4N+Fh/a7JvPAaBK4rZ64Yi1r8ESPyNVOjB7L6ms1XDrP1yM8Rfhovu9YYP
DFIJgzGxHHelRR5GtxZdjvGGhe1Qjs9Z7xJQIgr07zlPWLWjt/I=
=fZrE
-----END PGP SIGNATURE-----

--kehbegtfwszkgnqo--
