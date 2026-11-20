Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795185675;
	b=oyGLHXN7YX+2anYy9YU4CHO8y/HBguDknLaxbWtKJLn2pXvr+Tf1q+ahGH28vlUEN+z4
	 MmAjp+4F+ZVA50hE6gDD8Eayb4nJ1ZrGWmEHnWL3F0wPy3aco/FNKASoW4lVBFmx/YBDE
	 XK3/XdVDZ0aamgLMetWf5WgcrVPqwYW4F5J1aA+ChS+HhJF9qb5IUH715nhT8wRUiifcJ
	 EhaYDFAjG+LtKMD1FSnFZbcDW08auvZyZR20713QkMer01VE1zk5Nkig9kTASHtaf9nti
	 IzjoluepmMoUbES+aj69zAliRSKwl8tYqskybUXyno3ro1IbOV5BpKmDftvhY3gvRpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795185675;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VK6Q4qZ7QpI9ewVu5FID8J5dvM40XosGTU1hROQssDo=;
	b=Z8r/AG9OU8iN56heZa8AP9Wl8UnzbAcyMQAvNWRxVuyyE/4p7N0Te4I/H0ZFbtizlsbV
	 a9H/dFfeTGghNcF075YkoAUF3p0zgn2YUeJtjtx/HFegimayBdCvu8V0R+FphqQUp2KzK
	 IOLccOmGxwy5E2cCkwQKHXBkmVPI+BA+tCvaQxkqkWPbjM5wm1KvUOwMWHGdfMvlrSukL
	 GkwpASv6++yG66/lu+UHIZi1UDGr4dpXMDL9nC+sExnfMfBFW9YkBAM9xj+A+TPfWv8y6
	 n37/CbZldbCqJ0j/STWHp1QIIrewzF4FHDbpQyu+7G/lMk7Obfa+Tw0G7/s4RBBLvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZSWc5lu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06FB606A320
	for <linux-man@vger.kernel.org>; Fri, 20 Nov 2026 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TZSWc5lu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C2A1F000C4;
	Fri, 20 Nov 2026 14:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795185675;
	bh=VK6Q4qZ7QpI9ewVu5FID8J5dvM40XosGTU1hROQssDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TZSWc5lu4g+01fyxJ5UQrOgUc37XnnT9yTzq0oXqqJ5Glav0jN1dCJYozjrilTpCR
	 LIlvGkoIAA8b5MRo2IHV1hGkOVHciNsbpagwG23aSpfUS2cjA1393s1sNU+8t0ZMTK
	 9HCnRJMw21ANusXo3jHQ35fhE8sdI0Pux17of1VfJufCdurTpCPdbZI8OEfJFTvPeD
	 jSntzIcRj0RcxWfJUnkrdoXP1f4mtfmR2OI2GkQPRDsltdtyhZtP+EXEACvWP3j2SB
	 s4ueYrJAFq3Uc7vIBnxHGWsfD2jqtP6YuEqm8rVzbWz9nLj8FH44nSWxLd9fOL593C
	 PgY0+u1VhtDXQ==
Date: Fri, 20 Nov 2026 15:41:10 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awBavx8g4q9pCZpZ@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avz6f7OyIVCKusQ3@devuan>
 <20261120.790f70cab7b5@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="3r4hg5eirj75s5gd"
Content-Disposition: inline
In-Reply-To: <20261120.790f70cab7b5@gnoack.org>


--3r4hg5eirj75s5gd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v2 4/8] man/man7/unix.7: SCM_SECURITY: Generalize to
 other LSMs, not just SELinux
Message-ID: <awBavx8g4q9pCZpZ@devuan>
References: <20261103202211.13820-1-gnoack3000@gmail.com>
 <20261103202211.13820-5-gnoack3000@gmail.com>
 <avz6f7OyIVCKusQ3@devuan>
 <20261120.790f70cab7b5@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261120.790f70cab7b5@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-11-20 15:17:46+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> On Wed, Nov 18, 2026 at 02:13:40AM +0100, Alejandro Colomar wrote:
