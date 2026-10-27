Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141960;
	b=qxLq6rOsjM446VFppvw25lvCFjteVDXwEqD/1Mjv+vZQzlVydlpP6EiwxjgEOWmNI0CJ
	 KQqxVRtz9CIvKn6nQtyj+vYrXblRaujYOLsVXLgRRS6hfUKjL3st1GwdrOeTdrHlyCGh9
	 aM8nshz1o0U2e9b05l4HJqhFnrVwxQ/mfaVCEFyo9dSO7aFqQQjMNsw/IkjoTzTy4nrAu
	 +OOhN74iqDoBEHI3qMcSF5+1oz1sxihUWgJQcviZEZ9/IMzTOdwS/OJN4Za6E+dCY/omh
	 iA0DJobS1ys5XuG8hdkWoc5rX9JZONHeUETptF37oMrwJdTe5Q8BTxna1aKdkxQgcOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141960;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fsxOhhKfqvNIHb8g4Xu1bqZedmPvK1EvVpo9OdP731w=;
	b=ZqkDGMmFH0d6toP+3tWY1NPJFTu4TQD75yw207PRQD196MkluJ1TmViuW1gp+jX1CBB1
	 8J45ocQujKzkTMHYMn0o/dXCECQXdfjSwwmkvwc0Rqz1beWYRrSUyrr9flABhTo2vBDtG
	 UbA6wfpVJNmJHmjIja0wZAp1cZDrqxkfX63k5vDRRzs6v8XRai24CMG8KoAbA2zT++Aru
	 1vxDVgJ58XzKc2PtqfjtDXPwMEfRQIR0gNG+Z1Mhv43eGWXzjBNcayq5LY81P/q74tJWJ
	 /KdyVOAGjlwnJFEsAbikDXOBPLhfcCzXVAYm9sBzef9y3Alkt3qFdwM9Ty+zgk8rGfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ljam/o5k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD8B606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ljam/o5k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6915B1F01825;
	Tue, 27 Oct 2026 22:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793141959;
	bh=fsxOhhKfqvNIHb8g4Xu1bqZedmPvK1EvVpo9OdP731w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ljam/o5k2xjaCc4/p7wM+/SSaxBjFNljcmctiaJNi+gEGeAkDtDST6kd6QHJrefMx
	 OfRyhCfur+0yMydn12i3zNzYNC98rTFDAvjAGk3+/Zm++vVwU8DzB0uv6rkeSmsy9T
	 Tk/VTanhhlnWfPx5JEcdRHRKXeQjuey/ibe8Gtln6huVXDN4Uof+Man02zViKz6h78
	 0WHf7g3gT1XVJYNkx6KeuJKAYnyRB2GzmivnSNn0czMD0a/UX5vK72N3PLJBbxpA5W
	 1OlQ0htechcA4vs875+IH1bGF97NOGNx2D1NjCz0IpBlVfA+TbO3sMcKuf5gDJYr7R
	 yFeVZScMJUU2g==
Date: Tue, 27 Oct 2026 23:59:15 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEr3XGMrHXiVZjs@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="t626vgnzxpfshbpw"
Content-Disposition: inline
In-Reply-To: <20261027.421170835581@gnoack.org>


--t626vgnzxpfshbpw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEr3XGMrHXiVZjs@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
 <auEa_2LQFAD023tR@devuan>
 <20261027.421170835581@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261027.421170835581@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-10-27 23:30:59+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Hello Alejandro!
>=20
> On Tue, Oct 27, 2026 at 10:46:14PM +0100, Alejandro Colomar wrote:
> > > Date: 2026-10-27 09:54:51+0100
> > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > >
> > > On Mon, Oct 26, 2026 at 11:41:13PM +0100, G=C3=BCnther Noack wrote:
> > > > I'm still leaning towards documenting it as a buffer with
> > > > implementation-defined contents which are provided by a LSM.  How
> > > > these buffer contents are interpreted is depending on the LSM in use
> > > > anyway.
> > >=20
> > > To make a more concrete and constructive wording proposal:
> > >=20
> > >=20
> > > SCM_SECURITY
> > >=20
> > >   Receive the security context (the security label) of the peer
> > >   socket, as provided by the active Linux Security Module (LSM).  The
> > >   received ancillary data is a byte buffer.
> > >=20
> > >   The exact format of the security context buffer is defined by the
> > >   active major LSM.  For example, SELinux returns a SELinux label as a
> > >   string (including a terminating null byte).
> >=20
> > Let's pause the discussion of the specific text for now.
> >=20
> > I have questions about the exact format used by each LSM.  For example,
> > you say that SELinux guarantees a string.  Does it count the '\0' as
> > part of the data size?  Or is it guaranteed to exist but not counted?
> >=20
> > Same question for the other LSMs.
>=20
> Yes, SELinux counts the '\0' as part of the buffer size for the
> SCM_SECURITY security context.

