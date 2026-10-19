Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9877248595A
	for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393526; cv=none; b=oBotyaSZQgtcTc9CNYIT8hd22CtWu2LON1LboO6icZFB6GnWy+dA/W9wxFou7h1FbfMMZUXeGsO7PaM6BWn0FKUJpNRYEBHbwMcvqvHkI++7EItI7gKKFYqCQi3p4+t6/BmpdIxAFe6s/Zs5Vwg6SIWQoXgnV7IyDIlsqRcfPxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393526; c=relaxed/simple;
	bh=YPMyv4fU6qvJPFMMQKzWsKAon3fuvyH1qrligwAFru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+cr/T/6PKUmakPnCBOVvyHUgYKaPU/UIvzsVMS9mYZwfzkpo3H6BebLy99q4Yl2zKZ+Prrq6dqB9Qzu/c56Jcvt0lokc3LHKu8FewGY6bbe8N6vd/eRog4ui6XagHpw99jnX006/OEvvBChnH+99HrMSUg0zrkW40Bid7yjmTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTCJZBWJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTCJZBWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32011F000C4;
	Mon, 19 Oct 2026 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792393525;
	bh=Q2Lnf5kv8HHqNoVg7vSCyigQyiRbSiKysAazYTbKifM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gTCJZBWJQIuV2EJ4OBByxqM5kAAmSTm8b10IHJWYxN0Gw8tMVJc3S+c3DJB7W55Oh
	 bRi94SWl8qxBd9D0Vqj3Ns+35XGauMh55ERKdWN1qoUhWZhuPm540DzSiHeXEYOtWD
	 efMrCN62zAqZkAn+Jd8LQiEsN9mGNVy1b2cDrs31UMZ2ELfFrCG/BNhcmiOr4hNWwl
	 0hasSs7/WwymqBIttZ4f3leekhs/nxJj/6ztQDdZs17YFlU8Fnx2utNUZh8kdYThie
	 POCnBZ4a70RXRsOxr4+41rGOFtXtJ+ddohW6dyBbRn+C8YELgGmkuW0EhXcAW0evpS
	 M6pVPhooLmRcA==
Date: Mon, 19 Oct 2026 09:05:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 00/24] Documentation fixes in unix(7)
Message-ID: <atW_3kqU7KMcxHXp@debian>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyffyxvfhzkwdozw"
Content-Disposition: inline
In-Reply-To: <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>


--xyffyxvfhzkwdozw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>, 
	linux-man@vger.kernel.org
Subject: Re: [PATCH v2 00/24] Documentation fixes in unix(7)
Message-ID: <atW_3kqU7KMcxHXp@debian>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
 <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAVpQUCYaDWSeQormOH9SnJeiDnLanxvADGQ5WU7OkFN_zGzqA@mail.gmail.com>

Hi Kuniyuki,

> Date: 2026-10-18 11:37:16-0700
> From: Kuniyuki Iwashima <kuniyu@google.com>
>
> On Sun, Oct 18, 2026 at 10:37=E2=80=AFAM G=C3=BCnther Noack <gnoack3000@g=
mail.com> wrote:
> >
> > Hello!
> >
> > This patch set fixes a variety of inaccuracies in unix(7) and related
> > man pages, clarifies imprecise wording in some places, and adds
> > documentation for some features where documentation was missing (PIDFD
> > passing, SO_PASSRIGHTS).
>=20
> Hi, thanks for working on this.
>=20
>=20
> >
> > Alejandro, I am sorry that you don't want to review this any further
> > due to LLM use.
>=20
> I understand the frustration since maintainers are getting
> overwhelmed by too many AI slops these days (I'm not saying
> this series is) and the review cost is way higher than before.
>=20
> I'm happy to review this series as a AF_UNIX maintainer to
> reduce Alejandro's cost, so please CC me on every patch, and
> CC each author of (relatively) new functionality.

Thanks a lot!

> Also, please split the series into 3, general part (socket, bind,
> protocol stuff, etc), socket diag part, and scm part (SCM_XXX,
> SO_PASSXXX, etc).
>=20
> It would be easier for us to review small series than a single
> large series. (fwiw, netdev mailing list has ~15 patch limit)

I'm okay with a split.

[...]
> > Some mentionworthy points about features that were missing or had out
> > of date documentation:
> >
> > * Out of band messaging support (MSG_OOB):
>=20
> Please drop these changes.  I planned to remove it in the next
> cycle since recent AI-driven security research targets the poor
> implementation, and even if the bug is trivial for the plain AF_UNIX,
> MSG_OOB tends to promote it to UAF (and thus LPE) and risks
> users for no good reason.
>=20
>=20
[...]
> > [1] https://lore.kernel.org/all/bef45d8e-35b7-42e4-bf6c-768da5b6d8f2@or=
acle.com/
> > [2] https://projectzero.google/2025/08/from-chrome-renderer-code-exec-t=
o-kernel.html
> >
> > G=C3=BCnther Noack (24):
> >   man/man7/unix.7: ERRORS: EINVAL: The address field is sun_family, not
> >     sun_type
>=20
> Correct the address field s/sun_family/sun_type/

I think you meant s/sun_type/sun_family/?

