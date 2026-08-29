Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3860735E1A2
	for <linux-man@vger.kernel.org>; Sat, 29 Aug 2026 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787993583; cv=none; b=fnWaG794HyrYKCTN7SIEnkyOR+hfdYoTU7/E4SOvHDBk4VIFwK7XkQQw1DsZL0UHO3jsvzAZfP51cFhn2uUqERhm0GNQQV1O4IJz4zZi2fjZD/wErKDVjN2XZHsS50TCGLZ1QGVR5kUVZCsKcaAkOrQrQf76dImuReXaelVeOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787993583; c=relaxed/simple;
	bh=qoRXv0h522+XNvjkJmrfsT/b3BeL0IuIgI7c/NxrBBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2ZPf1BwaRcU6dhEfrsP7RLzhYZ8AzGzL6EU2MOMfy9TF0ylbiOUc2eD/Ynvi7lU+FKCvbTBor96mHiISy7jQrE0NnP1Viydhuo6+a3WLscCoIuI+ByQAi0PQc9Tn87Fmk0ehxo7boq68/Ut3HiV+OtY1+LP0n8+aLT9vxrGtMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUpiycux; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUpiycux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BE531F000E9;
	Sat, 29 Aug 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787993582;
	bh=MsivNDw4Zk31RfrxmOdpn1KXMh6z76j8J8zf/QbMcfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AUpiycuxdinU7gABT4qBD7mrQXJgcffqyfDkcBim5wckCx0s7IB72U0J90b5JKHGB
	 H2JFqiw8Dgxr9lzUFQJwLoFoZEjetoeMmz+UMqbrEpwBGVZcvXH5yR6I2JjFBoLHOK
	 WSVRt8c3xVxUOco7vR4HDdF5o5G0iUlAHCV9+VAC6ybQRpCHbdJFVwa3GazLwImPbh
	 vTU47Pn6nnujsTkPMU0P7Z6eCqOzcmSVxsec8Gml0oEXLRfVU8ZkHAxsElXWYJDFlb
	 zj0JCGEi6Kch1g75yu4g30lY0bXmQ9TkCWlzxZWyN/Wn9uwTJPvEPPi4T1vx9Vin5B
	 JCVuP9kPm2+7w==
Date: Sat, 29 Aug 2026 10:52:58 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKdoCfK_tYf5wX8@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
 <apKcB5bwhYRoZdR4@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhpmzdkkotkpmdtk"
Content-Disposition: inline
In-Reply-To: <apKcB5bwhYRoZdR4@devuan>


--rhpmzdkkotkpmdtk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Larry Kollar <larry.kollar@icloud.com>
Cc: Groff <groff@gnu.org>, linux-man@vger.kernel.org
Subject: Re: Using LS/LE (was: [PATCH v4 2/4] man/man5/tunables.conf:
 Document system-wide tunables config)
Message-ID: <apKdoCfK_tYf5wX8@devuan>
References: <aorlBv8YTu4JlZcy@devuan>
 <20260823132749.pgypzsqv32n67wor@illithid>
 <aor4LIdGrSGHe3TB@devuan>
 <20260823141622.7vszwghxrxvkff4j@illithid>
 <aosHFaauEzKEFNpl@devuan>
 <20260823164451.5jeolmdu44ubpeba@illithid>
 <aotFzewQhmLJSk6N@devuan>
 <8DE76435-CBDB-42D6-9E0F-9E27291560B6@icloud.com>
 <apKYVACSvXx2pcGw@devuan>
 <apKcB5bwhYRoZdR4@devuan>
MIME-Version: 1.0
In-Reply-To: <apKcB5bwhYRoZdR4@devuan>

