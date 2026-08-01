Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64F376BC6;
	Sat,  1 Aug 2026 21:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785619210; cv=none; b=s8mmKvmrFFsp3NnEzFZcCrz1BUVIsWLxoNeq5h80mB/yfCvIotoM4OUycFh+jlenNTtlEZ0b5da3QlpeiH1Zmm440UEQQ1v+MSrfRSJLz6ht/mZOFPQ2dUnBqGoyykUbDAzlTG5YlBIg3Qcyppt2wzd1soK85pcZ7EahGauac1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785619210; c=relaxed/simple;
	bh=GkcvpQ5M7qgsqzf5v0NofzGCEB+qXYwk8MuU73yTaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcLd4e9KbLPKCu4HpC2DPg+jq3mlH8M+cEg0YYqDtQP/ohbGLk0AtHtR3p+9jUpSt+Ite6xw7i26sOXF9F7nwZJ86KzEE5uCVKAGysxMDQcBJanqRuZE6k0PkQNO81K5216UqUnw8w/KqIHzLtx35pT0OP+yw+5H7DU5aB6CJdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuOWsrz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuOWsrz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1771F00AC4;
	Sat,  1 Aug 2026 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785619209;
	bh=Umu6H3lrqS6Trlm12p2sIWDXbeSbCzK2/CAFILWrvKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FuOWsrz9fQs6tdM6vzpwMHbM+8CuG5CJQK5cQoUiol6nDU1HhSdCTPr042bLTcTGx
	 5BWNEVKlRKy8vkQj3gieqjIyl9nJUcFopY0t7wR1k0gqxrGzVUC07zeMakiFSHPPXc
	 7F0zVK0Ceo3Dnzgb52LFySUmpxh8LPuFlj65Znswxvddm6/BLMsIiyFixOuEBmKyhh
	 6LaqSw7DhasqoXf/bj7V9EyavcgCyQAivEDxijhEwXRqBathrr7PHI/qiuulksimfl
	 SmHcSs/+ihdn5C3zl6K+Ix8gybPfPDEKsQ4tR8ysT3J/AB3MssF3sWuy9f5lc1qq+g
	 uTgD3AivMvXUA==
Date: Sat, 1 Aug 2026 23:20:05 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: man-pages-6.18 released
Message-ID: <am5iwIJ4AuaJNymQ@devuan>
References: <aekjQuAEaq1ILKAa@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47g3ztxnyrjmud2m"
Content-Disposition: inline
In-Reply-To: <aekjQuAEaq1ILKAa@devuan>


--47g3ztxnyrjmud2m
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: man-pages-6.18 released
Message-ID: <am5iwIJ4AuaJNymQ@devuan>
References: <aekjQuAEaq1ILKAa@devuan>
MIME-Version: 1.0
In-Reply-To: <aekjQuAEaq1ILKAa@devuan>

Hi!

> Date: 2026-04-22 22:05:03+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D NEWS =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Not much in this release.  It's actually a quite boring release, which
> is good for packagers.  Nothing they should care about.
>=20
> BTW, distros have started packaging the scripts provided in the previous
> release (Debian and Arch already provide manpages-bin).

I was looking at this, and realized I miswrote the package name.
Arch provides the tools in man-pages-utils, and Debian provides them in
manpages-utils.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--47g3ztxnyrjmud2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuYwQACgkQ64mZXMKQ
wqlmgxAArFcZ/UwISr78mlwP6jJ5sgSPZYHHSmZ1Qfh3WpQjYuiWradeaXiUi+/8
LDr6oK/zVZTpCJENjVjXxKZttnpwywXLrjiDtp677L4QHF8YDzyYh5e4oIH8IoKt
YbVN6MumgeOk/Hj/vaoLdXVWAJjfotqb5a2O13gJS9FdWoHy1p1hDPzpAqRd7AB1
spJg/jvypkNh7RQ7WI5Imm6ijoJzc0aFr2TEepAr6e5oDY7RLvKzUaljcv6MAmpB
3/3lwjXrDFTxOhfpfQ8VCcv1pPMtOF5Vud7FCFOJDmCI2R9rhTwkxwOP1pzuZtcz
QMoh6YyrZ66i0wTtgm4pJVUhq8IMo6A8Tnhdx3IkHqDEF7hmM9GEQMMeDY2vXWxS
T7x3yvPHsGg7Q25NI/gX5iphZNsYaK89wLLXTZZOa7rSDyl8cdnNhCwSbdu3lz4p
WQK0+5RjpFagrRhqLX5ultkbEqnKZMp36a3smwfKpO7HaihwczsA5+dSpOFEbNz6
B8JnBhWjj21Yh/OUabGJzVgdeo/eiAZtYR0IlBED4xA9hS4lLKg5J4h3KLyiL/LI
+a1Mb3QCi9PW4KUjfN+OBW2IUG2Ls/7XCG9quwf1Zsk7ny5O8ICvV8mxuKnpQCul
tOZmG6U73tgsEt3CX4WkLKH84g2kgk9AI7rWbplg88MgnEXRpYk=
=e22S
-----END PGP SIGNATURE-----

--47g3ztxnyrjmud2m--
