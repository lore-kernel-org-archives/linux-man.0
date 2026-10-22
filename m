Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699277;
	b=oII2iPTZGJUu2tebmNhw8pAudAVPvZ/sscyo7TWt+o6mFBV0LtnXqakbYhlJqzyF8TKB
	 df9DQLEX3yngPRTnwn1b8b+Kija/yvH2ptioixb8epo42UzVM7lMvbNsoHjoX2j56RNfO
	 U0ewgXWxIMiFCDsWttlgdZQ9prm7PKMO10OP3U+TJkmhXx/Rv02yEPifAYdpFyAia3rqJ
	 tFfNfpgkig2Aguy1ppyHXYvJHgJiOb1HRymbVkY0xMYjFZjvL9jfGtYNFg74XMWFfZZaA
	 QncPpOGTfKU2ZXdmZcLwNfTTlTF1xsUwHdk4EwGmZeUO0Hspc9xKwvYuz+oyNNVTLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699277;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GIoCH8ZPd+mf7nUUH3q2EQqzypwsXfQmv5ieMkhzz3E=;
	b=WGPemgdqkioUofxju/fgHe0grB/IrQTJJmLjQPfugPucHNjXYYkwNAvqJjAYa/W2FWGJ
	 53QCY2kSOjE1/4pWsgVU5jE//ZMabKa2PGkJCmO5fkgbo4WIljFSBpE0AEfDfSvuJy79r
	 iLklLV/FfyoLeh59IqUy2DnBAuoAkpR8XmC7JbDL184eVSIhT7E3q6Ijdv2AfZEqGvHuO
	 gJCrhDGdPv/VctMjkuA/pcQerVhn0YGede77j3j+U1VNQYOgmf9+ETKGb4EevyKzPwxZv
	 DI055kuRlTXFCTGd6ceN33S5LSVnHF54kFGZ0vQIb3Fo+YoF34DVbMBBc1kx33SPXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N2plh/SQ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BA606A31A
	for <linux-man@vger.kernel.org>; Thu, 22 Oct 2026 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2plh/SQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608F61F01825;
	Thu, 22 Oct 2026 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792699277;
	bh=GIoCH8ZPd+mf7nUUH3q2EQqzypwsXfQmv5ieMkhzz3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N2plh/SQZlKzqSmIrk/1EHwF3LoN22JfXNWLIiGz3dOIYLP3nXNhLzJD1V2EsZUpp
	 RTFDX1xvBLn8UYjSNjE+KLu6afWVKKormCtIgrutQhxcF31tC4nlq5bCPcrSFUE1/B
	 4V9xIiNB7DI4sUDCehHmR2hM9vz6/3rhTIE0KsPOPBZED5eWtUEGCQd5BdA02Uqbsf
	 6YDxpi905fKjbniMo7dkXH12W2wwGzeopTok2ETnveRVPnJAIbwdvFjzVL5m+Ds8lR
	 qtXtVwIU+u0H/zhDYVA/dFhc+a7DfTaPNDMA36hr/IuyPyCQXPwVKlK8V2aXFbhOex
	 cFTg+aMYwFDQA==
Date: Thu, 22 Oct 2026 22:01:08 +0200
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <jsm28@cam.ac.uk>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpp6tUO5GfMFkcB@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>
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
	protocol="application/pgp-signature"; boundary="qsyzh3wa24azuhkt"
Content-Disposition: inline
In-Reply-To: <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>


--qsyzh3wa24azuhkt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
	Michael Kerrisk <mtk.manpages@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	Sam James <sam@gentoo.org>, Carlos O'Donell <carlos@redhat.com>, 
	"Joseph S. Myers" <jsm28@cam.ac.uk>
Subject: Re: [PATCH] man/: SYNOPSIS: Remove GNU forward-declarations of
 parameters for lengths of array parameters
