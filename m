Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A43AA9E2
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027077; cv=none; b=U+cHN9DOT0P75xIU5LO5u6h4RyWxN0I8mXn4Fcz3OX7NnIsNCK4jUw8OYmUWVtVAemnxOFzekYROzfTsXHNAfDb+YnDYmYuoDheDVBssjADhBXtMHVcPeC8FAuw/sTkjM4IJVbFnkK5kwZ8tVwbqiYVQkiu7L6/WSmtvz0uf9bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027077; c=relaxed/simple;
	bh=CZrFvjAsC9M5TFzPcXs0WhV1vH54MrdGXloWnyuQZiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG18b+0+85ka3cuRldrmx8O1Ol33gfogEXbUYeFEjayt1KOBwsIdJW+PB5ICRm5EZwNTy5RSzHKeHL/rTh5H/4K9c1xn9+DrjEvYAkagJ//2agEABwG/iKF7PWG75EafCxNbR1fiVpPwOlGoKisxQvzRioyJU27jUiCNCSYjFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFTclHOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFTclHOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DE71F000E9;
	Thu,  6 Aug 2026 14:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786027076;
	bh=UzS1hsKwkzo02E07ecNpADa62yJHs14aDMBpuD1corw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FFTclHOLmq5AQ9zQ1IgViHpT3AwGihthPrbc2vutYgQCO2qXgK3DJmfDZimIUK0kv
	 0aZS3WAA6qbCMTdQiB5sJ1hpFmM0FvVBx7icD10Ku7rSJxqooF/WUm+ISrC806VXaj
	 3jRAYJ/AlCknDHaqYNKx+9Z2qB975pst9nrvolpgNyFOX8pCtxS2bVUZSnVvjaaGSH
	 A6uFCrqH1MstNLPaoaRsyxqxw/ytcL2UrXxFZJMaTSPpze59QUZ0c0x4AxLLnu4VWC
	 t6ZydGZ1XhCyHcYygXqDiwJNJ3w1FrQaTnDqv2fKRykJm1+LEdvr4rFeFUzWnbUlWq
	 LH+nCw3ihbvvw==
Date: Thu, 6 Aug 2026 16:37:53 +0200
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anSaCsgYGOPtoDJ8@devuan>
References: <xn5x1r57t0.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6wacyb7up5x2mz42"
Content-Disposition: inline
In-Reply-To: <xn5x1r57t0.fsf@greed.delorie.com>


--6wacyb7up5x2mz42
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: DJ Delorie <dj@redhat.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
Message-ID: <anSaCsgYGOPtoDJ8@devuan>
References: <xn5x1r57t0.fsf@greed.delorie.com>
MIME-Version: 1.0
In-Reply-To: <xn5x1r57t0.fsf@greed.delorie.com>

Hi DJ,

> Date: 2026-08-03 15:21:31-0400
> From: DJ Delorie <dj@redhat.com>
>
>=20
> Signed-off-by: DJ Delorie <dj@redhat.com>

A few minor comments below.

>=20
> ---
>  man/man5/tunables.conf.5 | 132 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 man/man5/tunables.conf.5
>=20
> diff --git a/man/man5/tunables.conf.5 b/man/man5/tunables.conf.5
> new file mode 100644
> index 000000000..44b32d40c
> --- /dev/null
> +++ b/man/man5/tunables.conf.5
> @@ -0,0 +1,132 @@
[...]
> +.P
> +The file may also contain
> +.IR filters ,
> +which limit the tunables following it,
> +up to the end of the file
> +(or end of the included file,
> +or start of a new included file)

I'd append within the parentheses:
	, whichever comes first

> +or a line with only
> +.B []
> +on it.

So, this is like an end-all-filters directive, right?

I wonder something: Does a filter end previous filters, or do they
compound until a [] ends them all?

> +The syntax is:
> +.P
> +.in +4n
> +.EX
> +.RI [ filter : pattern ]

Since '[', ':', and ']' are literal, let's put them in bold.  Thus, BI.


Have a lovely day!
Alex

> +.EE
> +.in
> +.TP
> +.B proc
> +The
> +.B proc
> +filter limits the following tunables to processes
> +whose name matches the pattern.
> +The pattern may be an absolute path
> +or just the base name.
> +.SH FILES
> +.TP
> +.I /etc/tunables.conf
> +.TP
> +.I /etc/ld.so.cache
> +cached copy of tunables
> +.SH EXAMPLES
> +Example configuration file:
> +.P
> +.in +4n
> +.EX
> +glibc.malloc.arenas_max=3D5
> +onlysecure glibc.malloc.arenas_max=3D1
> +\-glibc.pthread.rseq=3D1
> +[proc:/bin/bad.program]
> +\-glibc.pthread.rseq=3D0
> +[proc:some.program]
> +\-glibc.malloc.mmap_threshold=3D65536
> +.EE
> +.in
> +.SH SEE ALSO
> +.BR ld.so (8),
> +.BR ldconfig (8)
> --=20
> 2.47.3
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--6wacyb7up5x2mz42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmp0nDsACgkQ64mZXMKQ
wqnl3A//bJZRMGgxSLRxl9TwWW/PsWC2Fz1CakoMq3kdndqPclclZN+9Vxnm3Rgn
MgB+phHj1N+04Mff9WRq7D6UDwnWXuMTNSSL25g7NNhwpghNKExI5oZVxQRE68MD
czvX3op6IGjhLin1pr/zINmiATVeHw+ylo7asifCBFf/tgcCPYV5NJPU1xnPRpyS
+g6urGfUVUbCYcHzmjyEVub4v43qI+PqUDd620yCK6SxKj2zhRHdn3e6d/1QgH4l
s3LYx1EoubMskqkmq/SEtXy6+UhTiB1V/vD/K1OBuNMoLB5jIbmseS9z7JQGIF2o
wl13SzHa4aWkQJ5fUxgMyogboALS08lDkiqk/ZWqEAzp775V5SJ5aXI6LEx4sB2P
ZLRQ0QeauISgV+DJuzkaUuSIkKxb9po8IwjoqQjBj1VBKe+cRuGAvpovZGFv+kKn
tgvzVo7nMHvDhTWlvs8IGdGLTz4E4KuHRRhcU1XHdj9y63/s2taifEe2i9H6CHDh
OmMmD+FeD6hGI8VvqkTGQ3GC62J5UL+UNiGf+hB+PbiKBxSOZK1rDEpX61WtBsQ+
7yb+COui8xYGWNX1F9r9esWXSX1Gmj2bOLfY+tslJUBCwPIsHvyzmeTStnrP+0Lk
ogY/dvZ7x3yZzmsoleIUSVHZP7u4nsNdRrDbvrA0ThRrJbDSn0o=
=vlO9
-----END PGP SIGNATURE-----

--6wacyb7up5x2mz42--
