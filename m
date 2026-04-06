Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA82F7AAB
	for <linux-man@vger.kernel.org>; Mon,  6 Apr 2026 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464087; cv=none; b=jRCrLMNuhRJ0MBiBeL6lbgVVDOqv8HjOOGIUPHCcMaCDoWARCJuFfyRstU6QB/K9FWE9n0y8+qkLgNjvAaZoZGptZdd8ZHOAkudb0voWVi5REWQq7pJ+sXy6izvvVgiP7r94sf5FBj3Gz93rMEUC0DTuvCcanFCvSiZ5F/ajs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464087; c=relaxed/simple;
	bh=CQZXW5SrnbwKoCiI88n/murKZ2DpZdwqzIOqsWbdb/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8uu7LUKJoi2oHDa35E6oaT426SwF7nRm4WPgNCXeLSWaYZYz1XULmrnylbruZqcXaNCrpknXFU5wjA2j1NBTjRqblReoB3NqfOWinNniR4Cj2FHhm8wpHlqhM0JwthujRbpej3QMIBGIg81lgxUwSuOniPeRH7XPdc+p92JhL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7SMTVtz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7SMTVtz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC469C4CEF7;
	Mon,  6 Apr 2026 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775464087;
	bh=CQZXW5SrnbwKoCiI88n/murKZ2DpZdwqzIOqsWbdb/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7SMTVtzyJeSBtctra2uyw3UvWxohDJLso5EwJygSJkrRjplfDkfM5Q/1n2fMKCfl
	 LkxMR7lj7BagkhIQv6xmEC4T7IyzzuQtnk2eXa9qaF2gU7iEDRJUM/wo/1X29M3g6G
	 Vi4SrqCGcaBr8p2G5Evd5KICOi7/HZ3Bmelyu3lmSFNib62WWUomms+9iMq1+4BEeK
	 vforYWG+LnTVhX1KPQhTsbRwlrO/UfbC61U6dVg2AMFeZFqDHF6OAiSNdX0NM9WgC3
	 srjZuCpdUTxiM2Y5kmJyXx2FtliAcIGUMR3bjxIe5eok3CYYStW6b7ZtQ/QJ2G1ebN
	 mZesDv9FNXtxg==
Date: Mon, 6 Apr 2026 10:28:00 +0200
From: Alejandro Colomar <alx@kernel.org>
To: vursc <vursc@vursc.org>
Cc: Mark Harris <mark.hsj@gmail.com>, linux-man@vger.kernel.org, 
	libc-help@sourceware.org
Subject: Re: [PATCH] man/man2/getdents.2: Fix incorrect argument type
Message-ID: <adNtfcGsNW9bsZyH@debian>
References: <20260404074909.92900-1-vursc@vursc.org>
 <CAMdZqKGyG3vksBugjZ+WOt6xV7dqtc40L-vESmoAB9HZHfV7FQ@mail.gmail.com>
 <DHLTV0BGLRPZ.3LJZ9TGV7U7YF@vursc.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyphjlfjcztgjfdp"
Content-Disposition: inline
In-Reply-To: <DHLTV0BGLRPZ.3LJZ9TGV7U7YF@vursc.org>


--zyphjlfjcztgjfdp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: vursc <vursc@vursc.org>
Cc: Mark Harris <mark.hsj@gmail.com>, linux-man@vger.kernel.org, 
	libc-help@sourceware.org
Subject: Re: [PATCH] man/man2/getdents.2: Fix incorrect argument type
Message-ID: <adNtfcGsNW9bsZyH@debian>
References: <20260404074909.92900-1-vursc@vursc.org>
 <CAMdZqKGyG3vksBugjZ+WOt6xV7dqtc40L-vESmoAB9HZHfV7FQ@mail.gmail.com>
 <DHLTV0BGLRPZ.3LJZ9TGV7U7YF@vursc.org>
MIME-Version: 1.0
In-Reply-To: <DHLTV0BGLRPZ.3LJZ9TGV7U7YF@vursc.org>

Hi vursc,

On Mon, Apr 06, 2026 at 05:37:24AM +0000, vursc wrote:
> Should I document the dirent64 structure in glibc?


Given that it's different from the kernel one, I think we should
document both, yes.

> versions of struct dirent64 in glibc, in
> glibc/sysdeps/unix/sysv/linux/bits/dirent.h and glibc/bits/dirent.h,
> and the latter seems irrelevant on linux systems.

Yes, I seem to have the former in the installed headers.  I don't know
why the latter exists.  I've CCed libc-help@ in case they can help.

>=20
> And I'm not sure about the wording. Feel free to reword it as you see
> fit.

The current patch seems reasonable.  If you add the glibc struct, I'll
add it, and later maybe I'll tweak that page to look more like other
pages.


Have a lovely day!
Alex

>=20
> -vursc
>=20

--=20
<https://www.alejandro-colomar.es>
Use port 80 (that is, <...:80/>).

--zyphjlfjcztgjfdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmnTbokACgkQ64mZXMKQ
wqlFaQ/+KaFU86zBU9K/Iq3zNgXHS4d3dYnpyZkD1MGwFmZ7yZszzkbUcPRUAemD
0Aqvr/sdVAaU0J9yNR9c3YhbEQThXNGcc9qrSXxUzMUPaSCv2zON8YU4+Ia9DFHp
quyUAIjoTYs68Rre9oQd6u7XUw1ffl1XLU0A1dQIApZWfLPBMJXl8E2uDoRUby0V
PsJxUhymM39IuLUqS+ku4wFVsV9TdzSa3V1j2RE7IENdQalG79DP48f0BmkBWPEP
PAI7MRHUF1fBg3xUVLg7l7mHZI32hwJw+VnDYwVusx12XnjhKF1FcjD2hAWRYmGr
buY4414qTSTTyEb7Lw2SeeCWyWG6vABbgi1dcda8lpQprwgz9w3Fuxuk5dCl9QW+
B/DzQb7NT4qYQVRxweb8hVGkRkTewk8wOuIHiUl+gJOqcgNz/UoKcGuvFC7TwQKQ
FPuo26f7W/N6/vP2QmZQyTk2mxGSLjoBXOnNO9iaXq7dHmRz4IpV5lxrScVO8Sr4
9ThVvyWxYJtuTQYfZe/79f0L0scU1h0Ss7H2608tI5ee7EXW4kQFUyeZVqBKGtSF
MlfAGE4Rusc6+w9XqimGomLDSH8MI0AqHIWlW1LVrIQ94kXagUoR4Uv4nFMpcm3B
czahkgEric+OzudYIzx/c/Cp93VjFBOURl65xnuhl/Wu+oXBeuI=
=Vyvn
-----END PGP SIGNATURE-----

--zyphjlfjcztgjfdp--