> It seems the subjects are not formatted well, which makes me
> feel AI cannot follow the standard and it is not worth reviewing :/

The subjects seem okay to me.  In the man-pages, we use slightly
different conventions than in the kernel, so I guess that's why it seems
strange to you.  :)

>=20
> >   man/man7/unix.7: Socket options: SOL_SOCKET is a level, not a family
>=20
> Describe SOL_SOCKET as socket level, not family

To my own understanding, I'll ask: technically, SOL_SOCKET (like any
SOL_*) is a protocol level.  The socket level is just one of the many
protocol levels, right?

> >   man/man7/unix.7: SO_PASSCRED: ffix
>=20
> ??  This reminds me of Final Fantasy IX :p
>=20
> Please fix all of them.

We use 'ffix' as a shorthand for 'formatting fix'.  Those patches
usually make something bold, or remove bold, but don't do anything
meaningful to the page.


Have a lovely day!
Alex

> >   man/man7/sock_diag.7: Fix member order of struct unix_diag_vfs
> >   man/man7/sock_diag.7: udiag_wqueue: This is memory in use, not memory
> >     available
> >   man/man7/unix.7: ERRORS: EPROTONOSUPPORT: Protocol 0 is also accepted
> >   man/man7/unix.7: ERRORS: ETOOMANYREFS: Fix the conditions
> >   man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to
> >     unix(7)
> >   man/man7/unix.7: SO_PEERCRED: Also works for SOCK_SEQPACKET
> >   man/man7/unix.7: SIOCINQ: Document behavior for SOCK_SEQPACKET
> >   man/man7/sock_diag.7: udiag_states: Document TCP_CLOSE
> >   man/man7/sock_diag.7: UNIX_DIAG_NAME: The payload is not always a
> >     pathname
> >   man/man7/sock_diag.7: Document UDIAG_SHOW_UID
> >   man/man7/unix.7: Several items of the same type may be sent in one
> >     message
> >   man/man2/bind.2: ERRORS: EACCES: Write permission on the directory is
> >     required
> >   man/man7/unix.7: Autobind: Fix when it happens, and mention
> >     SO_PASSPIDFD
> >   man/man7/unix.7: SOCK_RAW is accepted as an alias for SOCK_DGRAM
> >   man/man7/unix.7: SCM_SECURITY: This is not specific to SELinux
> >   man/man7/unix.7: SO_PASSSEC: wfix
> >   man/man7/unix.7: ERRORS: Document EACCES, EAGAIN, EMSGSIZE, ENOSPC,
> >     and EPERM
> >   man/man7/unix.7: Abstract sockets are scoped to a network namespace
> >   man/man7/unix.7: Remove mentions of unsupported out-of-band messaging
> >   man/man7/unix.7: Document SO_PASSPIDFD, SO_PEERPIDFD, and SCM_PIDFD
> >   man/man7/unix.7: Document SO_PASSRIGHTS
> >
> >  man/man2/bind.2      |   4 +-
> >  man/man7/sock_diag.7 |  40 ++++--
> >  man/man7/socket.7    |  16 ++-
> >  man/man7/unix.7      | 308 +++++++++++++++++++++++++++++++++++++------
> >  4 files changed, 316 insertions(+), 52 deletions(-)
> >
> > --
> > 2.56.0
> >
>=20

--=20
<https://www.alejandro-colomar.es>

--xyffyxvfhzkwdozw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrVwTAACgkQ64mZXMKQ
wqmmQg/+JySXy7ti2DXcnOphsS44b9uRBTszPb+SyUmgCKNneKFtM9H+1PgsxagP
TwiVrlVX3Uh0NvLZcTLdLqdRFIttQqTQkGsREZgpHxjc90j87GdgQOHSySP97oEw
syDfldUzr8r/iZajwT+PH9aCiV5Et6aEZhXNmqQApf18UlnASufcjRy3Nf212tU1
yESfjEVqFW8e9gQwp6ivgsoALV7KUtbzaA/Kl+W/ETXAw04AQFrvqjmztGq0rYU4
nQFl7TvOZM/R5PomH4/MiQCIlLih8HFL+19K9bi+K054X3B79CccwPpNs/1EiYRt
srXN/XYcv2xYcQDkhoF8JWsE9s+9yy60unwcgXsUZ8qSat8A2c/JKM/BpYaL0ETs
p+UFO2qYZq98GeqhqqeD8sCxUlZt8KToPHMTvF4llV5L72qVGnDKveou6F3xVyVV
fGeoghSZ/OF2P0Tg+2TD/MiL7ANV+vyQLAQyNw73023VyZk3BLVjJCtLzH7B1vx/
sYsbDRf0mK/nia/jh9UR1yjEXrd2DgcF7LbuzzG+rmVsUvX2y1KSQtW1yOaeA6iz
R3x106JY0pHXjgOtpLbqlgQyQ4+MZ9iIR5JuXg+ph4NJ4HrQF2f6pCyXt++n+tJt
hEJOxkDiK5iq34bCIG9HlwCZk6Ftw4IBdt9bWCsHV55EAn1jamM=
=tNUf
-----END PGP SIGNATURE-----

--xyffyxvfhzkwdozw--
