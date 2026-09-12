Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A7532B111
	for <linux-man@vger.kernel.org>; Sat, 12 Sep 2026 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789251859; cv=none; b=BFkZJLzhMiItimzrp+l3564hf7Ro3WYTwSww4M5OPoKKAMi/f+wjiuYGhW+K+LWP+CV4QyzEmhLJBbrFfrDexhmiL9QWuK69sL4Te6UdAtSx9GbR1Fx6wJ4DFNQQ3mfPQucrysIyMXWK1+TS2W1QLjBNwUbz67qlkB7qmb5/PGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789251859; c=relaxed/simple;
	bh=vwvbKfoDOEsDKPyDX7YUq1fzJZdwguCWMFM52fF+z5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVJVTeR4owY0ouXobP6ZeM/zq0DpxQGdjmw/hfTUNRx8oXmWV5/YqV4sx3+GVClCblSLV6PK7W6mQ8U/8+iQm2BN/omwiz5yPQbwxC6BQ6pieHWQ1gfNKA73hCRTxVrrAmJCNzyY93IJdtLF9+wD9K3UgRvotzUW2ASiXgBM5/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADIdz9hh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADIdz9hh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A411F000FF;
	Sat, 12 Sep 2026 22:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789251857;
	bh=S8GoTa4Vqo136yNCiI4geIPgHOvfDb8URLTJCaFnDYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ADIdz9hhj229hgk+ZvOyIU7KRUQ/gr2sWuXm8MYt1Ds7PX5dgT9dFI/FzgVkOML0G
	 xPOjReTsJIBi2SKRuZB3QY5AUiCusWX+0aEzeG3pzq+5K/y4ytn3FOQA7e6Fgr2WO9
	 71/HTTvG6j3I0KOGT+EGfv/k3CZOZgwNFlrdv9ye23XzLN/Zd5lwKmip5ySBZ84ONs
	 Bi2g7wCVTS9KQt9AXhatGy13OPv/LHY2s9d7lHWQ1JxJ7BDcuQ6WSQAEpR2iYErmvn
	 SnzRHtsuIHa3grQ2C0wubPPdwX4dU7ckjgbwzoJPWJCxW73DpWCDfuLZC1bjoYaBjr
	 cVT1z0nD1fX5Q==
Date: Sun, 13 Sep 2026 00:24:13 +0200
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel.@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqXOgqne-v4GtglY@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zfl7hxirzhtde2sb"
Content-Disposition: inline
In-Reply-To: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>


--zfl7hxirzhtde2sb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: astian <astian@memeware.net>
Cc: linux-man <linux-man@vger.kernel.org>, libc-alpha@sourceware.org, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel.@vger.kernel.org
Subject: Re: ioperm(2): confusing terminology
Message-ID: <aqXOgqne-v4GtglY@devuan>
References: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>
MIME-Version: 1.0
In-Reply-To: <DLDOCNQUCW9N.3GGL01BMV0HNG@memeware.net>

Hi astian,

