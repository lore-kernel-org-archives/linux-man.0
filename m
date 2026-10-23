Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783884;
	b=C74jIyEpY5AJF9NZGCal97J2gQZR7a8YyoLHxLvXEtbl6zyagZjV6rJMnTJXUqXDJPpL
	 SffynSflhHLOP9zYbvXhYZZHWKcnvdDWwrvVUDjoTaOC7Jq0ssxwIpe7lhUc8Y/aM8+al
	 9dTE6MtMHad9sPCiUMOABEe+XmY6EDDnoBgDXBVsTzcP5XJMjX0a7dc7AARgWkntsr26z
	 VoqM9B/6fZbvhYd3+/uQeC7LcUcEBivD1U1lyK8+ZsbJF9wQig6djrM7IvIH/2eNkTgmd
	 koKnunTunKOw0Pc6TUV/sE/4bowQOulGb70KinBCi9ls1PN7+OHBukxL3RDJadySAmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783884;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=16PhuI0Jw4dYF9nRYLtMqbTsx8HHB5JgXnDZ1sf/0ms=;
	b=gUSGB9VA50KgimTSLuZpWJSBAfgbKMWDvzJbm414FmGDNrZK2Ul/+fhY9BgUHCcdaA76
	 yHs6oLr8pSfJFrUBetmGJYdZa3G1GHNaS8g1fis4Tk1z8n4Dd7hWAvx5nd2QJ2nBOAdhO
	 hwwfgv/Yf9+IespxLUync7NG8Z97vdIH2oihQPY/6tMRNoHk6TK2h9uW0eyem8GTpgujU
	 qJGEJWDoWohbpnJ7Nrp09Tv0LK14Mst3f+X8IM1+FJmL9JuFxcd84FmZ0bz701XDv+Llf
	 bzOneapx12Vi2sgY5RWygSkjotSA2jBawy2k133xThKgZyrWKdivAzoEameyvoVdIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1tBBJb6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B662A606A323
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 19:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1tBBJb6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2ACF1F01828;
	Fri, 23 Oct 2026 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792783883;
	bh=16PhuI0Jw4dYF9nRYLtMqbTsx8HHB5JgXnDZ1sf/0ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1tBBJb6JB8Vykc/JV2Hez1lEZ0rtkYxnNKiuwfW/L1KAjynd6VPVKvHsZbketGGu
	 AMTj5LM4o/L8nUvby6NN8WtBAbjnHLQUitE2rxjHbhTqsj98qC8wfy5zBs2Y9Fi0uj
	 1C2dr+jAsfoT8ekSEf41yiLNj6pjoAVQk2W1x2V/806DGTrTum+lx08Xw4mOw6DVNS
	 2LnovBnyR0UHjZONVHPL5clZ5Rm71JWQdTGs9Q/8CTw5p79tiJnmtHdmIX6gKcRkNu
	 lFV6oHuO5HZLMOgLnRBXgr9yIAHPH5EWFXqTTcZGcX0MWHU2p0zU0RYTEIL+7W8j6B
	 ipctDk8Ql29HQ==
