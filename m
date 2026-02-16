Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AD024337B
	for <linux-man@vger.kernel.org>; Mon, 16 Feb 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253422; cv=none; b=mL1WBuAW79uGW16Y0OIohs4twUArtLkRLwEKdZfa+8DY7l32MDqHFEXd5xn9IEJn1n3JCj4ZafQWzUTc8472ZEEs8ZN8om+g4v18GF1Ce8HbBH7Yf8fojHCecpOk6/ZxYZ2I/WW4Nhol7AuifjMsC3X67Z326DXQNVvW68C4QY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253422; c=relaxed/simple;
	bh=ZzTOi0uraQ3NOKoDVOjrLrGyoMQ/7lZ4E8hPOd6PIF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv/XBYK4C8Wt6ipbtZyAfJpjr1hqRQGaAzi0YdE0pF/oHDFLJwNFKpG5wTND0dn9b9WoH3gieR6MnVGpEygHdl0vzPLLTv3w/XnJ9fczvAN/f9oabU6QFnFHFMKkWkDgxtyD/1jMIV5JJhP25Y8EQdF/nXz5XD5MLZdOZtYwb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zuehgn+A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zuehgn+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F09C116C6;
	Mon, 16 Feb 2026 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771253422;
	bh=ZzTOi0uraQ3NOKoDVOjrLrGyoMQ/7lZ4E8hPOd6PIF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zuehgn+A/MC4SLnYyuV64sQx007ctl9yH9n2AP7lPixO1vGvLfG+Ge7/WjGhltZaq
	 osZgicd0dXDM3ciIcMSnQXWXSJnOa2lET6GQ+uL4A6WolWWaWJ6ZSwrH3Vuub7ntfa
	 AHxesBDMnetN7yHJ4zOew1TPAbQ7o54oU7G81RqddoXzikXWMA6CyEvbs+/mBiVtUq
	 qq4sxE8RsJihrVaVfkySlY85/fmYbJ9OW1oUz16Je7Um5DnIcRQ6sXT7I2z7lwirnO
	 Fpmj7AzzemdTuoSzJ74AF+zr4OGIH6WipWkftfXtKNhYXNq+zXIy7e7MObK7fxwGWw
	 XMieGrkM8xPxA==
Date: Mon, 16 Feb 2026 15:50:18 +0100
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v11] futex_waitv.2: new page
Message-ID: <aZMtRBfvVxkvu9Nd@devuan>
References: <aZILB86QfGuXJng4@devuan>
 <xxvaao4cg7v45kkkprdkg5qeaqqpjxfkmyk5lufqidv5vsvyxi@tarta.nabijaczleweli.xyz>
 <aZJfEf6Pq6dYCHVr@devuan>
 <turvfc7e6ojztx6557qo75tqjdxmmr535ns2d25v2w3c3k2aal@tarta.nabijaczleweli.xyz>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5lfkc7rujsgbqtjq"
Content-Disposition: inline
In-Reply-To: <turvfc7e6ojztx6557qo75tqjdxmmr535ns2d25v2w3c3k2aal@tarta.nabijaczleweli.xyz>


--5lfkc7rujsgbqtjq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v11] futex_waitv.2: new page
Message-ID: <aZMtRBfvVxkvu9Nd@devuan>
References: <aZILB86QfGuXJng4@devuan>
 <xxvaao4cg7v45kkkprdkg5qeaqqpjxfkmyk5lufqidv5vsvyxi@tarta.nabijaczleweli.xyz>
 <aZJfEf6Pq6dYCHVr@devuan>
 <turvfc7e6ojztx6557qo75tqjdxmmr535ns2d25v2w3c3k2aal@tarta.nabijaczleweli.xyz>
MIME-Version: 1.0
In-Reply-To: <turvfc7e6ojztx6557qo75tqjdxmmr535ns2d25v2w3c3k2aal@tarta.nabijaczleweli.xyz>

Hi,

