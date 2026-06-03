Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12633259C80
	for <linux-man@vger.kernel.org>; Wed,  3 Jun 2026 23:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530197; cv=none; b=afEEkBAwzjPBy1JNtnKjwzQUCzWs61al+96ZIDE738MlJiaV8K1cVcphCDpSPPZZU/ddia12FPGmgPB0QlgzXWp1JkysuedBmo+TJxH3UacwjTOtko/TYzfgHpeRQjw/fJNDPqVPC9+FdyPctYmJboUYvvXiYp1G3kNIPrvGeMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530197; c=relaxed/simple;
	bh=mhwXtgXx75Q6s4/kq/hLQykj368TdPjWBPsTalBvcz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/2rYVEFgy7gFSBhO9J1qTlbB8/F7aIDa8TKZuIDMJsYj79aGb7P8YAbls+/QSNL0nSx+x7FrF/Q/N47XgKrsH9DjFsGFz3elIXg49ezM4/tl2yJ7r0oZUgYP/bhQcRBR49YPT8vUCQzOzuwEZSD5nE9uNGyC922wA2O5d+YVSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2SxwCAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2SxwCAX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169921F00898;
	Wed,  3 Jun 2026 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780530195;
	bh=tJOCvVpZsw8l7bsR6W+LUIVzrEEh13iW9pGyOSTcxE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2SxwCAXl+z/vJnA046cxZ1amLOruSa9uLUMV8rOFXG4AqCX6R9OWmpTjrhsKEAia
	 DSlJYr5I6i9QkM74i0RYc4O/XY7yY4i4CNcJmSFwWy76yGcje4nFO9YQkE927v+DWb
	 11eMRvo98J8NMWSpEjydwsbkm56t6lTBlovhQxaSaNdhiXsaW4TOGtR3jwSSxQn1Kc
	 L9P8nXnB3Sc6ysfdguKsam3YGWz2LKvdEVt7KiZvU2WZlBPZaDerjUxUBcC/l0hp8p
	 cv+cyi5m7vYchI6w0W5UasLZ6lYaEnfi/rqyhpsrKi3xsFkyfBUAlh4PQmq8vvIiHG
	 Rq1Nb0mzF40EQ==
Date: Thu, 4 Jun 2026 01:43:12 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v2 4/6] UFFDIO_API.2const: Document
 UFFD_FEATURE_RWP{,_ASYNC} and 1 << _UFFDIO_SET_MODE
Message-ID: <aiC7-UNDrFjWt7oT@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-5-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wunyxer3z3xur6ve"
Content-Disposition: inline
In-Reply-To: <20260526134149.2831720-5-kirill@shutemov.name>


--wunyxer3z3xur6ve
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v2 4/6] UFFDIO_API.2const: Document
 UFFD_FEATURE_RWP{,_ASYNC} and 1 << _UFFDIO_SET_MODE
Message-ID: <aiC7-UNDrFjWt7oT@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-5-kirill@shutemov.name>
MIME-Version: 1.0
In-Reply-To: <20260526134149.2831720-5-kirill@shutemov.name>

Hi Kiryl,

On 2026-05-26T14:41:47+0100, Kiryl Shutsemau wrote:
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
>=20
> The existing page intro already describes UFFDIO_API returning EINVAL
> on unsupported feature bits and the temporary-uffd probe pattern, so
> the new TP entries do not re-state that.
>=20
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Thanks!  I've applied the patch.


Have a lovely night!
Alex

> ---
>  man/man2const/UFFDIO_API.2const | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2=
const
> index e894114bb8e2..46ee7e31fed9 100644
> --- a/man/man2const/UFFDIO_API.2const
> +++ b/man/man2const/UFFDIO_API.2const
> @@ -213,6 +213,30 @@ .SH DESCRIPTION
>  the kernel supports resolving faults with the
>  .B UFFDIO_MOVE
>  ioctl.
> +.TP
> +.BR UFFD_FEATURE_RWP " (since Linux 7.2)"
> +If this feature bit is set,
> +the kernel supports read-write-protection tracking,
> +and the
> +.B UFFDIO_REGISTER_MODE_RWP
> +registration mode and the
> +.B UFFDIO_RWPROTECT
> +ioctl become available.
> +.TP
> +.BR UFFD_FEATURE_RWP_ASYNC " (since Linux 7.2)"
> +If this feature bit is set,
> +the kernel will resolve read-write-protect faults in place
> +without delivering a notification,
> +automatically restoring page permissions
> +and letting the faulted thread continue.
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
> @@ -234,6 +258,13 @@ .SH DESCRIPTION
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

--=20
<https://www.alejandro-colomar.es>

--wunyxer3z3xur6ve
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmogvA8ACgkQ64mZXMKQ
wqlarQ//eMAt6WsJqSanByepNV8+Cstsgy3LY20DPwoH0PdSVVLpFsXpDMSntB9r
76LADHa0ruwhClGSdIQ/K8aE0E4lbbfpdMF6DAVGcCiNV/tB7Ij8l5eZWraj+Ct2
KsT1p7K4qmO5RRsDP87qUgVRPgAcYB3AOn+DouJnTV3/8c26fkSyMH6ZQQK+VzLy
2ZYd7istnBhAuxAPNt7mUyz9OwtE8R0qqS/i8fkQJYv8BA1MPxFk2uPf7GVbHAmu
QX0bIXxCPHpPNfejwLsXNTONohQUROGihZyqHOzxeN2sd2CGiKhPv64A+HCOrLDA
CUrGdknPQSZAVR4tiGf42Jm3ym3gd577KCTiiZprklpzzr54gQg5y60NHHsW0Ifp
8btLf6YrDFDv4xfn6Q+z9HH+Jjr4nB5uejle6vkXjcFB1n30+w4FA9nr0IG+1WPY
yHTN+xgo3sTS7uQRzuY5woQGkuUvYpyzykVy+Ww0h4ObP3LGPye4SbrelJmTdoo2
SP3EQcU62qP5f3tcd8lRSbXkzAmM2RRSAqK8ge5jB7xwODbW7ED2RYjJSWNU9pVP
OBUbYgHGY4aX6HKZNxyUOjLldA53dfV2rgAJv4fPsz79djXQpNI2/jRoU1JwHZVK
OCCskVAkXClfLKzaLC+U5mTgDMoD0QnIBiUIG/lEv6fri6LdrP4=
=2JWI
-----END PGP SIGNATURE-----

--wunyxer3z3xur6ve--
