Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049858;
	b=uTaG7ojZ7Ih7uEE+bhw9if13W0Hk5KXx3K5GVy7a2sMO78I39PMixG+E1RpNapWKa+Wf
	 Kk85pQAXjU4csT4m6m3WqWCcZjlJ6m1QVU9BWhk0Nf8jT+PNmTp29UHddE8pFMhshiL4l
	 E2kV09QF3D8TSDMiwhBfhrkBEnHg0+pmjd/cX/xWn3+TeF9Zs95J492M53V1jP1HEV5Q4
	 0LNFjkk1NEIZNs79FCOnOVJGOH1h0oOfT9NiYvJA3cqe8Jnwvoyx4LsHN2MxG5iOYD2XF
	 wMs8m4TTCKNPtv5LvtktFjfwE6gx/lcRQV4oB1Rx6Ud7kxd6w0vcFs4WHn9AD0d5uLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049858;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DtMUSLo3hQ7FhR72td+8DsDi60YfRAZfp25DFOx9+xk=;
	b=0IrgglzG8pLcNXn5Jwt/OmQxcdC+dF+oYpY9TMFTe/HfxwuK9JsC6G5qcookiC+8pVKW
	 lYEfOs5zXA4saQN0OYuDZdJPmx0aO7Xl1fd15B/Q1JGCl89Lt5eok4vp/rr4sLHOdm6YP
	 AlS9riR8P1ns0LF0DpwrWAwwTDm8AJ2QgVpr+KbRLg5T70sjm1MBknST9Dk55KhQrP3oV
	 aKPixwcEGL4O7Cqhct1uF3nhqi9GhcmG25FQwwkATE/dMJ0Q157+pL1Cqs6eb83g6lYPK
	 uFpm9wu3BlgC7AolbZ9KoB4pgGcOgE7efUGih32Zol897Ut8VVsM7fkNUJIVp69ediA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPmvQvTw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF6606A326
	for <linux-man@vger.kernel.org>; Sat,  7 Nov 2026 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fPmvQvTw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F361F0089F;
	Sat,  7 Nov 2026 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049858;
	bh=DtMUSLo3hQ7FhR72td+8DsDi60YfRAZfp25DFOx9+xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fPmvQvTwSa4s89K9nP0YL0Jh+ZQDovDKpEDrwwbMWJ3dtjvpaJhqupCD+TdOCblbC
	 bAtn+6cLdc/+Dr7qI2yVxOTpGgVh5bc8xpg3GxwBtIwBIt7fhos/Z5f1ql2Md7jR+B
	 f7ZZ88NffnhZqV6FXUu1mBpuhu3doomITGGe5wi5OZEapm05U2K3Ps0B2pLqkg3MFV
	 qQ4ch4rdH7qHhjZ4M1JGqRbbsK65N2Fwqk4BZP73+cZUq6zXaI0y33sYNbE7pxuNBR
	 m9zGQjI9StPcgQQdbei0DZ0KGN6hk4oAY33ectkmOcn2UDbI4VFhfdaxe+zclxZbHd
	 ez8ouW6GkV3Fw==
Date: Sat, 7 Nov 2026 12:10:42 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/2] man/man2/landlock_add_rule.2: Clarify ephemeral
 port range
Message-ID: <au8HDJGnqLOAXu4_@debian>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261106.4250707004c3@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="r2dwvv2ka774yizw"
Content-Disposition: inline
In-Reply-To: <20261106.4250707004c3@gnoack.org>


--r2dwvv2ka774yizw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Matthieu Buffet <matthieu@buffet.re>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, linux-man@vger.kernel.org
Subject: Re: [PATCH v2 1/2] man/man2/landlock_add_rule.2: Clarify ephemeral
 port range
Message-ID: <au8HDJGnqLOAXu4_@debian>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261106.4250707004c3@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261106.4250707004c3@gnoack.org>

Hi!

