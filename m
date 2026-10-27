Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793137578;
	b=b1PgbaBf4dLXJXkuE4UgoM3+8SB6eCC8mh1Bp4uunZVYFbQctNdID+pckOIVEeLddn6D
	 HhtNv/ecwdy/emsMVKys2cI6kyUelEyzSlvYqMgP/qr5N7mq57mpvCELOnlV/SaNrux7W
	 vM7iKC0Ih576Jolgi/TmZs4Zsc8GjzfyX4taI8iLEhB4kKhX4Q6GpBzI2OOpIKPRUWVHC
	 OT3N2gOZL/SKpzh0SGHyyQ3t0CECeH04aiHVfcKbLidOB8wa2IVQsxINER13MUA14wuEl
	 zzS65fq4kt/pJyTccU54bhvvyTdNqt1LEGomXKvk6eQyG6eVafWUpbNZCX2yQm7jkkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793137578;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LtLVBUZRH3jTqmJrXJLU63PoyUPFrQGI5Be2TWqq/QA=;
	b=QoyvNvqvOF+C3kbY5fe0lVvSjLVP9LJtt19S90HLQzX5jH61u07rLibSXcnRi2EihsdD
	 8BADbhgEDXYx5RSE6EhF2q3pAFntPaE0RzYHRNG0kma20b6/VTePOpPTmP+/xy9E231Zs
	 rQdCzIXXHrnrSFqiBeHh6ufcLazorGYMjfNhSUKDg78YhiY3upeV51HKSx2k0ontGyORR
	 ZyNGFA9r/YKalTOom4ctIoEdbvDDc9Ch2yNJOLrfQmSCz6yc4Uku3tG2g4RE+GmRcMiRV
	 QbV1cHpr7N5ykvMh6XprPg5o4Du7uQfmi/DmTKRmwqUzQikbvqK+VYuU/nTXpQcxOVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAHMqUZ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762C3606A33B
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 21:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iAHMqUZ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BD31F01825;
	Tue, 27 Oct 2026 21:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137578;
	bh=LtLVBUZRH3jTqmJrXJLU63PoyUPFrQGI5Be2TWqq/QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iAHMqUZ+6upgMSdXp1v6KTPULGp2fK/B2SHiTURy/jPwx/ZIgPPzO1Avxu712US4D
	 5jOT9g0FhHQMKjUwP7fx27yuN6jOAmvOFs79W7JWsiHTzaU01W/B6+T1YqW3neTqHt
	 0SpbEJB+4E3ZIGSyz65CQ0N57bNaVlgJJzChAMyGodz/3bKvEVdzm7lyDlhO2YCwZl
	 xiUvjTrkHc63IVdEwhJ+F+hGrQm1ZkEgV5+VHpVNmWr9MNckZAYbjNQcFJBesg/P6v
	 Li9gEglZUpWwwv58gAigGaLEcF2DccUFisstdhgW+7WgWuhjCPReseSJaBZnf7JOwr
	 akDrcnNP0h9Pg==
Date: Tue, 27 Oct 2026 22:46:14 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEa_2LQFAD023tR@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
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
	protocol="application/pgp-signature"; boundary="ue5emj26abjmei4d"
Content-Disposition: inline
In-Reply-To: <20261027.4df00f962b98@gnoack.org>


--ue5emj26abjmei4d
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH 4/7] man/man7/unix.7: SCM_SECURITY: Generalize to other
 LSMs, not just SELinux
Message-ID: <auEa_2LQFAD023tR@devuan>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-5-gnoack3000@gmail.com>
 <atsufiZwUg3d-cKs@debian>
 <20261023.63aab80a9e86@gnoack.org>
 <atuiuCDEpf7H7I7J@debian>
 <20261026.f6d2e191a08e@gnoack.org>
 <20261027.4df00f962b98@gnoack.org>
MIME-Version: 1.0
In-Reply-To: <20261027.4df00f962b98@gnoack.org>

