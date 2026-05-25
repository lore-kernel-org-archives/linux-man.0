Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA73876B0
	for <linux-man@vger.kernel.org>; Mon, 25 May 2026 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717639; cv=none; b=gxYB4Wfb1DFtw2oRsbXrnXuMUXy1+do1D/gd2XTGaQDK7vOdAD99UAbiRTvP5A4PrkpWaOytz/A+U23CMsU4zEObLPV19J1SdS3gYj09tVzZP1trCml3VCbDgW8CVIbsceWcDHPKZaNEs5378NF2rpPRSHHbBzhJmrR15N1B8S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717639; c=relaxed/simple;
	bh=2l6z0Nndwq8mjFrvcLbQrc47COC9zO/Ii5VaGestSuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrrBbWefAwKqMppUGDv2wS7JkUeAQSBkw0xP5HVl+5P14uZ02wagSCpIT7OYwyHJAYJhADFWW9tbw5IimIr4kVHBMgZBnw8Ui4SEaOSpx7X7dpZ9oHw7VbMbszMKDyBWalLOP2x35dc4a2vzeskl8tpPTg5ISXbKbcGOEIzWT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOYnsB2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOYnsB2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE811F000E9;
	Mon, 25 May 2026 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779717637;
	bh=Y4tNzb+fLW4HUOsn5CL/+iaMht1iOF7Ts+XiT9xffng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cOYnsB2NyJ2P4m+KDK7ynVc7doyIu+ppMdqgyBley+f5qW2Ax1KjA0bGqb65fUPsn
	 np04KtjiGjGbU71IqOWhrd12NJQhfHQ8dT5+St/1h3VQIC5cFBgv88YJMP+dqkuneo
	 lRSqEtN4Gq0Msh6yDefe6lLAu1o33tHI32vjsOnYVbPBQnGY2jIPlMjozdaiaACTMw
	 3HBoIIGDky0GtZ08Qbl1X8Vj7PjZ3JoV92PEKsBMtsVgWeAc7xqCq1+Ao/C2YzrSAx
	 jJR0MVZQ4YIKy8Sjfg3/KWo0WVEkYH2FQxwZTfH+Z1mjqLXp3LoD1Sgxp3l7qw+tF6
	 dh2k+4BgA2JDw==
Date: Mon, 25 May 2026 16:00:33 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH man-pages v1 4/6] UFFDIO_API.2const: Document
 UFFD_FEATURE_RWP{,_ASYNC} and 1 << _UFFDIO_SET_MODE
Message-ID: <ahRV5sZCUXVQ_fBs@devuan>
References: <20260525122816.1956804-1-kirill@shutemov.name>
 <20260525122816.1956804-5-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gxmzouvuofrgzmdc"
Content-Disposition: inline
In-Reply-To: <20260525122816.1956804-5-kirill@shutemov.name>


--gxmzouvuofrgzmdc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH man-pages v1 4/6] UFFDIO_API.2const: Document
 UFFD_FEATURE_RWP{,_ASYNC} and 1 << _UFFDIO_SET_MODE
Message-ID: <ahRV5sZCUXVQ_fBs@devuan>
References: <20260525122816.1956804-1-kirill@shutemov.name>
 <20260525122816.1956804-5-kirill@shutemov.name>
MIME-Version: 1.0
In-Reply-To: <20260525122816.1956804-5-kirill@shutemov.name>

Hi Kiryl,

On 2026-05-25T13:28:14+0100, Kiryl Shutsemau wrote:
> Add the two RWP feature bits introduced in Linux 7.2:
>=20
>   UFFD_FEATURE_RWP        gates UFFDIO_REGISTER_MODE_RWP and the
>                           UFFDIO_RWPROTECT(2const) ioctl.
>   UFFD_FEATURE_RWP_ASYNC  in-kernel resolution of RWP faults without
>                           delivering a notification; requires
>                           UFFD_FEATURE_RWP to be set in the same
>                           UFFDIO_API call.
>=20
> Also document 1 << _UFFDIO_SET_MODE in argp->ioctls, the
> file-descriptor-level bit that advertises UFFDIO_SET_MODE(2const) for
> toggling UFFD_FEATURE_RWP_ASYNC at runtime; it is independent of any
> registered range.

