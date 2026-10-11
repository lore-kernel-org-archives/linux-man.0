Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57435345ED4
	for <linux-man@vger.kernel.org>; Sun, 11 Oct 2026 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791739138; cv=none; b=tOOR1Wyy3rt7xeZDDvmjIw5Yqa0NwDgZy9y/qbGxFCMKiJCuXkV3AN5+D8kLfPZrCcHZy/div0Mk3Uj0l8b/Dk8/A51jOX75Oyi26n8ZAdfSpqPgKhGnc6T9FvRglT3RH+B2FrgAHGyB8jZR8gjIX09wCXkTaI64bbxLGJ7gUvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791739138; c=relaxed/simple;
	bh=OQeZt/WHoRjVfKQQ8mXeldfAwWbZmaKyVsjs2MuBn0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbPCIU4l5yin3s4LH11cGLCp06gEKur7dBgMl7ewBUy3q9GwyIsC18/OYVNZMhAUx05Mu7HHevi88SmWRww2IRGLYPIIfCwUp5V5v3zQ7azSOchpB8MN50Va82LRtdqR4nqtGw27T2L7FvE3ZCEYKASX6h+o4H7mtHbAwywu5Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6VLDLTc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6VLDLTc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359C81F0089B;
	Sun, 11 Oct 2026 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791739136;
	bh=+gETJ0asT1DjkKTivDuOG9e3AQkG/gIENqjB+KgMxvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b6VLDLTckUBRPp97jBOQPod4CZa15zdtbseh3MeA2Z4cCrxlf02SSoBravN6o3fKz
	 7InsuSlFj27yUB5yOCGzDxfXfxPO3eMMhdwEc2M+O4nFKXc0hPU/YCVlchrHc/bVZz
	 7tAtFKHom+75LfiScCA7xkrwqe1eK5kNBf+Cb8RW82Axy5WunSKitrNNe1FbogSf2Q
	 +wHXkh3qCH14HzHVSH8c7D84yCE94sNZMiHhPUdtt9u08PjsmgB9BYe4ZIUVtkAJZk
	 aD9hamwkpU8OFI+nFGxGRkreX0mCiEp79ky4tS6IFy9QRDEPAzjGfaccjMBF+0GXgk
	 Ebe0TAb88NZqw==
Date: Sun, 11 Oct 2026 19:18:51 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?RGFuacOrbCBIw7ZyY2huZXI=?= <dbjh@gmx.net>, 
	linux-man@vger.kernel.org
Cc: victorm007@yahoo.com, t.piekarski@deloquencia.de
Subject: Re: Suggestions for an improvement to the man page "iopl - change
 I/O privilege level".
Message-ID: <asvEtnxChV2-dELG@debian>
References: <trinity-4d271f4c-4816-435f-b8c9-53eef0ff29c7-1786468770978@trinity-msg-rest-gmx-gmx-live-d7f776569-bpnnk>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ksib4ozzxwsa5gze"
Content-Disposition: inline
In-Reply-To: <trinity-4d271f4c-4816-435f-b8c9-53eef0ff29c7-1786468770978@trinity-msg-rest-gmx-gmx-live-d7f776569-bpnnk>


--ksib4ozzxwsa5gze
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?B?RGFuacOrbCBIw7ZyY2huZXI=?= <dbjh@gmx.net>, 
	linux-man@vger.kernel.org
Cc: victorm007@yahoo.com, t.piekarski@deloquencia.de
Subject: Re: Suggestions for an improvement to the man page "iopl - change
 I/O privilege level".
Message-ID: <asvEtnxChV2-dELG@debian>
References: <trinity-4d271f4c-4816-435f-b8c9-53eef0ff29c7-1786468770978@trinity-msg-rest-gmx-gmx-live-d7f776569-bpnnk>
MIME-Version: 1.0
In-Reply-To: <trinity-4d271f4c-4816-435f-b8c9-53eef0ff29c7-1786468770978@trinity-msg-rest-gmx-gmx-live-d7f776569-bpnnk>

Hi Dani=C3=ABl,

I'm replying with the mailing list in CC.  This will transform the
message into plain text.


Have a lovely night!
Alex

> Date: 2026-08-11 17:19:31+0000
> From: Dani=C3=ABl H=C3=B6rchner <dbjh@gmx.net>
>