Ok.

>=20
> Examples:
> * If the label is "foo", it'll return {'f', 'o', 'o', '\0'} with payload =
size 4.
> * If the reader calls recvmsg() but preallocates too little space in
>   the msg_control buffer, this can get truncated though, and then it
>   won't end with '\0':
>   {'e', 'x', 'a', 'm', 'p'} with payload size 5 (truncated)

Ouch!  So, no string guarantees here either, actually.

> Other LSMs:
>=20
> * Smack excludes the null byte for SCM_SECURITY (smack_to_secctx())
>   (but irritatingly it does count the null byte when a label is
>   returned through SO_PEERSEC (smack_socket_getpeersec_stream()).
>   Both functions are in security/smack/smack_lsm.c.

And as we've seen, no string guarantees, IIUC.

>=20
> * AppArmor excludes the null byte for SCM_SECURITY as well.
>   Implementation is in apparmor_label_to_secctx(), where it populates
>   the struct lsm_context *cp using:
>=20
>     len =3D aa_label_asxprint(&cp->context...)
>=20
>   and then sets
>=20
>     cp->len =3D len;
>=20
>   The function aa_label_asxprint() returns the length without trailing
>   null byte, as can be seen in its implementation.

How does it behave if there's not enough space?  Does AppArmor guarantee
a string?


Cheers,
Alex

> SELinux, Smack and AppArmor are the only LSMs that implement the
> secid_to_secctx() hook, which is the hook that defines the payload
> contents.  (For reference, the higher level common SCM logic like the
> truncation is in net/core/scm.c.)
>=20
> All reasoning is based on reading the code (with some AI assistance to
> point me to the right places). I have not tried it out in a running
> system, but it seems to check out.
>=20
> =E2=80=93G=C3=BCnther

--=20
<https://www.alejandro-colomar.es>

--t626vgnzxpfshbpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrhLLwACgkQ64mZXMKQ
wqlfjw//SuH/lJg5ScZf+U7WUwTrRPEoJ5HynmbVruB2N7XI/LLRKtjVsm500dGu
gPia4EFErkwAkpi21Jfld1nKsRU0ExI6B5ARTpVmewQe0j/FTEhhCrR9jhBHgCfU
8VDPhylmsYCZZcddyIxE1j0WG/dRINu9lszlqfVUwfZ/GU6FpXzKaShlCWB/aQYx
FPha7zQXEY/Xa59uNR2j8FlnKYsvE35Enn5AgOvznaovEvPs1h4rhA6ZKtJPjYqB
75Wjf6+1aoB2yEsxiw/Zk4k1ut7dH/26e05wKEQUGFnDZZGF7IvenHMVPm2/eJ76
kLba2PmGpCBBpQ263gPXRtZSp4usRhJ2opwxvPHpBc3mNNaySpHrMB15rIvvdRu8
4C5jqqrrtKPcCVIOuK21t1Ers7qRYun3t2e+Ho0MIgNGqIPO908Qkr05OzpGorem
gJF4Ua9jOC+83R/qk/Y/HJGVmEa0Nbvh/PXorj/RhGqa+iIevCL+PxePkqRyKWz4
wVwEaPEZv0eKHDRwLBua+Kaj2FZPDT/UFg1CU8mFUp6ymIGjL9GDTYiUZU+Y6KsS
IN65d0vRh++e5TouR1X4TKUW6nay8zuqESF5wJGY4K5fCgYqwrje/SbNzVBsEYzW
wMziWDqGq58DFqjRvg9DZYWi2/4O5jaC0BrW08cFGGReghgLhOA=
=jOgO
-----END PGP SIGNATURE-----

--t626vgnzxpfshbpw--
