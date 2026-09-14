Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755A470E85
	for <linux-man@vger.kernel.org>; Mon, 14 Sep 2026 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392627; cv=none; b=poDsrdylLhVcprD9rLZ0vOOWpqZFN3WPupIjkQw+2U3tYpl4qS7/l6x1jMAwm2pBe8gdSpFFikhCe80JBKOfJSPE3kHW2JPRYttOm85nwrr/lbH8860jGyrJeTkB1CX+7NsaIqgPhHI1ABaWdcJ0sjOHOOr/gwWd3GqgTYe0SSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392627; c=relaxed/simple;
	bh=bmw7JT/+j9Gdk5D5ytRnGTRRdQnKDNvfK4tiI8iIcn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXDjZrgRiE6h8h6EBcVhkqRHn1D1/ZryoK5nTo/rwZ+2icZBsRnhJb0VBJVhRm7tkFY4ZUbkR2JtxLpCpkQWx+uqLlr8YHnCZf7/UpCtK+GSS1WDy2MQ3clkB6DqY0EqSh88MNXwxNeKH0OYmWov/uU2aQHT8Omoqbhg24AcSho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyF20bV2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyF20bV2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D0181F000FF;
	Mon, 14 Sep 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789392626;
	bh=4cl+klUrASWGK4D1/xtVMVNxmlqUEf1SUVbmPn2j7BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FyF20bV2OVNNZiZa8rFMFhtg7B3cVakWgBZ50Gl99CE8i9llybLq2bOxuQwSx1dC8
	 M9mYS2lzLQkfQUjo2J35qw1fQbfHkOcaS6TGypR17LTWfvqdIDfzOzw4YqsgnsUJAk
	 knBwivUB8gvqWMwlurDgMQLZIjCVftTGbYMhyRVYXT0sp0y2L5J1LuNKr4uPuQl+rf
	 4Re/w/Y9kO80Y766A8PRucsPCfFxn21eF+6NYg2S8jfyaBtxRkxSE98RkbJ0OjYRPN
	 ZvE3d3utFY0WCHSAGzUPy0IMQ1UyotJi04vFFL+iiIItz1q+ZG2noDD04dJL1U4pdt
	 SmaCZJFp+Idaw==
Date: Mon, 14 Sep 2026 15:30:23 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqf1jJ1qxsTdw6kE@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="whultiilpbnud6re"
Content-Disposition: inline
In-Reply-To: <20260914122442.GA1591402@pevik>


--whultiilpbnud6re
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 1/1] man/man2/request_key.2: Add missing GNU size
 forward-declarations
Message-ID: <aqf1jJ1qxsTdw6kE@devuan>
References: <20260914111511.1610878-1-pvorel@suse.cz>
 <aqfd1_Xa_TbzE1ML@devuan>
 <20260914122442.GA1591402@pevik>
MIME-Version: 1.0
In-Reply-To: <20260914122442.GA1591402@pevik>

Hi Petr,

> Date: 2026-09-14 14:24:42+0200
> From: Petr Vorel <pvorel@suse.cz>
>
[..]
> Please drop this patch.  I'm sorry, I overlook that although request_key(=
) has
> const char *type like add_key(), unlike it it does not have size.

Thanks!

> Anyway N3207 (spec mentioned in d2c2db883) is something I'll need to get =
used to :).

There's a more recent paper with a slightly better spec (also compatible
with GCC): N3681.
<https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3681.pdf>

I've improved the GCC documentation, to discourage using several ';',
and added a diagnostic for it, which is in -Wextra:
'-Wmultiple-parameter-fwd-decl-lists'.
See the commit in gcc.git:
33c35b7f4c18 (2025-09-26; "c, objc: Add -Wmultiple-parameter-fwd-decl-lists=
")

The documentation for the GCC feature is at the bottom of this page:
<https://gcc.gnu.org/onlinedocs/gcc/Variable-Length.html>
It's easier to read than the standard specification, IMO.

>=20
> Kind regards,
> Petr

Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--whultiilpbnud6re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqn9ukACgkQ64mZXMKQ
wqk4sg//doGcvb3pwGilyhQ7m0x8jxkhjWnQZE7FLea6tZNa2g56udh47lkQotF3
9xaWIvU2AC6+a+ifqXbhL38grNOeAYbujWENM71XlQqid8z10HCzxRenXYv8NAn6
fpzrRbLCmBdkKI1Q7IHzx3pm6MlQR90AnCjujPa3zteiJO31TDCdKS/MCKVe2Wz5
2hDQEgZmxWt5hgtoEnr2EpQCK33wrNUuRfQJwTAz2YryULPkjtow313GPfT/nCfC
CunALgGGvA3QtOk8mQxTn28LCOwrgeVuyOZ/ZEKhEOx++nv0zRcHThs5gAPUqfqf
78rsjseA3xjmH5XQhek4PZL6h0v4P4OZz58T82vANeGY9qIn4bvgHVDoKKUQ7OII
R5/7xz4YG2hGugXB8XJ8mAsE6qDZJXdj75q1cP5V/xN4kJe1nrzE78LnYaE1k/a6
SIM95opUVyRIDzUU53eiPcaQ57+pi++OO7a8fYqwk01501MhLuQdzszF+DDbOpWS
408yi/xjBZSshNs+XhOgw2rMzbiItZX3+PFbyLWaiH+rpgrdA9okfQJtOmq6ZyM6
h1YtgjbY1jUN1I/1YR0vTwKliTPNHn5ZkV1gsbgdZ6MS+WzB4mTkL/s9HUP9ZLOo
V5GJzCUK9/rXsHfxU09PFQpBuOoJwY/xCKSV/xrUCeLVOKlqsx4=
=DENN
-----END PGP SIGNATURE-----

--whultiilpbnud6re--