> Hello,
>=20
>=20
> I have some feedback and suggestions to improve the man page of
> "iopl - change I/O privilege level".
> =20
> The purpose of iopl() is not clearly explained. iopl() is a
> straightforward way to allow direct access to all I/O ports from
> user mode, when it is passed the argument 3. In practice, it is
> always passed the argument 3.
> =20
> The description ends with the following paragraph:
> "This call is deprecated, is significantly slower than ioperm(2),
> and is only provided for older X servers which require access to
> all 65536 I/O ports.  It is mostly for the i386 architecture.  On
> many other architectures it does not exist or will always return
> an error."
> =20
> The (dubious) claim that iopl() is slower than ioperm() is
> completeley irrelevant, as the most common use case involves
> calling iopl() or ioperm() once during program initialization.
> =20
> Compared to iopl(), ioperm() is more restrictive. In the past
> NetBSD, FreeBSD, OpenBSD and DragonFly BSD provided analogous
> implementations in the form of i386_set_ioperm(). OpenBSD/x86_64
> provided amd64_set_ioperm(). They served the same purpose as
> ioperm() on Linux/x86{_64}, i.e. controlling access to specific
> I/O ports.
> However, as far as I can tell, all mentioned BSDs have dropped
> that functionality, but NetBSD and OpenBSD retained their version
> of iopl(): i386_iopl(), x86_64_iopl() (NetBSD/x86_64) and
> amd64_iopl() (OpenBSD/x86_64). FreeBSD and DragonFly BSD set the
> IOPL of the relevant process to 3 in the kernel, when the process
> successfully opens /dev/io.
> In other words, the BSD projects all preferred to drop their
> versions of ioperm() in favor of continuing to provide user
> programs a way to change the IOPL. It is interesting and perhaps
> noteworthy that the Linux project appears to head in the opposite
> direction.
> =20
> As I stated above the purpose of iopl() goes beyond providing
> access only to older X servers. It is a mechanism to allow user
> programs to directly communicate with hardware through I/O ports.
> Whether this functionality is sufficient for modern hardware is
> outside the scope of describing iopl().
> =20
> Kind regards,
> Dani=C3=ABl H=C3=B6rchner

> Hi Alex,
>=20
> Thank you for your quick reply. I am taken aback that HTML e-mail
> is still this insurmountable technological hurdle. I have not
> used local (non browser based) e-mail clients in 9 years. I
> cannot justify the time to set up a proper e-mail client right
> now, just to send a plain text e-mail. I am sorry and apologize
> if you are unable to read this message. I have attached a copy as
> text file (e-mail.txt). I have also attached the original e-mail
> as text file (iopl-manpage-feedback.txt).
>=20
> Kind regards,
> Dani=C3=ABl H=C3=B6rchner


--=20
<https://www.alejandro-colomar.es>

--ksib4ozzxwsa5gze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrLxPsACgkQ64mZXMKQ
wqnv8g//XJ9sFEi89XrayiV1xkNO/bkUcAcU9o7b2XPmOrQyakLl3XsiDnpSu0+4
MebJd+xlBeGaJJvVGzcuqNUJcQcolqTB0Pnp7+Om3x05N/z5vcPBh9RyCLB1GEHM
oaYLEhIYMbH1Zxb8Ci2ht7G7ujlk/d7FULL57qEnCnzHXa3pwFntQR9GZN8KqWoI
PU6tg9AeVhVxzbi9IL7+w9L8LNoevvPoHP7Q/7IH5hFYELjJu6bIF6JVO4ZOnbFX
ODAtn/T4XcSuBiCqBTkkl+Db/dcmAChEDHKwlKW34AvyvFwTTVye8TTheld9RltC
gBrtkIkt6Q7DkDfPkToNg8gi78avSur+L36aCkgl1h+lHZ1k8q20ewRObegk8j2O
MbGs09stJetAWhnS/OLLrfnc0K0C77mfYOoH5T5704eqW6BMFLdwbyagUYt3Mm3t
7EPWRcfyE92++oczPxAKOwR54tVRfZ2flDmTLn+yoKZ3CYAvouloKcLLRUddbzKA
qJEm7SwhVNVW0nECiJ+ETUCKDSV+3A69oJOP+xad8DULTLfyl9cIOI7fRhRTr/mI
cMiBiv80jjrz68MmHZwarZMP1TyO0YhMJwJvAddtj6MnB7qNIJYIPwm7RtTYDyNx
Dysbehug9HjdVWeDN59MXmHdL2ajGxyLKEb89z6ecjuxAiVKv8g=
=XnGt
-----END PGP SIGNATURE-----

--ksib4ozzxwsa5gze--