On 2026-02-16T15:20:49+0100, =D0=BD=D0=B0=D0=B1 wrote:
> On Mon, Feb 16, 2026 at 01:32:29AM +0100, Alejandro Colomar wrote:
> > On 2026-02-15T20:00:50+0100, =D0=BD=D0=B0=D0=B1 wrote:
> > > +struct futex_waitv {
> > > +    u64 val;        /* Expected value at \f[I]uaddr\f[] */
> > Should we say at .uaddr[0] to be more precise?
> I think in general it's between "of *pointer" or "at pointer",
> and "Expected value of .uaddr[0]/*.uaddr" read really poorly to me.
>=20
> > > +This operation tests that the values at the
> > > +futex words pointed to by the addresses
> > > +.IR waiters []. uaddr
> >=20
> > Should we maybe say?:
> >=20
> > 	futex words
> > 	.IR waiters []. uaddr [0]
>=20
> It does read unwieldy, but I think that's too cut-down...
>=20
> 	futex words at
> 	.IR waiters []. uaddr

I prefer "futex words pointed to by the addresses" over "futex words at".
My point was that the explicit [0] might be more readable.

>=20
>=20
> > > +If the NUMA word is
> > > +.BR FUTEX_NO_NODE ,
> > > +the node number of the processor the syscall executes on is written =
to it.
> > > +(Except in an
> > Maybe 'Except that' would be easier to read?
> I don't think that works, but maybe "Except for an"...

Sorry; I didn't explain myself well.  I meant 'Except that in an'.

>=20
> Scissor-patch below.
>=20
> Best,
> -- >8 --
> Subject: [PATCH v11] futex_waitv.2: new page
>=20
> Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xy=
z>
> ---
> Range-diff against v10:
> 1:  267b3c008 ! 1:  39abafa84 futex_waitv.2: new page
[...]
>     @@ man/man2/futex_waitv.2 (new)
>      +If the NUMA word is
>      +.BR FUTEX_NO_NODE ,
>      +the node number of the processor the syscall executes on is written=
 to it.
>     -+(Except in an
>     ++(Except for an

I would still insert the omitted 'that' here.  I have no preference
regarding 'for' vs 'in'.

>      +.B EINVAL
>      +or
>      +.B EFAULT
[...]


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--5lfkc7rujsgbqtjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmTLqAACgkQ64mZXMKQ
wqlkvA//W8pnbnyn/oUNq0Ga+YolOU4xV0fqE/+m/7x9mXIp/pVyDPPg//4dxiTe
Wv8WAdCWe7KyrAFHH6ErAtoUqpAGtMGl+SchcEnIPfEyJbhjHQvymoITWLi21kmM
+lYdiL7H4hbGo7mJfbXF4CUkAHonl41d/e5MQBK8VBn/NQO/aafeoT0dIpSvG8lM
sR9wOpOuOQjZU2W4wzqs5I39/sE3i8xTvgohH8MHF3wOpuOYC3wVwTU26aGRsL+J
vS3Eo/ZEXNd/nB9XB2W5E1vyoeDfzYcPXN7Vrga3w/cECZP9F6KqoyTADaPyJRwI
9dy7k2yowsDaNNYV5rFxF5HAFfcvXgNgMm7QUI9GXeHcIUYvM3HODtgLQJ79f0Md
tukOBhObu4FgS9dw6c1JQf4pqtI6MzVEMTKoxNGbgiI21jD5QShN5DHEFBhHM5U1
Leg6XKYXqtBY88j8sy1BTae9RaahPOnc3x6g7cRILNvXQ2gL5mQxtLGpfW+DG9VQ
OgNxuaO5b/h274OSD8cfTIwRbM7kfRqWxa5/64iSL/M0WmOIcXRTY2NAUxP/dezL
fwYsURQoh/QXXXxyFByW8hQec2FMiq+hIFEcNhfG2lkJ4gjeekLBW0a8ObXcr7PH
DEZWBMAaXhucJ8xQqqQ8l4876cqZnfhqsun3tktjQeSKznFNtZ8=
=O8AK
-----END PGP SIGNATURE-----

--5lfkc7rujsgbqtjq--
