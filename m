Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4165451992
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322051; cv=none; b=VdwRbvQShe6xm/yYfhyyH0vhJIW+2rucijMjoprOhLmz5N46cafB5R665smrCBdVQ+1jUfNGOgN8djCG2DLN9G6x1QYz53999NTQtAza1fY8+4XeAm5OwVZ4PHUSFLYM0Mc6NUXeIwce6Y+UKC5+QrTmAz26BFTQ6sG7eXymPxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322051; c=relaxed/simple;
	bh=Y0xY5J0nX1xyVUG2EENgNQA7oBQFzgYje3AYpCMVkz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs/FofrX77aedeoy+fVrPPqHc6oMlCxrviES9c45XDvMas6TLBdnOmq3Rn2zyl8nS615vT9m9I4WN/tXRFMG2mDBLsyFqM+DmGUOSqvAsBcugdA3NwyIZ6rkkzFS1mJZKq+WnzSJdqkw8GCssF0US2RNed9wqmDMFS/3gK5kc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCGsMwE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCGsMwE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F9B1F000C5;
	Sun, 18 Oct 2026 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792322050;
	bh=JU2htiEnzqt1qCJU2Ls3cWYJWOHjL3Uc6cPyo/6XsKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CCGsMwE587EZMGVAg/vYY02zzVExbC8jemzUiZ8sac/tbIgHRyWUY1CNEUKnvrcmc
	 b6fTXrYmLBl+bqj6nXdfmxKqEL6KZ+5UOKW8Ag339BidxvoUUlW8Ov/ZrT2SJOnBSa
	 5AYAoXhAs2xA1rZA4SG/X2II2PWX7+GhGpWhQBmVciIlOMuLRcImYpO1vXgkfCvqUB
	 Mef1Sm3nTWuATt47sEphhvnrK0WEUCFS1AL140e/7nYEKX6tXahajfdZCaNy3CbPYj
	 QkfFNcRLBJvZgT9NShKBx1A3S+aCNQ64kqvDFgWQqL1+K12W1aCa0wfUWlcvGiOr+i
	 BMWjgb/OjeXzQ==
Date: Sun, 18 Oct 2026 13:13:26 +0200
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 05/24] man/man7/sock_diag.7: udiag_wqueue: This is memory
 in use, not memory available
Message-ID: <atSpPVxVogMvzL2t@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-6-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sguqqjan7rawjrni"
Content-Disposition: inline
In-Reply-To: <20261016173139.13076-6-gnoack3000@gmail.com>


--sguqqjan7rawjrni
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH 05/24] man/man7/sock_diag.7: udiag_wqueue: This is memory
 in use, not memory available
Message-ID: <atSpPVxVogMvzL2t@debian>
References: <20261016173139.13076-1-gnoack3000@gmail.com>
 <20261016173139.13076-6-gnoack3000@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261016173139.13076-6-gnoack3000@gmail.com>

Hi G=C3=BCnther,

> Date: 2026-10-16 19:31:20+0200
> From: G=C3=BCnther Noack <gnoack3000@gmail.com>
>
> For non-listening sockets, sk_diag_show_rqlen() in linux.git
> net/unix/diag.c sets udiag_wqueue to unix_outq_len(), which returns
> sk_wmem_alloc_get(): the send-buffer memory currently charged to queued
> outgoing data.  The value grows as data is queued; it is not the amount
> of space remaining.
>=20
> Fixes: 4f6a0a4a (2016-12-07; "sock_diag.7: New page documenting NETLINK_S=
OCK_DIAG interface")
> Assisted-by: LLM
> Signed-off-by: G=C3=BCnther Noack <gnoack3000@gmail.com>
> ---
>=20
> Notes:
>     Verified in kernel code; the udiag_wqueue field does indeed have these
>     different semantics -- it's the data already sent, which is still
>     stuck in the output queue, not the maximum size of the output queue.

Not trivial enough for me.  Please CC the original authors and also make
it more obviously correct.  It might help showing snippets of the
relevant kernel code.


Have a lovely day!
Alex

>=20
>  man/man7/sock_diag.7 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/man/man7/sock_diag.7 b/man/man7/sock_diag.7
> index 35a6d5a80ffc..8f8b28b4404d 100644
> --- a/man/man7/sock_diag.7
> +++ b/man/man7/sock_diag.7
> @@ -248,7 +248,9 @@ the backlog size which equals to the value passed as =
the second argument to
>  .BR listen (2).
>  .IP
>  For established sockets:
> -the amount of memory available for sending.
> +the amount of memory currently allocated for data
> +that was sent on this socket
> +but has not yet been received by the peer.
>  .RE
>  .TP
>  .B UDIAG_SHOW_MEMINFO
> --=20
> 2.56.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--sguqqjan7rawjrni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmrUqdUACgkQ64mZXMKQ
wqkYqg/+JDP3RewOCQ6qQxfRei0rCAxJdT9JzRvnwc6ncXzHDEdsJY3hUbclGuh/
pCiEVp0g7HhWrBfwodvDFmtc1t6cN3R3sDN/s0xxikhZLQuH/a40qqyt77YeM3oj
cefaX+NauOBkZNm4cs5Hbog2h45KjQnwM5PQrl4u48fwOVjd7WQ2HZ+X2WYbA8kx
6rUWOEFhGRBk4/VAu6ODo/fiEVZNjG0Rkr1NAvZRcWBWwGbnHAeVxTtCKT203thE
e6KkkkLnMGKX0/27mjaUjk/Vr9D+tC7ZEo4NJzQOdyj9Nj6H0SoJEXBk9qshRdzt
rdPk00bCCNvqYf4h2PQepNXn0i6+cfcQoGWxPbLWMk8dmVd12zhKgfdHLLAM47Px
RL890oC9wAQWS1HGCagY/WOir1IqFyw1G3JscdJFebOZzzzWuFo4/B/VrUymy8cV
yaHDSyRTvFof1ZCU4lygdimE1RxNIoeX9tzipyU/bfH1hpaVz+TlExHrIbjj4h5a
7fbhd/FlpNbug9lh9jlcX0PmB8botLR17QKW1mEVw2QHJZiBaTvmSFhIuvEaqevL
CsnOPlfZBgLya0r84XQoKTcFUwLXkbCssX/W0c1ZPnCjr7HMqn0OK59CD6ZMPRaa
TQysmAnWGZXQGlMCDE8QarBrFnCXXyXoobdqrLJv2MpyKqgrARA=
=kma7
-----END PGP SIGNATURE-----

--sguqqjan7rawjrni--
