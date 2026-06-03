Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDECC38425A
	for <linux-man@vger.kernel.org>; Wed,  3 Jun 2026 23:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780530419; cv=none; b=d9McKOcMNcw0e7a9LA+yqmIDww+Sk+Kb0HG4LsoenHQX4inRbem5Ow88nkpNHWedkYv+rNGcjL53fMywjKGq5Sbi8bc7N5C1H+yLYgJDwBIW3rTNtqL4M5WoGiOFZKIsHos5ONM5qyI3GE04vHdzL84ixfEy5+uKLDbgVefr/y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780530419; c=relaxed/simple;
	bh=NlwJMLvjXGaEs+CDL2PWmx8olyXSMJVxNwUQaBx4jPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ky0ZUTZ/mwfF+N/+ifGiS1JvieQBrLP/DzT71XdzQ36MKWr8a8rfXFyFlUwK/0J4LvH4txLE3HXVVG2SkLThuAR/G5BVEapIpZVl01BJjyJDRPoVzrgBqg4gfXQNDKxcYNAeFrHgWG/QWAjteTeLD6+NI91uURwDmjlIEsWdovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klwlLm9w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klwlLm9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41401F00893;
	Wed,  3 Jun 2026 23:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780530418;
	bh=biHQYnyEZQhg3FpbjGhfUfb/+g/6NBV2WaYfLNDVvmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=klwlLm9w3//AifVdsbijoCscgD3b/PaVlc7DHmeF7EuG0gaeCQueroP1kMZ9/UMHk
	 sM54CLfalDMEtxBqNxDO465y4n/SE2rzgHn2WccllZ7PauOZwCP7sLSF5LNtgRWWQ7
	 7FB46D7S5Ren+vDHNmeziIN/Cy5dW8TQJMAR6HICtkWAGTqOhbUpfKz+ciJfmbEGch
	 wIV74UCs7JeUwus8QC1it88+AYDQjqwzspKUl809EO03KCPHJSySWKG4o09WIIBEJw
	 GRcX4KzrceJTNGwr5M9XAHYc1QNMLBWirrMjG0rdR2ek4x7rNqfM1SaCVa8uvcROu2
	 xp+UbepQ800Iw==
Date: Thu, 4 Jun 2026 01:46:54 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v2 5/6] UFFDIO_REGISTER.2const: Document
 UFFDIO_REGISTER_MODE_RWP and 1 << _UFFDIO_RWPROTECT
Message-ID: <aiC84ZUEr3MwWuq5@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-6-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g6v4rcrposptnopv"
Content-Disposition: inline
In-Reply-To: <20260526134149.2831720-6-kirill@shutemov.name>


--g6v4rcrposptnopv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: linux-man@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com, david@kernel.org, 
	kernel-team@meta.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH v2 5/6] UFFDIO_REGISTER.2const: Document
 UFFDIO_REGISTER_MODE_RWP and 1 << _UFFDIO_RWPROTECT
Message-ID: <aiC84ZUEr3MwWuq5@devuan>
References: <20260526134149.2831720-1-kirill@shutemov.name>
 <20260526134149.2831720-6-kirill@shutemov.name>
MIME-Version: 1.0
In-Reply-To: <20260526134149.2831720-6-kirill@shutemov.name>

On 2026-05-26T14:41:48+0100, Kiryl Shutsemau wrote:
> Add the new registration mode bit introduced in Linux 7.2:
>=20
>   UFFDIO_REGISTER_MODE_RWP   Track every access (read or write) to a
>                              present page in the registered range.
>                              Cannot be combined with
>                              UFFDIO_REGISTER_MODE_WP; both modes share
>                              the same per-PTE marker bit. Anonymous,
>                              shmem, and hugetlbfs ranges are
>                              compatible.
>=20
> Also document the matching argp->ioctls bit, 1 << _UFFDIO_RWPROTECT,
> which the kernel reports only when the range was registered with
> UFFDIO_REGISTER_MODE_RWP (which itself requires UFFD_FEATURE_RWP to
> have been negotiated).
>=20
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Patch applied; thanks!