> > Hi G=C3=BCnther,
> >=20
> > > Date: 2026-11-03 21:22:06+0100
> > > From: G=C3=BCnther Noack <gnoack3000@gmail.com>
> > >
> > > Reword the description of SCM_SECURITY to not be specific to SELinux.
> > >=20
> > > The security context is populated in scm_passec() in linux.git
> > > net/core/scm.c, through the security_secid_to_secctx() LSM hook, which
> > > is currently implemented by SELinux, Smack and AppArmor.
> > >=20
> > > As clarified in [1], the returned security context is in the general
> > > case a byte buffer, not a null-terminated string.  The only LSM that
> > > returns a buffer with trailing null byte is SELinux, but even that is
> > > not guaranteed in case that the message is truncated.
> > >=20
> > > Link: [1] <https://lore.kernel.org/all/auZcwYWv0NeiIR8d@google.com/>
> > > Fixes: ffad6a017f91 (2018-07-28; "unix.7: Document SCM_SECURITY ancil=
lary data")
> > > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > > Cc: Eric Dumazet <edumazet@kernel.org>
> > > Cc: Paolo Abeni <pabeni@redhat.com>
> > > Cc: Willem de Bruijn <willemb@google.com>
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
> > >    =20
> > >     After confirmation from Kuniyuki Iwashima, this documents it as
> > >     returning a byte buffer.
> > >    =20
> > >     I prefer this variant over the previous longer one, also because =
it
> > >     refers to the individual LSMs for the exact format.  A reader of =
the
> > >     security context will require LSM-specific documentation anyway to
> > >     interpret the security context.
> > >    =20
> > >     This patch is still LLM-assisted, but at this point, since everyt=
hing
> > >     is rewritten now, the only LLM-assisted part is the discovery that
> > >     this part of the documentation could be improved.
> >=20
> > You may use 'Reported-by: LLM' for distinguishing such cases.
>=20
> Thanks, done.
>=20
> (Minor remark, btw; I have carried the Assisted-by: LLM convention
> over from the Linux kernel, but they have phased that practice out now
> and removed that convention from the guidelines.)

Yup; I'm aware.  We should still disclose it here.  I personally would
prefer distinguishing Suggested-by from Co-authored-by, FWIW, but at the
same time I refuse to say that an LLM has authored anything (rather, it
has stolen it from someone else), so Assisted-by might be more
appropriate.

Perhaps, I'd distinguish Reported-by, Suggested-by, and then use
Assisted-by for what a human would get Co-authored-by.


Have a lovely day!
Alex

>=20
>=20
> > >  man/man7/unix.7 | 19 +++++++++++--------
> > >  1 file changed, 11 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > > index 61f06a74359b..c0e2bdbacdd8 100644
> > > --- a/man/man7/unix.7
> > > +++ b/man/man7/unix.7
> > > @@ -312,7 +312,7 @@ .SS Socket options
> > >  is an integer boolean flag.
> > >  .TP
> > >  .B SO_PASSSEC
> > > -Enables receiving of the SELinux security label of the peer socket
> > > +Enables receiving of the security label of the peer socket
> > >  in an ancillary message of type
> > >  .B SCM_SECURITY
> > >  (see below).
> > > @@ -538,13 +538,16 @@ .SS Ancillary messages
> > >  option must be enabled on the socket.
> > >  .TP
> > >  .B SCM_SECURITY
> > > -Receive the SELinux security context (the security label)
> > > -of the peer socket.
> > > -The received ancillary data is a null-terminated string containing
> > > -the security context.
> > > -The receiver should allocate at least
> > > -.B NAME_MAX
> > > -bytes in the data portion of the ancillary message for this data.
> > > +Receive the security context (the security label)
> > > +of the peer socket,
> > > +as provided by the active Linux Security Module (LSM).
> > > +The received ancillary data is a byte buffer.
> > > +.IP
> > > +The exact format of the security context buffer
> > > +is defined by the active major LSM.
> > > +For example,
> > > +SELinux returns a SELinux label as a string
> > > +(including a terminating null byte).
> >=20
> > Considering that the interface doesn't promise to respect the null byte
> > written by SELinux, I think I'd entirely remove this example, and
> > instead focus on disclaiming that regardless of the format, the buffer
> > is truncated in a way that destroys the format.
> >=20
> > I'm not an expert of this feature (actually, never used it at all), so
> > maybe some silly question:
> >=20
> > How is a user supposed to know how much space to provide to prevent this
> > problematic truncation?  Is there a buffer size that will guarantee no
> > truncation?  If so, we should instruct programmers to use it.  And if
> > there's no possible size that fits all, we should probably warn about
> > it.
>=20
> The required space for the buffers is again dependent on LSM; in some
> LSMs, the buffer can (theoretically) be unbounded, but it's possible
> that you can calculate a maximum size if you understand how these LSMs
> are configured...
>=20
> I removed the example and will point out that truncation may happen in
> a buffer-unaware format, if the caller-nprovided buffer is not large
> enough.
>=20
> Thanks for the review!
> =E2=80=93G=C3=BCnther
>=20

--=20
<https://www.alejandro-colomar.es>

--3r4hg5eirj75s5gd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmsAXAAACgkQ64mZXMKQ
wqkLehAAs3RLM9LsV0iy4c1devw9xGHCQr1DDJd7Rg4itZhBw4rPoHcmHlA2NSy7
yxlRqyD3x+4VRGkKae7gsYeaaX6B4dWLgsHeoiL3DnQlsX0MqaS9/fqsGc/XcctI
rf7r9MD1EkFbYOqlyCgRGgLHZR+U5a5YoudKNs+DUpdBKrSZomCvioNoIA5gdSV8
gfAPz9WcizsfVQCWnl4aTZkbepiLAFVpshUk7BGUGdvZIWW79RqppIudHfDoM9ps
CIB4nFfUfJWnk0X1c8EnS6bT38/HyMCVDDlztWQf9PzcuYi1dSK7hAbhOo8o1j4i
E0RSmScSzmanbZCVnPi+pYvRPCvaMnDbNGxUsTB5w5V0tPnyXKDVI2zAi6BhFVyT
zZi2j6dSNgLHaymjFHMFX9G0A+nXu7IB5Uw+3+STrV2W+jExUkvFlhhvhyPL8kCi
7Om1UJS0QUkEdekJ+ZXL7EbuwBR8gBwxt69t4DGqnqrknvG0ZCoyXPwDURXc2its
cGRdOIBjXpEPM/dATuCv06DbxdWQzgPHaVh0HxPP/1W+cUsU6NT3i5WLXOipP2FC
iKrxN6LN65cBfuT9ONqfFo+g2TV4U/DibEsN87LuCrnluyRUu2XghY0biuCVNXwG
2lrFfRIkboBmsC7Tqyuek9WoAH9CFzWLOpZwcRCz5Jn2FGDEqN4=
=gNC8
-----END PGP SIGNATURE-----

--3r4hg5eirj75s5gd--
