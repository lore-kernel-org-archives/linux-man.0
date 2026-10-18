Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D506392C20
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321100; cv=none; b=VA4CHLgKrweMlSUTqrfU2jZRBxnaS/w/rXNk/0tmYEWs6WaOm5LBdr9Iz4iO/NQq898TVihJ4jfokLl+3Tn58WoxiF6sNH5ssZGcqDPk/n+7Exx4GUHtV0DcHxF/TPKxGjR3KqEiAqUhwizwPHqk3Ch3LTtoe6ikJn5E6FfKpjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321100; c=relaxed/simple;
	bh=n7rs0P4i6BIWIn3rZNU3+4h0xznQ/qTQrPEcJKYcmxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luDy3Hcu109xQYOVE8IlrmdArAhGW7eptec1aTBQAlZkq2i4lLhJ+mWBHgA43ip6Drgtr2buz+ggAxjCXnw+UVX+WiF7u+D6mzO2q7RRdn5K8xf2rOrL5IINurjm0HtlhubYXEOVXLw5dlrOJl4h0I+UcR93wiVnExaDfQmVSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdP9YYwB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdP9YYwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D101F000C4;
	Sun, 18 Oct 2026 10:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792321099;
	bh=uXuTC+Nb7tpOBluNWr2A8/SCMr3DLkGiNpliYPqR0t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jdP9YYwBzFT+v3Coz6ns9nQ1e+m6BzOghQA00dSvm/FWn5PbjXlcX0cTxYxHMCU/w
	 rxGq2MiFDg1LKT80hHt1fN0oA2k/VmB1DJtKTRahUzWZ8luHhBjA0Aler+c1vgF2zV
	 Puxqvxf+l7bNtP+sTMHXOLpGRqGCBZ4G8VqoYBrKSvyk0PeIKd21nkzI8AeacuTRvO
	 lDEqj/slTzKuK72Ddw01twyf3L+xk/Ck+zmGGla0fa+zQlmycPyUJrbF0oCNcGqA19
	 cGlDn9OG0MHMnScZX7ryqHxWi4m6hyGsHTvyg4FIMlR+2GlppElKVzCd7SX3Xmufgy
	 /Rqk6hTC+ADgw==
Date: Sun, 18 Oct 2026 12:55:25 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a
 level, not a family
Message-ID: <atSlhESwogAqWEmk@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-3-gnoack3000@gmail.com>
 <atSkB9UmUd7mWOXU@debian>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qfyi6k2y4xfy2jar"
Content-Disposition: inline
In-Reply-To: <atSkB9UmUd7mWOXU@debian>


--qfyi6k2y4xfy2jar
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 02/24] man/man7/unix.7: Socket options: SOL_SOCKET is a
 level, not a family
Message-ID: <atSlhESwogAqWEmk@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-3-gnoack3000@gmail.com>
 <atSkB9UmUd7mWOXU@debian>
MIME-Version: 1.0
In-Reply-To: <atSkB9UmUd7mWOXU@debian>

> Date: 2026-10-18 12:49:18+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> > Date: 2026-10-16 19:31:17+0200
> > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> >
> > SOL_SOCKET is passed as the "level" argument of getsockopt(2) and
> > setsockopt(2); it is not a socket family.  See setsockopt(2).
> >=20
> > Assisted-by: LLM
> > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > ---
>=20
> Reviewed-by: Alejandro Colomar <alx@kernel.org>

and

Fixes: 9d1fd1157306 (1999-06-15, 2022-12-19; "man-pages 1.24")

>=20
> >=20
> > Notes:
> >     Obvious terminology confusion, compare getsockopt(2)

Agree.


Cheers,
Alex

> >=20
> >  man/man7/unix.7 | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 75e125c61673..1a94b00c6783 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -271,7 +271,7 @@ and read with
> >  .BR getsockopt (2)
> >  by specifying
> >  .B SOL_SOCKET
> > -as the socket family.
> > +as the level.
> >  .TP
> >  .B SO_PASSCRED
> >  Enabling this socket option causes receipt of the credentials of
> > --=20
> > 2.56.0
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es>



--=20
<https://www.alejandro-colomar.es>

--qfyi6k2y4xfy2jar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUpZwACgkQ64mZXMKQ
wql4gA//fkg//nBBf7iyAucv++Vz+8+C/O3sSORPXQA/limpZWb5ac6JVHX08jSr
odFA9D4ug0QQV1ry7t6nhoWh5F7BVQg9Ek5NoMv7RtJPjfpppHIDpuuI6VLU1Uam
bo5VzJP3wVitqiYCbahlMrdTJUKIQUItNgRpK0xp7l6TR+06F28X+lDJC/VKmm0k
JC8MNgyN3q10Xt1BA07wXVr0FrGb3RzLMWHMI/zsuM8RnwLUSLFabK1JqeglPG4I
ME4G0VwbzUa/Kjwu5MJCxsX7/zcaPUgxygH0l7//L0LEFT9jwlZev7rKofIQEoEe
+1SLbtJltjC+e3uECouuHRKFULHOl+g9kVdBO83MRsMDvM208HC51yUnsoSVWQOv
80lnWhjG7COHhamm3117wMpYAb6YfHOzICvyP2pC4fRTiiizBzD8vndnf90nQXFK
Bblp+ls108piDgixMQlh/QB1nE645X++icyuN0/tA0Vo0QMrOvZy3wRqI1cAieWL
hcRN5AnIcmwoRFODSCcOTI2v4SyjPvdioJ4oCJOBr+0vJDQw/gpGC/EV/t/tjm/3
iRn4mVbeUPWWFkI/88u77o+AqBpS31+4z3VaArxZK5/BsIi/nWYIduwLVsT2w9nT
OYykC0gOFsvoL2c3gJ7SOWyU1440opCO+wErZ1u9FC0sLwt1cFk=
=53fG
-----END PGP SIGNATURE-----

--qfyi6k2y4xfy2jar--