Cheers,
Alex

> ---
>  man/man2const/UFFDIO_REGISTER.2const | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/man/man2const/UFFDIO_REGISTER.2const b/man/man2const/UFFDIO_=
REGISTER.2const
> index 50064c954b81..ded57cf301ad 100644
> --- a/man/man2const/UFFDIO_REGISTER.2const
> +++ b/man/man2const/UFFDIO_REGISTER.2const
> @@ -72,6 +72,20 @@ .SH DESCRIPTION
>  only hugetlbfs ranges are compatible.
>  Since Linux 5.14,
>  compatibility with shmem ranges was added.
> +.TP
> +.BR UFFDIO_REGISTER_MODE_RWP " (since Linux 7.2)"
> +Track page faults on read-write-protected pages.
> +Every access
> +(read or write)
> +to a page present within the registered range
> +generates a notification
> +once the range has been protected with
> +.BR UFFDIO_RWPROTECT (2const).
> +This mode cannot be combined with
> +.BR UFFDIO_REGISTER_MODE_WP ;
> +attempting to do so fails with
> +.BR EINVAL .
> +Anonymous, shmem, and hugetlbfs ranges are compatible.
>  .P
>  If the operation is successful, the kernel modifies the
>  .I argp->ioctls
> @@ -109,6 +123,16 @@ .SH DESCRIPTION
>  The
>  .B UFFDIO_POISON
>  operation is supported.
> +.TP
> +.BR "1 << _UFFDIO_RWPROTECT" " (since Linux 7.2)"
> +The
> +.B UFFDIO_RWPROTECT
> +operation is supported.
> +This bit is reported only when the range was registered with
> +.B UFFDIO_REGISTER_MODE_RWP
> +(which itself requires
> +.B UFFD_FEATURE_RWP
> +to have been negotiated).
>  .SH RETURN VALUE
>  On success,
>  0 is returned.
> --=20
> 2.54.0
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--g6v4rcrposptnopv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmogvO4ACgkQ64mZXMKQ
wqmFCg//e90MJJIMOM7KqCbh3P7UvHFm4V9NLbTad4/wsqI1efMunVb9efKO87sZ
L7ZWaGrBPYy59a6AMKI9BfsIqVbS0ZHD8Udu1JGWcjn3UJFJ7StqHU/wlQyYZGvk
GMrKPG+4FH7rfTnYXy5Yts3q6HKLPeNLjpGGx3KaYog5EIswT165RUjsMceFRVVw
zKqb5+/nd351RRFk+OJfD8SxSUvywY1m2sJ61pPqo6P++gy9gvBgVZx0gnNZdJn9
bc4lhZhbtr0Do/cTaw3b0A2ugN58H1vC77rKXs/HbY0F7BAG+xkB6SDb2fqkbfHw
SaQS6Q94powYXb6pDEcl64VkoSOkFx8OOQDKCYfB49KMChKA8lYX9ujwnvG+PVSU
ChYAngrzcFGTRWe0Ntwk3XzouPzRvK63lJXwNH1GLSwxdHBBycIYaaLoIeAxeepc
Wq/rB041UIsz7+LHSlS3ctwgdEUVqhX9JI1brhSaWGflYMGPj2oqA/skW7B4msoR
bETTURfVzL8yl2Go1w8HFWnFQIeiOzwKRlH2X82WfjSrZ/n3HDO7CQGUTK7SSNU+
2v+6BMPrhYAfJz/w10D+0+AG0m6sEWOfx67/5guF5NJ2rHCHDbbxCandv9SxgkcT
JTdTDmkCT9yRQpt1c15rVYp23DmXDQ6wkT1hk8bederokhHsaRY=
=VZwq
-----END PGP SIGNATURE-----

--g6v4rcrposptnopv--
