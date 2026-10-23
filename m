Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791256;
	b=2Ez6P0Y3ccpJiO0APMGI+tugiVSdaBwrxqLUmbJsb/Jd9S8jddZvkU54iWmv5ZQdmIvQ
	 1iIC52pqRCJI5aMbu2FYCiF67npeF515jQLYqSLgHf5F5T6jF0Oyev98njiTAcr5NtplQ
	 K/0fy7rtU0jFAGyd7rrRyBk1YTS8aeGMy+SyDW+nKFgNJlc/H/Y/rN3Ps9qjzSPZN6vei
	 Xzk3hqPWeRVpmXS5VMxauUDH1a4sEJVSkmGj5m8EQdVWU9SqQviRzY5fhqB6oQ9iX+p28
	 zvYBKJSkyAGNbAQM/1wtQ7gDccJH7Bavfhegzyk8uZjQyNVAvjo72ljVgZ5S4c1I3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=6LioklxZeABrQAXf3kbgcx1kuNvup4gzzJznQaY1png=;
	b=dGdg/7Le/qv/ak/OrU61hAes/+Ac24pm0PobZToJq/J1vBh8rZ7WSB5SAnmA4oVGOKzS
	 DiLGCPgh3wcnRMRb0NtoP/Svfo1w7bRbNMRqxk9bSZVyxSRJRL3ncZGEqFwJxGvLlGj5c
	 UM6leARfIkliwynhbORzN+J2dai+x4Qr5ZEE4Xj0L/eF1JTXyhUmTPpybahprtOho74vN
	 n1I7P6hPGk9mBqEYZ7xAfu+XRFX9ZSRLthhKj4xFbvjrJBDxaq/t31rE64MqJQkcha3FT
	 VskBzV00dSQDpOVphTMgHb18PkrkELrThKDm9Ogcq1QO5HNnT8sYVhSnwU9LSOu6vBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3QfEoWK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC06606A31A
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z3QfEoWK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5A91F01828;
	Fri, 23 Oct 2026 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792791255;
	bh=6LioklxZeABrQAXf3kbgcx1kuNvup4gzzJznQaY1png=;
	h=Date:From:To:Cc:Subject;
	b=Z3QfEoWKcPQGcT0HujZAkBOaiv3IxTEvKnyOy869aiPV0Sb+XqL1P0Ihq1L+SRxQO
	 58Ej4xCQRdAexgDQzKnl4c0X5k8oqaC+LtC3B8BHl/NwBMgSaKLcNwHFLVXJGXE2rV
	 uHyI55LrezqQ0ar9JneDisO1XdQL8irzkIodlAFo2AIrFcyLm1YYv4jf91Of5ZYj3N
	 JqtcQBOP6jLgBUs37Vl8IH1I35npisXivuRw3z8RrCdnVLXsZM+XZXT59mkcQGTpQR
	 om3SFSdHaPHcY7WJqn70e2QLpvvhxJyoRLgnpE+nYC7VKJIKCZJtxLjfftpYNo8nz6
	 1lopmkT9zr5tg==
Date: Fri, 23 Oct 2026 23:34:03 +0200
From: Alejandro Colomar <alx+gcc@kernel.org>
To: gcc@gcc.gnu.org
Cc: Mark Harris <mark.hsj@gmail.com>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, 
	Guillem Jover <guillem@hadrons.org>, g.branden.robinson@gmail.com, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>, linux-man@vger.kernel.org
Subject: -Wshadow=retroactive-parameter
Message-ID: <atvQDqWEqDAERpY5@debian>
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
	protocol="application/pgp-signature"; boundary="t3whwoicy3bbveju"
Content-Disposition: inline


--t3whwoicy3bbveju
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+gcc@kernel.org>
To: gcc@gcc.gnu.org
Cc: Mark Harris <mark.hsj@gmail.com>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <josmyers@redhat.com>, Martin Uecker <uecker@tugraz.at>, 
	Guillem Jover <guillem@hadrons.org>, g.branden.robinson@gmail.com, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>, linux-man@vger.kernel.org
Subject: -Wshadow=retroactive-parameter
Message-ID: <atvQDqWEqDAERpY5@debian>
MIME-Version: 1.0

Hi!

I'm worried about some proposal going on in the C Committee at the
moment, and which I've also received for the manual pages.

Some people would like manual pages to use retroactive declarations of
parameters.  I fear that would cause all kinds of bugs if programmers
see that syntax and believe it's valid and has the intuitive meaning,
but then compile it and get behavior that might not be what they want.

In particular, I'm worried that this might happen rather often in the
near future:

	alx@debian:~/tmp$ cat param.c=20
	int
	main(void)
	{
		int n =3D 42;

		int f(char a[n], int n)
		{
			return _Countof(a);
		}

		char s[] =3D "foo";

		return f(s, _Countof(s));
	}
	alx@debian:~/tmp$ /opt/local/gnu/gcc/cap/bin/gcc -Wall -Wextra param.c=20
	param.c: In function =E2=80=98f=E2=80=99:
	param.c:6:30: warning: unused parameter =E2=80=98n=E2=80=99 [-Wunused-para=
meter]
	    6 |         int f(char a[n], int n)
	      |                          ~~~~^
	alx@debian:~/tmp$ ./a.out; echo $?
	42

I would be interested in having a new subflag
-Wshadow=3Dretroactive-parameter, which triggers when a parameter is
shadowing a previous variable and that variable has been used previously
in the same parameter declaration list in which the shadowing parameter
is being declared (but before the shadowing occurs).

This should be part of -Wextra (at least), as it's rather dangerous, and
shouldn't break any existing code (if it triggers, the code is likely
bad).

This would remove my concerns about it.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--t3whwoicy3bbveju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrb0sQACgkQ64mZXMKQ
wqn3AQ//RYpIh5eUGLkTTkzDX6bbfNpl9k81LKQUB5ukOVSvaYCdS8W4yWQbCNfd
tjqiZm7h0UQ8iuEmhzswgCg6qTmsCehYiXQ8kQNri+0IsST+lfOWuw60e1xl+YhP
KgXTTfsw4gleEbr1i6g8jjL6lcT5aBROzc7EFrCj9OZtE+d5E6gBGFnYAl8pgyHz
kZ2/VxIcY18EU4kA7j9Txx1RHodARSQxaA80vjS2upBSCi/xcbkWJh+AWIJ9kfVW
1qkTrG2t4gTchbgJaRE8jSfq4/45xjci2uN/iOA7WFUJ9cavqXjtRekb5zDIxeZv
FA5VxE4fKeoZBlYTSc3/Ks/dWiesIwrxa5h60+b2C83tmTAeeEVxG+JYM4RIonZu
3QNqcToydc9w9LPaL3ep2UwvcxgvHlbJBHLutOWTmWhX1oNTrqcU3D7yj333nzWr
Te0vOKTyBQzBWBEneraab42fej+1L/84+2M4eoWf79b/i40aY0k/FkRziJjHiWQE
23jm88+vczGaxKlDTeaVxn6G2re6U+eOp9h3zUfDxqrMsFsl3MIBn19gZbcVObHP
HUuG5ggjNWA8vJ7O9ZHhOyqT+mvXaSu/242uyBmSXCl5MxUo1Ncz0f4bRJk5PpSw
/zf/KqAAZ2f9m7FupY5Z9fua3qOzIKc72+6Q+n/ad05XUwPXJS4=
=3g6O
-----END PGP SIGNATURE-----

--t3whwoicy3bbveju--
