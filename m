Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191516;
	b=UB4mFzexi2SAe8rW+q0Mcjlh7d7/0fUn7ns7GcDzAGyksuJMY5Jw+479z2DdUF+/UEe1
	 Ddo/Ro+qXWFHli6dD4nJcDRr13/38igPt4kcv6v4UkQ6/LrFFFrPA2N7kGaKmZFlyuLth
	 Rb+9njoJTTKsVUyhHgwvEa2GhaLH1ICaLZw9srfkzK3VcxQdIoPeXqktv+uZ2dWL11J6p
	 NR9MlP9RR058z6cc98Dn0f1UzyzSNp88jqY3drefAb6ISHeBQWNaWBB5py9avteltrlHn
	 TrZsxJApsXxfLY6lc72ojJPvGcOLleRn2EnlH1qFzyUhwuKOyITHqZvNd9DsE6Mfiaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191516;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EpDZwhyCMGhGYSCInaq7+V/Ib3cfd6gsOtJ+LRdz1yY=;
	b=UTLAbEWqRb/uR6IM8yiQA1XjvU6inBXTduE3/9g5HHjJBFQtOH5LLpGzMJpLq3yIEwqw
	 CEu9BMNWQ0LrkzN2LIHL+J8g591hv5RZs/Pwg99SeA2jhNkJVcSotyZojiq1TIY29bxd7
	 P0tbJsghTQiWAdQ6DmK4PmEqc39TdedfKbfYRq6Nh0PQqLZJHE+uyNxfhjRNWXC2RXI3B
	 twKj359g6T9mxy4/YSv1pUT8rPWlMz1dBbQvAXSU1JFMwQy9zTAXaxITdSxZau2wb7PtT
	 sTyudgL9g0AVTTsh8MJJOoFumEfPK6yIgEZ36ybmZPgWIZeRLS3ZU+qLQnR3y/iB5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpj27uCm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A26606A334
	for <linux-man@vger.kernel.org>; Wed, 28 Oct 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpj27uCm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227701F031E1;
	Wed, 28 Oct 2026 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793191516;
	bh=EpDZwhyCMGhGYSCInaq7+V/Ib3cfd6gsOtJ+LRdz1yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cpj27uCmJqf92lJ9JPIKPpyoT+ATKXXIy8bpvq52Odf5Hv2zIxVAYokqMqKIYefMA
	 iVYt0agB+hoiHQhrMjg/cpKcLHr8sKha7OeQ9U0bLxzL89Xc8Zg03KHXctd1pAHpOZ
	 CCUwMsbRVTlcejhoxUZbg6yBGJSUwjh6oGt6LnjxQFK3IKBAKcqLz3cNOkmrQMEJcg
	 VulqJf0jD3DAnGRZNG/EoKxD29C31JVQ3+u4LWsAh4rLCJXD70MJYlcGfLCSi+FGGw
	 TO6GMAhyuQyOSA5WHMA20+krl/9xO/AkgIOx/5KH20fI0a2UNwZrUHOSObBCFGd9f3
	 nMtEFeGl6KKMA==
Date: Wed, 28 Oct 2026 13:45:11 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auHs_2Ev5gQ55SnV@devuan>
References: <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan>
 <20261028.e5b1e67d24b5@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="w2xtfozdwbwh5q73"
Content-Disposition: inline
In-Reply-To: <20261028.e5b1e67d24b5@gnoack.org>


--w2xtfozdwbwh5q73
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auHs_2Ev5gQ55SnV@devuan>
References: <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
 <auEr3XGMrHXiVZjs@devuan>
 <20261028.e5b1e67d24b5@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261028.e5b1e67d24b5@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-10-28 07:19:28+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Hello Alejandro!
>=20
> On Tue, Oct 27, 2026 at 11:59:15PM +0100, Alejandro Colomar wrote:
> > > Date: 2026-10-27 23:30:59+0100
> > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote:
> > > > > Date: 2026-10-27 09:54:51+0100
> > > > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > > >
> > > > > On Mon, Oct 26, 2026 at 11:41:13PM +0100, G=C3=BCnther Noack wrot=
e:
> > > > > > I'm still leaning towards documenting it as a buffer with
> > > > > > implementation-defined contents which are provided by a LSM.  H=
ow
> > > > > > these buffer contents are interpreted is depending on the LSM i=
n use
> > > > > > anyway.
> > > > >=20
> > > > > To make a more concrete and constructive wording proposal:
> > > > >=20
> > > > >=20
> > > > > SCM_SECURITY
> > > > >=20
> > > > >   Receive the security context (the security label) of the peer
> > > > >   socket, as provided by the active Linux Security Module (LSM). =
 The
> > > > >   received ancillary data is a byte buffer.
> > > > >=20
> > > > >   The exact format of the security context buffer is defined by t=
he
> > > > >   active major LSM.  For example, SELinux returns a SELinux label=
 as a
