Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779207;
	b=NbC/biaP1IpEjXb11pp54QlYR2jhPjAGqqixgNKbMNkWgFsI9A8+t57YM7Mu8aBh4iRK
	 kt0qcnLA1YtGi+YxuVNGsHKE0ibwr9Wlk0MDndtV0c/ADZ6zTCUPxsM8xdFJBgB+gAXMH
	 Rg3vyQnYoyavCqsRLyQbNLaZZrdFP3GhNE+L4USVqsTsBaW/gGZoFRbAtuWUScvDSA6Ll
	 0oHLjzg+PQStmZd4fhRRq3kmsphb/Fww8cPWZ4E19mM2mhaaw3IHFUfHjTOIPbsaWhj/C
	 DUq+TSUOcN2eL3GiSUMSoRPk2Uv/P9xds14G5tGHto31PcrqgTT4xKrnRLI7NM18dfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779207;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o6lrZKQ+EMmdr3vj+LUItsEAEnaWZ0KVR0KTLS/HeZ0=;
	b=mo5GEykJEhYDsNiWRJ5nwp7Bx8Q0pryzm5YSJHy5ZqWAOrL+uAQjeXdhlebt8+m0UN/O
	 HlVp7Pm7cy3I/rI48lzTYlJnYMmjHtYIwMTEyiZdwyIbcxupNDzRHriQwhxt5utC2Z/KK
	 MhyKTIo62l7yaQFShBx9tceqs2yAa397+eq98utWV2omQtuIrIveXtp7JvrCW9ka4dGLF
	 l8zFTC7NbEE6lqB43l+lDz5JxCdf6jBdxn6LHn/5exxxhDDWeM7cGbiULcMUUJXZ64Npk
	 J+JRZHp27HzMl6EBC36phpuIzykzu0CFCaf9h7jplbje8thHlUXGkkQvjhqfO2wJpag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GmjKST/R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C3606A31B
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 18:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GmjKST/R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C5B1F01825;
	Fri, 23 Oct 2026 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792779206;
	bh=o6lrZKQ+EMmdr3vj+LUItsEAEnaWZ0KVR0KTLS/HeZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GmjKST/R9+oNnDr2flKaZ7wpI4e1PH32rQugG7OiOEyN/i6WfIJ5tQ1n7cEZ70WXN
	 gXEc8sZXUJRbG6BwIqy666eM/rHC3p6SavI3BdujMRNBqWztmr4Yr3/j0lNNFrWCKa
	 0ogWnC/QUDNMhcuLLHjxQz31OFChZnb35A0utfJq3R+wqsOoN7Jl8rc6kAnEY1n4Dy
	 RrrFVCLzw2qCiCSzmMxqJeD6L/ej6rkUfXQZdJtx8YgwMg6doiuIYlXBzdu0IUV1T6
	 7S6FtpxNwKRfQAjlM9WwMhXWhAbC0UzlO73nnVJZRgeLCyQoUp1BU6C588XCDNF473
	 y2z9zyX++Ldzw==
Date: Fri, 23 Oct 2026 20:13:22 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <atuiuCDEpf7H7I7J@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="wtgpvxjytceb4dkf"
Content-Disposition: inline
In-Reply-To: <20261023.63aab80a9e86@gnoack.org>


--wtgpvxjytceb4dkf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <atuiuCDEpf7H7I7J@debian>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261023.63aab80a9e86@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-10-23 19:57:16+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> Hello Alejandro!
>=20
> On Fri, Oct 23, 2026 at 11:57:41AM +0200, Alejandro Colomar wrote:
> > > Date: 2026-10-21 23:22:53+0200
> > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > >
> > > Reword the description of SCM_SECURITY to not be specific to SELinux.
> > >=20
> > > The security context is populated in scm_passec() in linux.git
> > > net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> > > is currently implemented by SELinux, Smack and AppArmor.
> > >=20
> > > Also clarify the properties of the returned string:
> > >=20
> > > * There is no NAME_MAX limit on the length; SELinux contexts can be
> > >   longer than that.  If the control buffer is too small, put_cmsg()
> > >   truncates the data and sets MSG_CTRUNC.
> > >=20
> > > * Whether the string is null-terminated also depends on the LSM:
> > >   SELinux includes the null byte in the length, but smack_to_secctx()
> > >   in security/smack/smack_lsm.c uses strlen() and doesn't.
> >=20
> > ...
>=20
> Ah, I can see that this is confusing; let me reformulate that without
> mentioning this strlen() implementation detail.  Smack returns a
> buffer with a given size *without* including the null byte, roughly
> like this (simplified):
>=20
>   int len =3D strlen(skp->smk_known);
>   /* populate */
>   cp->context =3D skp->smk_known;
>   cp->len =3D len;    <-- does not span the null byte
>=20
> Reformulating to:
>=20
>   ...but smack_to_secctx() in security/smack/smack_lsm.c sends a
>   security context that does not end in a null byte.
>=20
> > > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancil=
lary data")
> > > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > Assisted-by: LLM
> > > Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > > ---
> > >=20
> > > Notes:
> > >     This feature is also available in other LSMs.  Unfortunately, they
> > >     implemented it inconsistently and that complicates the descriptio=
n of
> > >     how string boundaries are handled.  Linux does indeed neither
> > >     guarantee that this terminates with a NUL byte, nor that NAME_MAX=
 is