Date: Fri, 23 Oct 2026 21:31:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Enji Cooper <yaneurabeya@gmail.com>
Subject: Re: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`
Message-ID: <atu2BZy0EYMaoTk-@debian>
References: <bug-222094-216477@https.bugzilla.kernel.org/>
 <bug-222094-216477-AkltlLpJO7@https.bugzilla.kernel.org/>
 <atu07uXukn8V_4YN@debian>
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
	protocol="application/pgp-signature"; boundary="OxIHtRu9wrNmvI0Q"
Content-Disposition: inline
In-Reply-To: <atu07uXukn8V_4YN@debian>

--OxIHtRu9wrNmvI0Q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 21:31:17 +0200
From: Alejandro Colomar <alx@kernel.org>
To: linux-man@vger.kernel.org
Cc: Enji Cooper <yaneurabeya@gmail.com>
Subject: Re: [Bug 222094] sched_setattr: bug in `ERRORS` section w.r.t.
 `attr.sched_flags contains a flag other than SCHED_FLAG_RESET_ON_FORK`

[moving discussion to the mailing list]

Hi Enji,

> Date: 2026-10-23 21:27:52+0200
> From: Alejandro Colomar <alx@kernel.org>
>
> Hi,
>=20
> > Date: 2026-10-23 18:47:22+0000
> > From: bugzilla-daemon@kernel.org
> >
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D222094
> >=20
> > --- Comment #2 from Enji Cooper (yaneurabeya@gmail.com) ---
> > Created attachment 311258
> >   --> https://bugzilla.kernel.org/attachment.cgi?id=3D311258&action=3De=
dit
> > Patch
> >=20
> > I've honestly never submitted a patch to the Linux mailing lists. There=
 are a
> > lot of hoops to jump through in order to make a contribution... I'll tr=
y, but
> > please bear with me (I'll probably get something wrong).
>=20
> Sure!  You're welcome to try.  :-)
>=20
> I've forwarded your patch to the mailing list in this email.
>=20
>=20
> Have a lovely night!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es>

> From cfaef3da82a115fbce47dec58b458c6cfc439667 Mon Sep 17 00:00:00 2001
> Message-ID: <cfaef3da82a115fbce47dec58b458c6cfc439667.1792780609.git.yane=
urabeya@gmail.com>
> From: Enji Cooper <yaneurabeya@gmail.com>
> Date: Fri, 23 Oct 2026 10:39:20 -0700
> Subject: [PATCH] man/man2/sched_setattr.2: update `EINVAL` case with
>  `.sched_flags`
> To: Alejandro Colomar <alx+linux-man@kernel.org>
> Cc: <linux-man@vger.kernel.org>
>=20
> In more recent versions of the kernel, `.sched_flags` is a treated as a
> bitmask that supports values like `SCHED_FLAG_UTIL_CLAMP_MIN`, etc.
>=20
> Account for the additional flags so the documentation is up to date with
> the kernel implementation of `sched_setattr`.
>=20
> Ref: linux.git 480a6ca2dc6e ("sched/uclamp: Allow to reset a task uclamp =
constraint value")
>=20
> Signed-off-by: Enji Cooper <yaneurabeya@gmail.com>
> ---
>  man/man2/sched_setattr.2 | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/man/man2/sched_setattr.2 b/man/man2/sched_setattr.2
> index 80a0ac726dcf..b163ba482390 100644
> --- a/man/man2/sched_setattr.2
> +++ b/man/man2/sched_setattr.2
> @@ -411,13 +411,16 @@ .SH ERRORS
>  .BR sched (7).
>  .TP
>  .B EINVAL
> -.I attr.sched_policy
> -is not one of the recognized policies.
> -.TP
> -.B EINVAL
>  .I attr.sched_flags
>  contains a flag other than
> -.BR SCHED_FLAG_RESET_ON_FORK .
> +.BR SCHED_FLAG_RESET_ON_FORK ,
> +.BR SCHED_FLAG_UTIL_CLAMP_MIN ,
> +or
> +.BR SCHED_FLAG_UTIL_CLAMP_MAX .
> +.TP
> +.B EINVAL
> +.I attr.sched_policy
> +is not one of the recognized policies.

I wonder why you moved this paragraph.  It doesn't seem to be necessary,
right?


Cheers,
Alex

>  .TP
>  .B EINVAL
>  .I attr.sched_priority
> --=20
> 2.50.1 (Apple Git-155)
>=20




--=20
<https://www.alejandro-colomar.es>

--OxIHtRu9wrNmvI0Q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrbtgUACgkQ64mZXMKQ
wqmOsxAAvPwTrIUzjg+KO2GQKFiVFcRfvvvHBNtxSAIGGc7bN3RA8I8OjcAl60Xf
azpSwDtNhwsZmmJWVaKru0ZaUDjmvCOXb26XL5jqYqR4OGt1BuWHvp3qZqJWtnI4
IjcJdEc/r1s5hgMiz0jeTRg1q8J86kWSJfXDcrIz1dB5/HWaAN0yJBMu0MXLNP3Q
o5WnN4g+2QU5d7bNcP3Xo3DyYyfVJW1bZswbar/Q7vW0Zczd2S1z2TouiLby9aOV
H4estkWv7RHcuMKzx//K35FBE4bljyVaMFbt1Fi33iTTaf+YkH2qHpZJs0i57f8N
B9ANEUwtaZHy7LK/zUAL8kAo75cx+1lpRcTqfugYRlWAAzfyW7yfnfvLmcgjcY4E
YCR9Wp0OIq/IGy72IUuvHlSeEF/jzKDaoo5XSwVgfqBqPpFSR004N/9tksEiNJL5
25K9X1P+36gImtv2JPqZS6c9Jzatjfpa2SWgEkXdKeAueLB4wdxq+RrFjADUfTBg
rOitfCh20/nnwqkcYuuC35HuFKQ8Whn0UDJ/fzBgxOol98EzUtWUvrVxYR5Y+6Px
BQdO+zv1c8igkf6Qyn7t99KPt+M7RG0uQ929Qm2JvqiPb8t2aMiJyqsgudYwG4e+
l1JsxHsqX45BOmxo+tbQOzHc3WpxHoUKyXfQJlRpHyRkSPvcEYc=
=nhlg
-----END PGP SIGNATURE-----

--OxIHtRu9wrNmvI0Q--