Would you mind separating these into 3 patches?  Thanks!

>=20
> The existing page intro already describes UFFDIO_API returning EINVAL
> on unsupported feature bits and the temporary-uffd probe pattern, so
> the new TP entries do not re-state that.
>=20
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>


Have a lovely day!
Alex

> ---
>  man/man2const/UFFDIO_API.2const | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2=
const
> index e894114bb8e2..d2819f009f97 100644
> --- a/man/man2const/UFFDIO_API.2const
> +++ b/man/man2const/UFFDIO_API.2const
> @@ -213,6 +213,28 @@ If this feature bit is set,
>  the kernel supports resolving faults with the
>  .B UFFDIO_MOVE
>  ioctl.
> +.TP
> +.BR UFFD_FEATURE_RWP " (since Linux 7.2)"
> +If this feature bit is set,
> +the kernel supports read-write protection tracking, and the
> +.B UFFDIO_REGISTER_MODE_RWP
> +registration mode and the
> +.B UFFDIO_RWPROTECT
> +ioctl become available.
> +.TP
> +.BR UFFD_FEATURE_RWP_ASYNC " (since Linux 7.2)"
> +If this feature bit is set,
> +the kernel will resolve read-write protect faults in place without
> +delivering a notification, automatically restoring page permissions and
> +letting the faulted thread continue.
> +This bit requires
> +.B UFFD_FEATURE_RWP
> +to be set in the same
> +.B UFFDIO_API
> +call.
> +The async mode can also be toggled at runtime using the
> +.BR UFFDIO_SET_MODE (2const)
> +ioctl.
>  .P
>  The returned
>  .I argp->ioctls
> @@ -234,6 +256,13 @@ operation is supported.
>  The
>  .B UFFDIO_UNREGISTER
>  operation is supported.
> +.TP
> +.BR "1 << _UFFDIO_SET_MODE" " (since Linux 7.2)"
> +The
> +.B UFFDIO_SET_MODE
> +operation is supported.
> +This is a file-descriptor-level ioctl and is reported once per
> +userfaultfd, independent of any registered range.
>  .SH RETURN VALUE
>  On success,
>  0 is returned.
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--gxmzouvuofrgzmdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmoUVgEACgkQ64mZXMKQ
wqk1Jg/9Fz8ASGTokbYOX1XSVWGS1dHbPMc3pwu3Xy8EFHoB6LL2jvWzy6Uoo/0M
e2L3AXQ2jzfHmaS4kUR6R3X3QUl49IL0pvWXDjeJu3orddNbHjN/bjEyeCdBlsTc
McIj+OufpXN+pLiRzDr0KPVvt6VqIM0ThXMA5LcJuvnhAnkuLFl91w7h9L3JjPi2
4vT2qvdXY0jw7HVfyuovxMGIC8FdQyTfbehKnDEA5woXTu7UfvtWY5xtjUB7+DxC
iQ20JDm7tvAX5r5Xa7URrsph4+GC1mIeHWr1nkyjokKLeb5qnQT5h6tsxl4DiDvD
nsFqITLT3dtYyLBKN2OcvSe5OC0yzAEYaGBNd3hjTlrHHbVSqIsO7qotrokyoziG
AgIEkLZnDSg/plpc1AQS/f/wzm643t87BewAdUsEKldz7FKj/JVwP6S6l1/W4/at
8OO+yFAOub1NbV2fcZSrFr9K4I/MdXmPvXNhSO1Al9Uamq3H/SlKZ92N8Ahn/sdu
BEVvAsQspTsW288M+h87mYEgTxMCAmz6nwGjLg/n/Tsp8Vg21rDhSOkrBYFrO9TE
jDweNLIQ8YGon7eHjZVnoc3R7PGnsiPC8qFF/WyWfXvXRuNs0VcKx8JbfpWfyNmp
4V0VMle3s8rap+juLrN3I6mvbA2UXd3+KD0lkgjTQuwKc0rKQFU=
=zhYn
-----END PGP SIGNATURE-----

--gxmzouvuofrgzmdc--
