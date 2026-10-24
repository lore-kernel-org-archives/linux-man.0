Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831387;
	b=ZA1MyPLEDzTlhldAy22RUXGLhM55tiscADMFyEIC9P1B1ZQLEn7INKS0BG6jfvLCcUoU
	 FxouWzZceKiCDonfFjEYyWnlICNb8bcSAxP8wsAieETpXtMhclttTfH4bUleEIdv07+uR
	 hYDxkslaiNB8Y+pumQV8y88w2Jv3FEdItFLTUOFSgIuGOF4A0nmrg9eXWeRg3AIg/tvfe
	 uAm02ou5WnnWUhEeMw0XHbtnklqvh1sQEGxvv+ExfXKjT6OlWh6NOwxNUBfwtLCzJ/Eei
	 n500Ud7G5hcfeGQRiNsUzQOxU9hzt2Bq+uIzLH9KqjSGOX359s9+StmRDU3duTiQFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831387;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2d90AR+ltmBsGvguDj3a3u8Ve/1FX9InyHSp1/ZfTyM=;
	b=DhocwlosasIKCw7AtMxmJ/6AsBdVOc8APK4B2+4Nyt4DDwZ0HZWT5WkMBtv8Sl7Ra161
	 QMc+yZgozQidwtwuh1HyNNm2vvrSk/GHip/cHrUgt3YhhQdHyYG4r9ubZq9miEc/aivoz
	 Bk/v4IaaK2yZ+6+g5hvDsGbOMkgZwEMvgprNTlr5BF5uWPwciR219Ok9MwnwapH1y8mvh
	 cL1yN5kxxG4ogdf9/wDz5W3Dlr3HIotiwHv4qx0u7CEMjhmT9OTjbSlsrs03EUPmqVTaF
	 XQVizgEFhRtIw6BMNoKcclp39EERNmmdtMSl3z91vU64XNZB+FFEkUNln2k8h49u6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79mP8+D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E7B606A31A
	for <linux-man@vger.kernel.org>; Sat, 24 Oct 2026 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e79mP8+D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A31F01825;
	Sat, 24 Oct 2026 08:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792831386;
	bh=2d90AR+ltmBsGvguDj3a3u8Ve/1FX9InyHSp1/ZfTyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e79mP8+D5OsIVreRSHM80T5yEHuasib+he0z4Ii/k+FMjOvH1sha/exjePVRiU5Bb
	 jChUlNXqneWCJXyF+Ba9pmprJGPAeNyfzNi2ppVzc8X6ANp5VqT4wFyvq8hcwkzet+
	 AUQ1ngnGZs7Mu5lF7+vR4aQkC4NE8Yowu6yefWmFewbcFDdwEawwKULR2gX1M/vQY2
	 YqKcO+RHtX0xqezBZxiKvJumrb4tWLPsYUNWn7TKBlERkW9AMdrpg8fYum4dyFiKxm
	 Zz91+9FGLZjIbiXRIloeXhllPfTVZDC5nqMB9HfTZBJrac6asPYRz597YKpn2CGU8M
	 AbB8X2Rs1ZOMA==
Date: Sat, 24 Oct 2026 10:41:39 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
Message-ID: <atxumcwnuz-pnyGe@debian>
References: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
 <atu28R9-CdAtoz-V@debian>
 <737C7FD6-E204-4C90-B811-26BEECE7D7FC@gmail.com>
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
	protocol="application/pgp-signature"; boundary="vwtc3qlwtyfpyp4l"
Content-Disposition: inline
In-Reply-To: <737C7FD6-E204-4C90-B811-26BEECE7D7FC@gmail.com>


--vwtc3qlwtyfpyp4l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
 `.sched_flags`
Message-ID: <atxumcwnuz-pnyGe@debian>
References: <A89056FB-15B8-454D-9C6F-9EEB75965302@gmail.com>
 <atu28R9-CdAtoz-V@debian>
 <737C7FD6-E204-4C90-B811-26BEECE7D7FC@gmail.com>
MIME-Version: 1.0
In-Reply-To: <737C7FD6-E204-4C90-B811-26BEECE7D7FC@gmail.com>

Hi Enji,