> Date: 2026-11-06 22:24:11+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> On Tue, Nov 03, 2026 at 12:39:31AM +0100, Matthieu Buffet wrote:
> > Clarify that ephemeral port range can differ from system to system, and
> > that an application can choose exactly which ephemeral port will be
> > chosen next (as long as it is within the kernel-wide
> > ip_local_port_range).
> >=20
> > Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
> > ---
> >  man/man2/landlock_add_rule.2 | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
> > index 94bc63068935..253498bfa2cf 100644
> > --- a/man/man2/landlock_add_rule.2
> > +++ b/man/man2/landlock_add_rule.2
> > @@ -109,9 +109,13 @@ is the network port in host endianness.
> >  It should be noted that port 0 passed to
> >  .BR bind (2)
> >  will bind to an available port from the ephemeral port range.
> > -This can be configured in the
> > +The range is configured globally in the
> >  .I /proc/sys/net/ipv4/ip_local_port_range
> > -sysctl (also used for IPv6).
> > +sysctl (also used for IPv6),
> > +and can be further restricted per socket using
> > +.BR setsockopt (2)
> > +with
> > +.BR IP_LOCAL_PORT_RANGE (2const).
> >  .IP
> >  A Landlock rule with port 0
> >  and the
> >=20
> > base-commit: c189a6b2e4dd2e74f3b360b24e489e27f4e45bad
> > --=20
> > 2.47.3
> >=20
>=20
> Reviewed-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
>=20
> I think Micka=C3=ABl's Reviewed-by from [1] should also count since you
> addressed the grammar nit from [2].

Thanks!  I've applied the patch with both Reviewed-by tags.


Have a lovely day!
Alex

>=20
> The high level remark from [2] still stands, please don't forget to
> ideally update the kernel documentation in line with these changes, so
> that it uses the same wording on both sides.
>=20
> Thanks,
> =E2=80=93G=C3=BCnther
>=20
> [1] https://lore.kernel.org/all/20260929.hooQuaaf9An5@digikod.net/
> [2] https://lore.kernel.org/all/20260926.6c13f561a21f@gnoack.org/

--=20
<https://www.alejandro-colomar.es>

--r2dwvv2ka774yizw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrvBzEACgkQ64mZXMKQ
wqm1PRAAiEBTxKcthCV+2dq8DptbE5gvY2YAmnZkapRHXVxGc7DmSJrRu6PgqtU/
83Jn4Xe4I0qsElv9g/Mxt4faFKYPR/0PgBMxhzpGIfQYV+IZbLIzuDaosRcL+Ynp
O1f8zYzfjBLrPCD7UHKVRAy+T74Y9KxjOu1gzBfZeiXmuYap8Qs4/b0l5XldFG04
sKGgg6YHyzesAp5fkK0BK15a7Yw5J7xQB2ssg78M37mVgrRnQALsrlfvpo4AbuuC
taeD66WPOTRB/zmWIFi4ODxvokIzt/i4hx5mBpeAOkLgTyOG8MkPoOaj0qFwCebZ
6C555K5bvXficNL2i6GNf9Z4VPJ3qc8usWaqEBwUIDXSxzszryJYBwNujkJM05Dj
7sLOGYfFDdSl/pWuZhAL20YvMOilaJB4g9XqugzWLuco8+DPR0wlybew/e61q2nV
fxOKrf0MVjgZhPqFg3pkU1GiFo/ISaJgmdBjdo15sElnKUETfgWDalG7PY0Olpnq
Xz5GaaGbwkUW/ukJzWiX6P2Gipip2MRH2Y4MZYodV3Oj9j0PXpz1t070WZaSl2Xm
lneUCoGb366dEdWX1OgoWZianhSTkIQz4P5voNfg0LeSkcMv7eOtZAE7YpS163IZ
J7t4dU0emoryrPyLsWyiRbBYv9gSf15dT3RMwdtEL0YTT5vbHKA=
=GU5f
-----END PGP SIGNATURE-----

--r2dwvv2ka774yizw--