Message-ID: <atpp6tUO5GfMFkcB@debian>
References: <79b27ba6d0eb7a511f23607a4f3612d4f6911f24.1792687206.git.alx@kernel.org>
 <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>
MIME-Version: 1.0
In-Reply-To: <543dcd09540ba941c8d3ce86dd7581bc6425c367.camel@tugraz.at>

Hi Martin,

> Date: 2026-10-22 19:11:41+0200
> From: Martin Uecker <uecker@tugraz.at>
>
>=20
> Here are my 2 cents:
>=20
> The one big advantage of the forward declaration syntax is, that
> if one does use it, one can get real benefits in security already
> today in the forms of compiler warnings and when using object-size
> sanitizer.  In my opinion, it is real tragedy for the world that it
> is not more widely known and used (and that Clang does not want to
> implement it).=20

In this case, we're only concerned about documentation.  I fully agree
that in source code, forward declarations are the way to go.  What we're
trying to decide here is whether the same is true in documentation or
whether there are reasons to do something else.

> On the other hand, we have now a counter proposal from Apple
> which would make the simpler syntax with retrospective scoping
> work.

I'm not sure about that.  There are concerns about it changing the
meaning of existing code if the constraint is not added (and if it is
added, of breaking code at a distance).  That proposal is not yet ready.

And indeed, some of those concerns are related to the concerns I have in
manual pages: if users take this syntax and start using it, they might
have serious issues in their code.

>  I still do not like it, as the fully developed form
> would be a major pain for most C compiler to implement, but
> I guess a restricted version would be ok.  Unfortunately, this
> syntax does not work today, so could be used in code only at
> some point in the future.=20
>=20
> Still, my recommendation would be to wait until this issue is settled
> in WG14 and if Apple's proposal is accepted, use Apple's syntax
> in the man pages.

Yes, if Apple's syntax is accepted, we should probably change the
documentation.  Michael thinks there are reasons to move earlier,
though.  I'm not entirely convinced about his position.

I see that he's worried about users hitting a spike of confusion reading
this GNU C syntax in manual pages.  I'm not convinced that this will
last for long, though.


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--qsyzh3wa24azuhkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmraa4MACgkQ64mZXMKQ
wqlDzBAAiein8mT3qy/5CIlKmhlzZYF/deChmdoIiOF+1TqVawQeyaqi9rflLW6F
c6vACYZ/dgTFlpxFNMbeLJyoJW9puLNxudmtd7wnrrmQ+r41FjalDNtoQJE2Y9Sj
lnsGFIQXhSU0MgciqrgvXQcriCTDnY9c/ryB+zEqQl0hDJLQikI1QHVlEl5fsdYQ
e4cB3QyS4I+PKhILBAW0RJrmcWoRBqIMXpkV43dyx9LcCmFCbDRd03t5xDrJijI5
Nz9GNs/nfXyIPSbPqsMPlOER0RDHVljnyeD09kfllA+1t9tjzXaze1r9bafF90l5
gjyrquVzt8nH3Ikw9PdXGOXuu73qX3y9mkxVzD/5DBg/BoGhuTaF8KPy2A0g4OuM
dc97TtbiiDtpQP7ix3spwHhzJco2sQVsSIehHWchh5uOD6ijpEZvf4ehMvOkrbQv
jWZQwzif1sgnqwfFQXFecsaaHngcZYwYcf2FGoirOgcDoDzTKmy4oiUt7+sIbvNy
N74TUt+HBi4Wa8BrsgzAuo6SS2s4R9qGhFL0KjgyomkJFUPBc4IlXg7/XK/PJHWI
sQnDriMgxrHdTX28uP9lrQXTyue2BIecNkrdWdUA9JNq3kmdvextC9Iu7+lWYW4n
iAwjuPvFnaS7nR4QFCuk2CpF5lNiWd0R0Kwp8N7gkMPCraaqWto=
=Yl4K
-----END PGP SIGNATURE-----

--qsyzh3wa24azuhkt--