> > >     large enough to hold it.
> >=20
> > ...
> >=20
> > >    =20
> > >     This is the verbose variant, but I am open for suggestions regard=
ing
> > >     what level of detail is appropriate here.
> > >=20
> > >  man/man7/unix.7 | 25 +++++++++++++++++++------
> > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index ded82768322b..4abd216d19c7 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -317,7 +317,7 @@ and returned as the result of
> > >  is an integer boolean flag.
> > >  .TP
> > >  .B SO_PASSSEC
> > > -Enables receiving of the SELinux security label of the peer socket
> > > +Enables receiving of the security label of the peer socket
> > >  in an ancillary message of type
> > >  .B SCM_SECURITY
> > >  (see below).
> > > @@ -544,13 +544,26 @@ message, the
> > >  option must be enabled on the socket.
> > >  .TP
> > >  .B SCM_SECURITY
> > > -Receive the SELinux security context (the security label)
> > > -of the peer socket.
> > > -The received ancillary data is a null-terminated string containing
> > > +Receive the security context (the security label)
> > > +of the peer socket,
> > > +as provided by the active Linux Security Module (LSM),
> > > +such as SELinux or Smack.
> > > +The received ancillary data is a string containing
> > >  the security context.
> > > -The receiver should allocate at least
> > > +Whether the string includes a terminating null byte
> > > +depends on the LSM;
> >=20
> > This seems to contradict the commit message.  The commit message says
> > that the string is terminated, but that the reported length might or
> > might not be off-by-one (i.e., not count or count the '\0').
> >
> > This text, however, is saying that in some cases there might not be
> > a '\0' at all.
>=20
> The TL;DR is that the byte after the returned buffer's declared length
> can't be trusted to be 0 - it is undefined and can be clobbered.

Huh!  This is to me a bug.  Would you mind reporting them this as a bug
and CCing me?  I'd rather get this fixed in the kernel than documented
as broken.

Especially, if they use strlen(3) internally, this sounds very much like
a kernel bug, but even if not, it is clearly a kernel bug.

In any case, if we were to document this bug, we should not use the term
string, because anything not containing a '\0' is not a string, by
definition.

> I have not read the full kernel implementation now, but it can already
> be seen in userspace that that adjacent byte can belong to a different
> data structue:
>=20
>=20
> ## How control messages are represented
>=20
> The security context is returned to user space as a cmsghdr structure,
> as described in cmsg(3), where it is returned as a buffer of length
> cmsg_len:
>=20
> struct cmsghdr {
> 	size_t cmsg_len;  /* data byte count including header */
>         /* some other fields */
>=20
> 	/* followed by
>            unsigned char cmsg_data[]; */
> };
>=20
> Reading beyond the declared cmsg_len is undefined, and callers don't
> get any guarantees about the byte following the csmg_data[] buffer.
>=20
>=20
> ## Iterating from userspace through multiple control messages
>=20
> Iterating through the cmsgs is done with the API described in cmsg(3),
> CMSG_NXTHDR().  This is implemented as an inlined function in
> /usr/include/bits/socket.h.  The function does a bunch of validation
> logic and then ends in this rather simple advancement logic:
>=20
>   __cmsg =3D (struct cmsghdr *) ((unsigned char *) __cmsg
>                                + CMSG_ALIGN (__cmsg->cmsg_len));
>   return __cmsg;
>=20
> So, the cmsgs with their cmsg_data[] buffers are next to each other in
> memory.  They are aligned, but that still means that the byte after
> cmsg_data[] might be part of the next cmsg header or beyond the list
> of control messages.
>=20
> ---
>=20
>=20
> The more I think about this, the more unsure I am that this is even
> worth documenting.  In the end, anyone reading and interpreting this
> data probably needs to read the corresponding LSM anyway, and trailing
> null bytes are probably the least of their worries...?

Not only that it's worth documenting, but this might be a vulnerability.

>=20
> Maybe it would be better to just say something like "The format of the
> security context is determined by the LSM responsible for it".  WDYT?

I'm unwilling to accept a nonstring as a valid format, unless very good
reasons are stated.  And if those reasons are stated as "that ship
sailed long ago", the way to document this might very well be BUGS.


Have a lovely night!
Alex

>=20
> =E2=80=93G=C3=BCnther

--=20
<https://www.alejandro-colomar.es>

--wtgpvxjytceb4dkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbo8IACgkQ64mZXMKQ
wqm0uxAAuknbC9w5fKBKWZ0aAjI7FZo3FF7JMhvXExCkfAmnSssPileqUF0bdiby
ve9gWuczScn92fLjsvd7AFdrvUWR/0hHc2qgRY7LmTu54qRO09nc/i4T21hIvdsF
JVJjIUDTRJgM64yZLmvObDnPnTb96ajrh3Dgh4dQAOXe1wPoGxbjvufkJYbcMJqC
Am5p16X6PAi/MFVM2YW/BxNpzonRtuarZFNKIpQLzIBzDGweQmIXgKiCgRIXWIq/
dY6RVIX09s4qjWlfahhyeQ/omJ7EeRPkZ/8PXxwI66p3BVwKCxennkYO6sdP2Mia
6QQ0gYtUC02oLKl1DQ6QE/VKBnqzipRaI8U+hCQmocUaxEcAbFIM7tA2izQh2CBj
nYsZUiLFUEEpjFkK0CGxvH3h9djCeR+JfVzDkThJBnmeOLCpTOoLpg2s8wpK0aNG
iJlJj1swJaMycrHv6r/FiS4xwckS9EG6r+gkV3+i4sHbR20y0LYzLBdgFvbKKJ/b
ZLXcqOtLkFgwEzdoVYnEkOkpOpuFciUH0sCZUYsBmep+3vyx39FMNYGbC3hWykCd
MIrgY/eS4aJB2slKlIYoNS0xlyGQCCPTUrzc2+IX+wKbzVIK9V3OnvuL5XreeXoF
HuPakqe6bHP3d7z0AvhGtLBU+AThvHexdl4+qSTbfCKCqbuq3t4=
=G9yz
-----END PGP SIGNATURE-----

--wtgpvxjytceb4dkf--