> Date: 2026-09-12 22:00:57+0000
> From: astian <astian@memeware.net>
>
> ioperm(2) says:
>=20
>   int ioperm(unsigned long from, unsigned long num, int turn_on);
>=20
>   ioperm() sets the port access permission bits for the calling thread
>   for num bits starting from port address from.  If turn_on is nonzero,
>   then permission for the specified bits is enabled; otherwise it is
>   disabled. [...]
>=20
> The use of "bits" here is confusing/sloppy.
>=20
> ioperm is supposed to enable or disable permission to access IO ports
> for the calling thread.  In this API, the "permission bit" (singular) is
> really "turn_on": 0 to disable access, non-zero to enable.  However this
> description refers also "num bits starting from port address from" and
> "the specified bits".  That seems to suggest that IO ports somehow refer
> to "bits" and this API controls access permission to them, which is
> bewildering.
>=20
> Searching around I have seen that other versions of this manpage used to
> say "bytes" instead of "bits", which is only slightly less bewildering.
> Ports/addresses in the IO space refer neither to bits nor to bytes per
> se, they are an abstract interface, like a syscall number/index.
> (Architecturally, in some cases, these indices may in fact map to
> processor registers which may in fact be portions of a contiguous
> internal memory, so in some cases one could correctly say that the ports
> refer to "bytes" in such memory, but this is obviously all very
> low-level and microarchitecture-specific.  I think being aware of such
> details actually makes this description more confusing.)
>=20
> Apparently the reason for this confusing description is that for Linux
> ioperm is a syscall and the kernel implements this syscall using a
> bitmap with 1 bit (permitted/denied) for each port, in a contiguous
> sequence.  See ksys_ioperm in "arch/x86/kernel/ioport.c".
>=20
> Thus "num bits starting from port address from" actually refers to the
> bits of that bitmap: the bits [from, from+num) are set according to
> turn_on.
>=20
> This kind of implicit reference to implementation details is wicked.
>=20
> Suggested change:
>=20
>   ioperm() sets the calling thread's access permission for num ports
>   starting from port address from.  If turn_on is nonzero, then
>   permission for the specified ports is enabled; otherwise it is
>   disabled. [...]

Hmmm, sounds reasonable.  Do you want to send a patch?  Or should
I write it?  (I don't mind; just asking in case you want to do it.)

> PS: Oh, also, maybe the title should say "set input/output port
> permissions" instead of "set port input/output permissions".

Same here.

BTW, the manual page also says:

     This  call  is  mostly for the i386 architecture.  On many
     other architectures it does not exist or will  always  re=E2=80=90
     turn an error.

Is this still true?

Another issue:

     EIO    (on PowerPC) This call is not supported.

Is this really true?  Where this is not supported, I expect ENOSYS.

And yet another thing: should we document the parameters as being
uintptr_t instead of unsigned long?  They are the same exact type
always, AFAIK.  Or is there any system where they aren't?  If they are
the same, uintptr_t will better document that they are addresses.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--zfl7hxirzhtde2sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmql0QcACgkQ64mZXMKQ
wqmvkw//YkGI8ADNQ896tjbHonyFnm+TKTinbh09FsBD1532dsZddCE0i+aR+1yU
tBNFSlzx4x3ZGxUizjsT0zWtecyyZp++IX9VKYZGNfOZKnA4Lvo6WfnPbZGXRzAy
9W+x6j1Qz7apwQCEEEWD2aSkMtTXtC9IBpalPdtVs2tXfaUoe3Sd+mvezmE761eb
tT2ecP8VarUklzEzwxet1PyZeAFtu4NI7g5G24exGpDs7gvjuGWHKMN5+YxeYS9P
1nVNWxCkTRteeHP1AKapUNy7VWwnjv1bo4q7ZQoWdnMocB36A4W2+RqibLkD7ECc
1/j0cnojb0at1CMQCAEThQb2HV36aIlFnU3i8OmXeqA8RQcHtt1IaN7yt5hLBJFx
OEGozdHWZcsYLG62Do+hI+RehWbdWQhCo7jDif8JMlPbZRQ272Ysvv4chZfqQeYB
JnhZrf5ldZzPzUUt8r59UWeftDzlcWPGpkwyZs3M9hcrr+Tfxo9B2dsUC/z10AYd
r6fuBKTwqTpEJO6sPNJad5NHHYigl4bKm6EajCqZJ6PrGuU0UrA5aZ6jgpjFsyod
vTIx1p2mUtf25FCpH1MErJlHTe8GsFEGv0q60IRwJJjzMSqGj5YT2EEhA41dEsZf
Rc0JR2EiU6MawAjFljaiaTyYQ5uA7J7u7r8/pWiP4caP3rZQROY=
=V19W
-----END PGP SIGNATURE-----

--zfl7hxirzhtde2sb--
