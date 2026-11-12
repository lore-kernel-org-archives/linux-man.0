Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479305;
	b=DwWUhmK9HQvGbOiemQMUZ9HgExy67vSZFLYSA3uGz8507C4OJCxZV8LxsnPvXcQZ8rMq
	 HkN+a6VopH7N7WCAERjnE+F07mUhgSh/MkjyRAYKOR9bx0S8KmpmrKpouypXh+FpRX1JM
	 jiZdODnCNiXyZVL3Geoqj/mUVLQuKMBkbsaTPPRELClyHmPMirUHh0ZXXyN5+ekQ7al+k
	 qNSZNDY6dr08dyax8sM94FRAq9/AAOJt96mgfyg63j38VK1TyoipXLgoo3enE3xaVjqfT
	 a4R/Qf1iZ4k6EJ/GvSRxok5mZnyY75z5kYR0YHViFBi6X5hSD51/uH+QeY3kmjI0TRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479305;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9uzRsGZ12ohu9U3vnVIUZc9z8Qip7n89kQGKKyvUVrQ=;
	b=YAyuEdZ3zpP6vjWsfPbgYeXE4aNqzZWXJYY47z9WyDk/cx1vSjCOrULFfRi4P75T2joW
	 YC9v89lEPkth2uI5xQ1MyWSn26/u/RfpQhJQXsO0IYZBXGP5K2ChB9avy3hGqhBsq+7Lc
	 pbxHXKdLf7mp1UWWtd48giKJvS/eURMuPSguHzZwRySGMQNdCkABxKcb7lrw9a2V9oJ5H
	 FvlURIHkKY1oOQyB5OWbG0O8+vIXgAx/YKYn/VH6wLLiQTm0yPGk8L3cD/mLrOAcphuj6
	 EpUo0Y5eUOZyfrHr3MoKdjErn11V+yKGCs12cQFpU/1HRuo8OJSF6AEAitfKpHjiuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUTwyLQl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D2E606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUTwyLQl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB0F1F00A05;
	Thu, 12 Nov 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479305;
	bh=9uzRsGZ12ohu9U3vnVIUZc9z8Qip7n89kQGKKyvUVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oUTwyLQlJ2uCPdY6s0plfPokO9lkEq8347NjRu47FzTOlPaS2Pq3EqzfvZtbJMYC4
	 hEcE7tb8NJv1insOz8zy2WEMsVh1YmgAhPgIpvXXDwqgVmeDrNRXzkWnf7p89Cu+YG
	 eKGauwhbnD65FvYMv8pZQ+32TbSV1QMIKbJ/V6l8z3kNMuAFthpGrUVgXQztinDMti
	 UXTL7Z66A+DjXQakh4F9O032VjX8czza/BSQ1elQzbyHmNCxIaa01pRJMUFPYSLJNf
	 sjielHUVsGMaXWgvj3gIvd5M7+u+2ebXliUxCHa7F5FpLychxITaPIXr/WyEeggKmE
	 rWxJzXAZpIVvg==
Date: Thu, 12 Nov 2026 11:28:20 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWT2aQCFY2GIwLp@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
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
	protocol="application/pgp-signature"; boundary="2wheha2t7w3srgvv"
Content-Disposition: inline
In-Reply-To: <20261112033742.GG5716@brightrain.aerifal.cx>


--2wheha2t7w3srgvv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Rich Felker <dalias@libc.org>
Cc: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx+linux-man@kernel.org>, linux-man@vger.kernel.org, libc-alpha@sourceware.org, 
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWT2aQCFY2GIwLp@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
MIME-Version: 1.0
In-Reply-To: <20261112033742.GG5716@brightrain.aerifal.cx>

Hi Rich, Vincent,

> Date: 2026-11-11 22:37:42-0500
> From: Rich Felker <dalias@libc.org>
>
> On Thu, Nov 12, 2026 at 04:29:29AM +0100, Vincent Lefevre wrote:
> > On 2026-11-11 21:53:39 -0500, Rich Felker wrote:
> > > That's the whole reason '$' was chosen: POSIX doesn't define the
> > > behavior (since a "shall" is violated) so the implementation is free
> > > to define a behavior here. The behaviors for the portable base64
> > > character set documented in POSIX uses only 2 characters as salt
> > > (insufficient) and the common agreed-upon definition for how they are
> > > used is as salt for the classic DES-based password hash.
> >=20
> > But the behavior is completely out of scope of POSIX.
>=20
> Yes. And that's allowed because POSIX does not define the behavior but
> leaves it undefined. I'm not sure if you're objecting to something
> here or questioning how it should be documented or something else..?

Yeah, I think it'd be okay to document that this is an extension to
POSIX.  Perhaps, we could add this:

	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
	 .BR crypt_r ()
	 T}     Thread safety   MT-Safe
	 .TE
	+.SH VERSIONS
	+While POSIX only specifies the DES algorithms for these functions,
	+all systems implement several other algorithms.
	 .SH STANDARDS
	 .TP
	 .BR crypt ()



Have a lovely day!
Alex

>=20
> Rich

--=20
<https://www.alejandro-colomar.es>

--2wheha2t7w3srgvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1lMMACgkQ64mZXMKQ
wqmJXhAAnJZj4z35MZleOO4RJjkoCgdUc5qQj+jTMTJETxLD85a9jwXoYthwwvB+
TTKXZEWKEO3mNmeiotGgQC6p25CEHrUzR0XNlt9pEPMW4ZdD8zbI1cTEf26TXPKH
+WyUeEDplL64xDsoWuCbqvFcY48chQS3tEyWJaTUMW+tavbbro7xQWCFch/5VjdN
nxz6vTQKJRz7Uas7TXiGE8jecP5sWoW/1ZPsRBQ3W8X5seT0TovAQV7C9EZqXTLb
7OOS6nv9uJKI8d7/UCOKpB46fgnUjkvvRNN/W/NBIPx5FYAb7cpxqLrP3cHDxDts
WuwNGRd5G7eKWGMVtuZr9VqamDT/FlBaufFs3mUpEsuXMe1KLICvv/CE4rWt2Y3C
cs0Qx1uSrwFfU6e8SnHvakI/FiGrY0vgHwMX+QZRERK5uizf5OrMA+nfjrTjNgYQ
InOiugSzvznZjnXPRgyLoPXQEqzGLFJEBwcn80p6g3PJfxiDsnM1eyIqxzyYzZXx
WsbhrTC77i9+n68Hnq/etd/f0JgpQU56lCepyAh1jS7Q4RmrSLjtoBFi26Y4u7q4
g5DGIdLmA8wXWlDovp3y6/s/pIRVBmPlpPjUOPNKjidIE5Lj9kqyy0i2TVBhBGWu
tIrzDwF4jKXrdA//iByn4BpWrIUHBYTpWuv/s3MSemFxfWzDnxg=
=Rpc8
-----END PGP SIGNATURE-----

--2wheha2t7w3srgvv--