> > > > >   string (including a terminating null byte).
> > > >=20
> > > > Let's pause the discussion of the specific text for now.
> > > >=20
> > > > I have questions about the exact format used by each LSM.  For exam=
ple,
> > > > you say that SELinux guarantees a string.  Does it count the '\0' as
> > > > part of the data size?  Or is it guaranteed to exist but not counte=
d?
> > > >=20
> > > > Same question for the other LSMs.
> > >=20
> > > Yes, SELinux counts the '\0' as part of the buffer size for the
> > > SCM_SECURITY security context.
> >=20
> > Ok.
> >=20
> > >=20
> > > Examples:
> > > * If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with payl=
oad size 4.
> > > * If the reader calls recvmsg() but preallocates too little space in
> > >   the msg_control buffer, this can get truncated though, and then it
> > >   won't end with '\0':
> > >   {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)
> >=20
> > Ouch!  So, no string guarantees here either, actually.
>=20
> Correct.  Callers have to deal with the possibility of truncation,
> which strips away the null byte.

Is this true for every LSM?  Do any LSMs guarantee a string even under
truncation?

> > > Other LSMs:
> > >=20
> > > * Smack excludes the null byte for SCM_SECURITY (smack_to_secctx())
> > >   (but irritatingly it does count the null byte when a label is
> > >   returned through SO_PEERSEC (smack_socket_getpeersec_stream()).
> > >   Both functions are in security/smack/smack_lsm.c.
> >=20
> > And as we've seen, no string guarantees, IIUC.
>=20
> Correct.
>=20
> > >=20
> > > * AppArmor excludes the null byte for SCM_SECURITY as well.
> > >   Implementation is in apparmor_label_to_secctx(), where it populates
> > >   the struct lsm_context *cp using:
> > >=20
> > >     len =3D aa_label_asxprint(&cp->context...)
> > >=20
> > >   and then sets
> > >=20
> > >     cp->len =3D len;
> > >=20
> > >   The function aa_label_asxprint() returns the length without trailing
> > >   null byte, as can be seen in its implementation.
> >=20
> > How does it behave if there's not enough space?  Does AppArmor guarantee
> > a string?
>=20
> The truncation case always strips off the null byte at the end of the
> buffer.  This is handled **independent of the LSM** in the common
> net/core/scm.c layer one level above - it *always* kicks in when
> truncation happens.

Hmmmm.  I believe that layer should guarantee a null byte when it
truncates the data.  It should be like strscpy(), which guarantees
a correct string even on truncation.

This seems to be another bug.

> To sum it all up in a table: The only case where the null byte is
> included in the buffer is in SELinux, when the generic SCM layer does
> not need to do truncation:
>=20
>                 normal case                truncation case
>   --------------------------------------------------------------
>   SELinux       has trailing null byte     no trailing null byte
>   AppArmor      no trailing null byte      no trailing null byte
>   Smack         no trailing null byte      no trailing null byte
>=20
>   (other LSMs don't have the feature at all)

Thanks for the table!  This seems to me to be 3 bugs: one in AppArmor,
the same one in Smack, and one in the upper layer which corrupts the
string when truncating.  I wonder if we can do better in the truncation
case, or if it's too late for that.

Would you mind CCing the maintainers of the upper layer in
net/core/scm.c?


Have a lovely day!
Alex

>=20
> =E2=80=93G=C3=BCnther

--=20
<https://www.alejandro-colomar.es>

--w2xtfozdwbwh5q73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrh7lEACgkQ64mZXMKQ
wqmLmA//VnwGZuCkWxNMHjKtrxmzz/UWmMG1lUvTNZmxitm6VQ5SbFrraunq4oZ3
k1uHHqMm2dv6pfcs5SJPglvvCi4cNBcPCS2Wtv1bkThR4S9IdfwcJf0YJeTu+11F
8xnUUl1FLBZ461UjRCW7y89B+dVeBtH3JO2XqRFyB59pVH+0iQ7GLOuK4WmqB0Yb
lSSYQfA55+/X5wVzMdpJsv4fiMBsqzvdTMopqFeqiLW02pbap+STpSAuShqfurcc
3fVqlefZ0GLLE7qKz30w1knao1BJqKKo9uhevtk544ucSMwoP7HU0RVan1iF6SI1
RZcJvKRtfH3/lezIjE4CV19jGOmAfaALdMGdi23A9bkpCQ1tUSBVUJ0Psqt/agVZ
MmMUrQRv5ARyN6V1DuUiWXz+WSTHevns23SGg7dwceZ4wgiImWujPPpKY2lOuMqG
kwXAl+TfFP98kp4vpNvfXl2PgCNZfKJWw2HchA9V7pM5thpTaHom8L320F2s0GDd
1BYuCAONyAKIIt7F0WWXug7g3qqi5/wLNkYlmGdZPnuP6IH0EdHgjS+4UR+Mssvx
/hJeg//oNN0yf5S5lNFjiG8FRLrMTmkOiW99U3IRZR4QjaLMLKsUFQeUVx1pwCWV
gPVisOGBR/ODTpoec2ftPF3yXR4On2WGLUjdwSfs7/hPLcIdOjU=
=bRTN
-----END PGP SIGNATURE-----

--w2xtfozdwbwh5q73--