Hi G=C3=BCnther,

> Date: 2026-10-27 09:54:51+0100
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> On Mon, Oct 26, 2026 at 11:41:13PM +0100, G=C3=BCnther Noack wrote:
> > I'm still leaning towards documenting it as a buffer with
> > implementation-defined contents which are provided by a LSM.  How
> > these buffer contents are interpreted is depending on the LSM in use
> > anyway.
>=20
> To make a more concrete and constructive wording proposal:
>=20
>=20
> SCM_SECURITY
>=20
>   Receive the security context (the security label) of the peer
>   socket, as provided by the active Linux Security Module (LSM).  The
>   received ancillary data is a byte buffer.
>=20
>   The exact format of the security context buffer is defined by the
>   active major LSM.  For example, SELinux returns a SELinux label as a
>   string (including a terminating null byte).

Let's pause the discussion of the specific text for now.

I have questions about the exact format used by each LSM.  For example,
you say that SELinux guarantees a string.  Does it count the '\0' as
part of the data size?  Or is it guaranteed to exist but not counted?

Same question for the other LSMs.


Have a lovely night!
Alex

> Does that sound reasonable? Let me know what you think.
>=20
> I removed the wording "There is no fixed limit ...", because it should
> be a given that callers allocate enough buffer space for receiving and
> check the truncation flag.  (The more important part is that we remove
> the previous wording which suggested that it would fit into NAME_MAX.)
>=20
> Given that SCM_SECURITY on "real" networks seems to have the same
> "buffer, not string" semantics, it feels fair to express it that way?
> People who want to read the security context will anyway need to read
> up on the exact format used by the LSM in order to attribute any
> meaning to it.
>=20
> =E2=80=93G=C3=BCnther
>=20
> P.S.: I had a hard time finding many usage examples.  The main user of
> SCM_SECURITY seems to be systemd's journald, which uses it to log the
> SELinux security label.  That code can deal with both null terminated
> strings and ones where it is missing (due to truncation), and there is
> a comment indicating that they are aware of possible truncation.

--=20
<https://www.alejandro-colomar.es>

--ue5emj26abjmei4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrhG6AACgkQ64mZXMKQ
wqkgIw//erUluq66SWgPz0paAyIMx/g0PsC4XoOrrfzpsdn2F5atvIIJgGxpK1Tx
FI2DchNNLHSBbjqmeHeMq2GKlzoTH7CHZ7uJ7CIF31UnGGWUTnEZze4wROZwOqW6
fMxhfZRNdDLNgyhpb59G057PUftFidX2UfGpW+gwl6CGAR26t2bK6YplJnZ4Mz3e
zn0s46pm9/mr/iCQLVGcB1y49ar+RQ2Eg9RY6HIU7fXq408ul7Z37s/54W4dScN0
JekBcFbjKZpPs+VYIxLsP5qwKSeFFaIC48afdAqs3Qfh6tXaJB7zrOOszPn9hpWz
AnzEZnPk6Eetw9eUwkya62eG1ZDUA1eW040pHqClbdibJLkutOOSdvuHK2JUyGuq
dFbtmRKM/I516kBMIpoEnA3xW4ejqB8rUeMniiRUjZXKmEObc8O/TWUgGdARbUHu
N/wjABNAAKMe0C2j8SoQQ0NxX5wbC9vUb4LJF3pxZUq4iiAnijVcsmkopHGXm8Fs
DXC9/S6SUNOC+gGrXGRtD1gKX82AoClS0eerZxim32rshT2B4uvbfmyKDIvLY6V9
I3woBHFGddshkGy2s1tFnlezMGZ64lgT7thcl9s0KKr6p0haQpTlUdsz+dJvLVFf
yH1FJvrCTl7uosMiOodPvSk8yMacvkPPjKVxrx3aLRnSS3DhnQc=
=1xEH
-----END PGP SIGNATURE-----

--ue5emj26abjmei4d--