> Date: 2026-08-29 10:45:34+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-08-29 10:42:14+0200
> > From: Alejandro Colomar <alx@kernel.org>
> >
> > Hi Larry,
> >=20
> > > Date: 2026-08-28 22:50:50-0400
> > > From: Larry Kollar <larry.kollar@icloud.com>
> > >
> > >=20
> > > Alejandro Colomar <alx@kernel.org> wrote:
> > >=20
> > > > I believe that a set of makefiles that would handle all of the targ=
ets
> > > > of a project like groff wouldn't take much more than that.  It migh=
t be
> > > > a few hundred kB.  If it's well organized, it can be maintainable.
> > > >=20
> > > > Because the makefile language is so simple, bugs are easy to spot a=
nd
> > > > fix, compared to autotools (possibly automake, but I can't distingu=
ish
> > > > them enough).
> > >=20
> > > I don=E2=80=99t know. Can a Makefile check for the presence of certai=
n libraries
> > > or other apps and fail gracefully (by which I mean exiting with a mes=
sage
> > > like =E2=80=9CYou need app X, plus libraries Y and Z, installed to su=
ccessfully
> > > compile this.=E2=80=9D)? That=E2=80=99s one of the things that =E2=80=
=9Cmakes" me appreciate taking
> > > that extra step of typing `.configure` before make.
> >=20
> > Yes, it can.  Here's a trivial test for that:
> >=20
> > 	alx@devuan:~/tmp/testlib$ cat Makefile=20
> > 	HAS_LIBFOO :=3D $(shell find /usr/include/foo.h >/dev/null && echo yes=
 || echo no)

You can also trivially test with gcc(1) instead of find(1):

	$ echo '#include <foo.h>' | gcc -x c -E >/dev/null 2>&1 && echo yes || ech=
o no
	no

If you put that expression within $(shell ...), you can use it similarly.


Cheers,
alex

> >=20
> > 	ifeq ($(HAS_LIBFOO),no)
> > 	  $(error You need library FOO installed to successfully compile this.)
>=20
> Oh, I didn't need the period here...
>=20
> > 	endif
> >=20
> > 	all:
> > 		echo Done
> > 	alx@devuan:~/tmp/testlib$ make
> > 	find: =E2=80=98/usr/include/foo.h=E2=80=99: No such file or directory
> > 	Makefile:4: *** You need library FOO installed to successfully compile=
 this..  Stop.
>=20
> ... make(1) already appended one here.
>=20
> :)
>=20
> >=20
> > You may of course write more complex tests if you need.  Anything that
> > you can do with a shell script, you can do it with a Makefile.
> >=20
> > That said, I personally prefer to fail compilation due to missing header
> > files.  It's simpler, and there's not much difference.  After all, if
> > compilation fails for <foo.h>, it's trivial to run
> >=20
> > 	$ apt-file find /include/foo.h
> >=20
> > But if you want the test, you can have it.
> >=20
> >=20
> > Have a lovely day!
> > Alex
> >=20
> > --=20
> > <https://www.alejandro-colomar.es>
>=20
>=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--rhpmzdkkotkpmdtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqSneoACgkQ64mZXMKQ
wqnynQ/+JTlU6kkToYbq5Tza/EH3gJzgFY+XwuwpOG+0cuDIUnt13RnSd5s7eD96
J7wF5XKUlF97j7IoLa1HaWsSz+Rl/0NaFL7QL9d/XLeJb2q8dJjiUlDcYCbzvMTx
PyKOLu+n6teevJeLqVpQ+iN6cTKPLAkY1Dm02Ewr+APcjJnwvIaizpLX1P8Q+Nzy
ERJxyRhLjwsUdZYPF9auzQXJnULFG1lb34dotCPgCyHqtVXf5HvRriy+njqOw1da
XDQPvuJy+lVOj2j4mTuFEfWPIDbxxBZ+BDIRbE7dM1g480Xh7pZiSrdAWByCSrBr
LpXf603siG6u1xSeKaz17s3+ngTS78dvsqPpK2wgr05F+g61ntZdYltw1f/Pkr0k
CYPq8WcjavIL/wX8GhqPg04soYnr8gA84TpgnUW7o849a1o18G8WSFiZkbpzdZIG
af+Boi8m5GN8y/mGSFeAmbqLV9ZbwAuW6Tx5KmTu8LEmK4TYkKBKu2do2LydzQQA
GDXVItedp8QXCk5VJ5nBxTi+H7sW9Nt/QAnd2p6BfKCJ1/+TpP1kjUOclvLta0qB
QvyWcb4Mq+ykIdQm9IRax3f5GhImcqPTgJ2Q0HeN+tvH+hPBTY6f6k+iiLVGheWf
dipGHZSnBbDSuIqlmh6IbDCZ5P855poGXLjLg5IkTedfhZTcIE0=
=Finb
-----END PGP SIGNATURE-----

--rhpmzdkkotkpmdtk--
