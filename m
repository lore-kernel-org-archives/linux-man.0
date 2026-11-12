Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492438;
	b=t+OqB0opWCYS2iRepc+ziZWmAiWa756X9uECfZIBJRoOX5qVL3uk7kc3s6Y/JrvVGN2m
	 CI44YnoEgVnKjUC3mbluCPBheStm/WY9uBY+VZXnwkbjN9Wa4aeN53CE434mwbRWd7SFf
	 mo+eThClPRtXQUEqXzsRMEx+ZECv/zn7tYWVt+bJEUNVS5W8sMg2hi50MC/slthM2jpGw
	 ixHK8mBOR8Yw5E/Q7EhKliRs0/fMSBk8zUTTL5oxKayYJDCdRNYwBprtDEXOESWDLbE+v
	 5IErxWmokuNbT01+hXy0f/Gk8E2DG+s7s3f9hCBLkRk6EHgivoid1okttvsPpUC/Spg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492438;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=awhVbIYNIXfV7wSZ3eEa5oowovTdJ1DCfkJAF1pNi3M=;
	b=F9oC2AuzQF8fjSobtb1OnOJtsZs4p1f+5sV+YVPjvegadCP56zWAejXcP0g7QPmqzB8m
	 4g+xAYPhbL9uTmRgTcRyFirGMIt/V+N77zEWcvPMgE6gW+yFD5JnK8wjb5QAXtnYOLkw0
	 Db3Qa271AcIT2tImq+jdjHP+0Ie7akSmqGZ6SzKXNFCGVhxF7Cz8+Q7VWUzFv2JNZE7j3
	 Umd/KMw028BqK7gEvg2gsy50anCuT6mltzEhEDWf/Q+vxWiUe1NLxftN7T136W7o5ItfP
	 c71cjMW7muDyxA64TXc3h0xuywGfhMVuI0RoroE9eBo9lgDd/YWoK7QkRnHtOrgdbgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiJoSkw3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1DE606A8AF
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiJoSkw3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CB41F00A05;
	Thu, 12 Nov 2026 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492438;
	bh=awhVbIYNIXfV7wSZ3eEa5oowovTdJ1DCfkJAF1pNi3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kiJoSkw3Ayadhdr5MDFRfH3MRF4ItVbQ/cQHgCK/U2sGjN+z1QCh3IbTIJvCvnqL2
	 UL6GbrRlIg9NzuUDw8zJUyLcbWa5/hN5L+8yLsEHbGacgofZHIVqhrAzxqMPudUyo7
	 WI4T1FtVTtjmqVWPV1mmc6+N3iwMr5nXMCkUkrizhqofNtzzvh6Ifw5VPUsVUxGZEL
	 7cHyNMQ3TSs2fzVA6RQGaBxIBhhchetPKZu/86L1jm0kocCABUcZb/0E/ga2zPEcW3
	 nbqdqhilFGcpVFi5ikfQsIl4VdyLEbosbwpl9/r7J+kVEwevw9wCnvKiravEu/e5QK
	 OzUSUkvfNMoUA==
Date: Thu, 12 Nov 2026 15:07:14 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avXFw_RUi0C4Ta1V@devuan>
References: <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="xz5z4x27cph4ln6i"
Content-Disposition: inline
In-Reply-To: <20261112135501.GI5716@brightrain.aerifal.cx>


--xz5z4x27cph4ln6i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avXFw_RUi0C4Ta1V@devuan>
References: <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112135501.GI5716@brightrain.aerifal.cx>

Hi Rich,

> Date: 2026-11-12 08:55:01-0500
> From: Rich Felker <dalias@libc.org>
>
> On Thu, Nov 12, 2026 at 02:45:16PM +0100, Vincent Lefevre wrote:
> > On 2026-11-12 14:23:08 +0100, Alejandro Colomar wrote:
> > > Hmm, yeah, I didn't intend to say POSIX is bad; I just wanted to let
> > > people know that POSIX is irrelevant about crypt(3) these days (as Ri=
ch
> > > said).  Perhaps:
> > >=20
> > > 	The POSIX specification is significantly outdated,
> > > 	and all systems extend it significantly.
> > >=20
> > > What do you think?
> >=20
> > OK for me.
>=20
> It's not "outdated". It just does not mandate particular algorithms
> but leaves these choices up to the implementation. As usual the scope
> of POSIX is what applications need to know to interface with the
> system, not administrative policy. This is why POSIX doesn't define
> things like mount, how init works, etc. either. They are in the scope
> of things that applications generally don't have to care about; only
> system components do.

But is the POSIX specification really useful for applications?
An application is probably not interested in knowing that it shall
pass two characters as the salt from the set './[A-Za-z]'.
An application should not rely on the specified return value either.

>=20
> I do think there are changes to the POSIX crypt spec that could make
> it better, like defining more errors and specifying explicitly that
> salts beginning with '$' and '_' select additional
> implementation-defined algorithms and settings, etc. But overall the
> issue here is just a difference in expectation, not anything
> inherently bad.

I agree it's not inherently bad.  It's just that extensions have grown
for a long time, and deviated between themselves for various reasons
(most notably in the return value), enough that programmers must be
aware of too many implementation-defined details that they should
entirely ignore POSIX.


Cheers,
Alex

> Rich
>=20

--=20
<https://www.alejandro-colomar.es>

--xz5z4x27cph4ln6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1yAwACgkQ64mZXMKQ
wqkqRxAAt4umZGh84NuSx09z0sT93KZKKlqSYn7EwE3Hh56rcNNluujP1ZJThWLg
6xTpD9Kv1WjbocsS9fWlyk+HGZQ/Av/6RUCSuduGXBvuonJpOJp9l386nD+NRluB
GdwE1Wdze/+4PJNqHTNg9ydMUD2Wn7jEWlugZAYyzaom/DQBJiTr0BZxr6tbhTYx
FAfcocTWGlFux/uSEJyrN1Gw/kZZbbPpp0cMttSV0yxvzii+YxfDVDUD9EyUJFs6
rC+m/fbQdfkt0XoYNoJ9hwpAMbwle9m6vuJ/MgCTq6yW1DrbQZXUgnyqaKy9JHDq
2cecHX2puAXuzPUzWcmqP6WJfJkHuw7cNElSasgY6dSChUhII/noxiX/8UediLym
gp/7eXQx01epTSFiFqmvfUk6jPzDewHi7OW8feVpkfVWy2nY/LatxwNKpqQHNwb4
KHdKeNAGwgW8cUckTsqg7GZNmeS2GTAgXMgU/diwXaBN/5eOp29UO59ucVo/jGpf
RYTECaCTLwWEhHjDFI4zhjvt+ppaStONt/F/4Cdxoy7ByFBqn5ShWgz/EMXij5Rh
8kwO9ryiFFnVqWRo/mXrkQDT5g1GGwA9bM18CmsUMv0/Hd3ODNUNfsNdVALOzrhu
/H0DcK/w8+eT3aboJ6HICOuHyWGwRidIB9hNiPzw9abkAka4SEo=
=Ni0j
-----END PGP SIGNATURE-----

--xz5z4x27cph4ln6i--