> Date: 2026-10-23 16:56:51-0700
> From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
>
> Hi Alex!
>=20
> > On Oct 23, 2026, at 12:37=E2=80=AFPM, Alejandro Colomar <alx+linux-man@=
kernel.org> wrote:
> >=20
> > Hi Enji,
> >=20
> >> Date: 2026-10-23 11:58:57-0700
> >> From: "Enji Cooper (yaneurabeya)" <yaneurabeya@gmail.com>
> >>=20
> >> In more recent versions of the kernel, `.sched_flags` is a treated as a
> >> bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.
> >>=20
> >> Account for the additional flags so the documentation is up to date wi=
th
> >> the kernel implementation of `sched_setattr`.
> >>=20
> >> Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task ucla=
mp constraint value")
> >>=20
> >> Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
> >> ---
> >> man/man2/sched_setattr.2 | 5 ++++-
> >> 1 file changed, 4 insertions(+), 1 deletion(-)
> >>=20
> >> diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
> >> index 80a0ac726dcf..64acdd88884f 100644
> >> --- a/man/man2/sched_setattr.2
> >> +++ b/man/man2/sched_setattr.2
> >> @@ -417,7 +417,10 @@ .SH ERRORS
> >> .B EINVAL
> >> .I attr.sched_flags
> >> contains a flag other than
> >> -.BR SCHED_FLAG_RESET_ON_FORK .
> >> +.BR SCHED_FLAG_RESET_ON_FORK ,
> >> +.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
> >> +or
> >> +.BR SCHED_FLAG_UTIL_CLAMP_MAX .
> >=20
> > Why does this list not include flags such as SCHED_FLAG_RESET_ON_FORK?
> > It is documented in the same manual page, so I expect it's valid here,
> > right?
>=20
> I actually added the `SCHED_FLAG_UTIL_CLAMP_MIN` and
> `SCHED_FLAG_UTIL_CLAMP_MAX` flags to the list of valid flags, in
> addition to `SCHED_FLAG_RESET_ON_FORK`.

D'oh!  I was really confused yesterday!  :D
I meant to write SCHED_FLAG_RECLAIM, but then I pasted the wrong one.

> I=E2=80=99m kind of on the the fence with how I worded it though =E2=80=
=94 it=E2=80=99s kind
> of wordy and not really futureproof. I=E2=80=99ll take a look at some of =
the
> other manpages to see if there=E2=80=99s a better way to word it.

Yes, this is what I meant in the end.  We could reword it to say:

	Invalid flags specified in
	.IR attr.sched_flags .


Have a lovely day!
Alex

>=20
> Cheers!
> -Enji



--=20
<https://www.alejandro-colomar.es>

--vwtc3qlwtyfpyp4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrcb0IACgkQ64mZXMKQ
wqnJXw/6AtQ0838Wpka8Ftawy1JbQC6hedP0QOS4PMRY0goi2ny0v0mJWLUjg0dP
DqHrh5tNtNvtZdr73bFL4Ox+wWgIUjrMgBHE+xWimeiFR/14+AimSZFc0P5TRz+n
aSWSXh9t5jkvOveuEd4/htAlff2JQSevHfVSOJRzjw8gfEkquQKxoIXjwV5yU5IV
j2MpjB+Tgk1+jgerIpDOv41pYoUpgm/KpeH9zOdSnFY7KJgT5OhhV0HqF1Bz3p7X
rEra9jlJmPpj5jYl50jFdGXhkjVsnVVPp8ZRq9b3p6mhF6w17aQLdhozfjdYvpy6
P9POJQd6W02DK/12uC8Ol/3NuKtQMPxLjxBGSET71nRjx6ZhOx5k199vDI0ewvyu
ZcJh40GQ9inX2xyRNYP8C/+40etk1Rl2dBw1+JXv/lSlNG0NUE7p495WoJyOfro5
TReMaYU8gNEoLJJoxeDPDRS9gk+H7Pg3Ff8HVYxrGL54PVapKTMjm6xKkdj61c4b
HkCXlaWAZOjFLpDgY+xccbHSqS4ql62chjX6IlE9xuHKn/NfcRupXj26MDFSTZmk
tdjc/R9S+k17dAfC4Yjo96QyKyzswq4r9nTN/1/Bed0xncO73tW1ASJ+5rjcFlJz
2/bPfVZ/vRX/fAZPevvXWQPAgno2u5YfQQ8qvDbCpVY3J6KST7Y=
=T0yB
-----END PGP SIGNATURE-----

--vwtc3qlwtyfpyp4l--
