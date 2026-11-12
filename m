Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485296;
	b=B0hSHTZAt6MMJtOzHO1M5ap9qF6Ox1MaQod+E6RJ+p4CcJvu3+vhiev1tXMSwnyHUYWb
	 3/yUKQ5GYDSfvqwSqGfrHUqtDWv9V9x31GlQbi5dC7l1cZwv9kySZ6QLhBRZpBTw6KA/D
	 8JT85ahVUzu5MQCDALD6fj0MSYXVgDzVoVTKd8pugrzrgRIWE9xJur1iqivjjcWkAiclN
	 0PFo6rq4lxxUlFeTdBvSB+kl5HOREFDvbqT/B3Pb0QaoO9APm7iueu9X39cHfrTEIkJsA
	 x7Y/Rv33q8GfurqYIjYDaLj3p1tAEBJ4jqEGrfegLLBPqq1sJ8oUB8VqGG2kprD7s5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485296;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=h7hqTShC+1n7zElnY95EiHoeUMBMpOdKFLhoRYVGDQc=;
	b=PnSPtXmsQoNu+aT3PoSGJiX2x10LFxOPvcFa5kGO0TUgd9GjUPcgFyg8wohJyqvPY6Im
	 muzgxma8l7lc+w1lVuo58JtaKifJEpUqXj/1C17xxvbJYcnZ3ypS6WxtMcrUMwmpqPCf6
	 6crwn817U9DXH1fgKMQPDtK4AoMOmxQB7Nr2z0XPNHraakjZEwJ5ldSg6bH9g2OWvjilt
	 kYyQyx3I7VIJuz8avNkxYlZImQmpyiOqGcYM1VnxIUC4FzBqjpFNEa2JueW5m/W1Heu0F
	 Uru/MioslKooDIHZxHO5JcU5aQA5l1wrTqngKQpK2uLSBal6OhG6uDjO3O3gOK0EC5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mCm8j4/p";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89578606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mCm8j4/p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A991F00A05;
	Thu, 12 Nov 2026 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794485296;
	bh=h7hqTShC+1n7zElnY95EiHoeUMBMpOdKFLhoRYVGDQc=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=mCm8j4/p0o5pIvm/b0kZPVR432HDe0PSPJCPsp2V2UItHO+bO8SFdc78ZSe2ueKna
	 zlHlhS+23tuhDKePIZiIkRy/4Yc+WAmiicK8cixDgdexWclRdxn3zWbSM2bFXjkJ61
	 jPqT8QF2WdAcNqvZejlKOhh+snA7xsE6EV4y8vgIiorq7ZEbIP6noktLk7j3t7wBaF
	 fxwiVe6EbDNJkbOk2SQvDXBYZRaULT5dq4S0kWM15STjdN96nvJzeUkQ1a6Bj7IPEu
	 u8R0ZCF8zthosEZZ/Z04+WggEaboYilRE7bSGlvNNGk+lSnYjOR/kkEAp1YcPL9bU/
	 mLIcVlHT9u68w==
Date: Thu, 12 Nov 2026 13:08:12 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWo_yv5znRjCPvO@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
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
	protocol="application/pgp-signature"; boundary="spoctghsagsgykco"
Content-Disposition: inline
In-Reply-To: <20261112114033.GA167321@cventin.lip.ens-lyon.fr>


--spoctghsagsgykco
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Vincent Lefevre <vincent@vinc17.net>, 
	Alejandro Colomar <alx@kernel.org>, Rich Felker <dalias@libc.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avWo_yv5znRjCPvO@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112114033.GA167321@cventin.lip.ens-lyon.fr>
MIME-Version: 1.0
In-Reply-To: <20261112114033.GA167321@cventin.lip.ens-lyon.fr>

Hi Vincent,

> Date: 2026-11-12 12:40:33+0100
> From: Vincent Lefevre <vincent@vinc17.net>
>
> On 2026-11-12 11:28:20 +0100, Alejandro Colomar wrote:
> > Yeah, I think it'd be okay to document that this is an extension to
> > POSIX.  Perhaps, we could add this:
> >=20
> > 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> > 	 .BR crypt_r ()
> > 	 T}     Thread safety   MT-Safe
> > 	 .TE
> > 	+.SH VERSIONS
> > 	+While POSIX only specifies the DES algorithms for these functions,
> > 	+all systems implement several other algorithms.
>=20
> No, POSIX just says: "The algorithm is implementation-defined."
> No mention of DES algorithms at all.

Oh right.

> And note that only ENOSYS is specified as a case of failure,
> which could explain why some applications do not check whether
> the returned value is a null pointer (i.e. they assume that if
> crypt() succeeds in usual cases, then an ENOSYS error is not
> possible and crypt() never fails).
>=20
> But my point was that POSIX disallows the "$" character in salt:
>=20
>   [...] The salt argument shall be a string of at least two bytes
>   in length not including the null character chosen from the set:
>=20
>   a b c d e f g h i j k l m n o p q r s t u v w x y z
>   A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
>   0 1 2 3 4 5 6 7 8 9 . /

Isn't that salt specification used exclusively by DES?
So, while POSIX doesn't specify the algorithm, it is consensus that
a call that is strictly conforming to POSIX will result in DES being
used.

> This means that when "$" is supported by some implementation,
> the interpretation of the return value may be different from
> what POSIX specifies.

Kind of.  They better don't deviate from it in non-confirming ways;
one could argue that musl's "x" return value is indeed such a
non-conforming return value, and a NULL return value would be better
(both more conforming and safer).

> Various people said that the choice of returning "*" in case of
> failure as done by musl was a violation of POSIX. But this is
> not true for 2 reasons:
>   * the use of the "$" character in salt by the application;
>   * the fact that POSIX does not give any requirement on the
>     hash (so the use of a hash that could be interpreted as
>     being invalid on the system for unsupported passwords is
>     a valid behavior).

I think that's a stretch of the undefined behavior.  Yes, in theory one
has passed an invalid salt, and then anything may happen.  But given
that POSIX specifies the return value in a way that doesn't seem
incompatible with this extension, I think it would be more appropriate
to behave in a way that conforms to this specification.

	Upon successful completion,
	crypt() shall return a pointer to the hashed password;
	the first two bytes of the returned value
	shall be those of the salt argument.
	Otherwise,
	it shall return a null pointer and set errno to indicate the error.

Given that there's no successfully hashed password, I think it'd be most
appropriate to return a null pointer.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--spoctghsagsgykco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1rCYACgkQ64mZXMKQ
wqlhDQ/+P/vnhXsDgWlzqg45W8UzivA5sfUniX0j6dlpkBI3P+BRYn49+6ep9fIo
nesdfrtti83excw1CJpyfg8xAib1NyHtfQA+xtxkCbAF68qNshEB2s6v60VgqYmh
vUS13IqOINmwsOTulwZaVOgbqFJpe9f7gDfST2KaYLChjU8GtnC+rvLiMENQr7qs
bhM/chx1ZDsL/eesFFDdrfAnOz2WZpASrNLJ0zOWZCIwiEkQRaahHJIyfzpLBwPL
AxQHZnDSLqmb3C9BYjRLOLAL0Oiqzs/BLMUiXwdW5Gi0AQC6PNojtjCqAucTnBCh
sz+yEWgeWkxP+CXKEU78/UBO4iNUAn067y/D0qT/66+0fzWzaJt9oJ8h8uPEyXms
iX/8dAkWGLFXP1UiaYIMdtEUU/2TfGfyFFA4snuL34tenRWx0Ys0GPBjjJtqS/Jo
6BnhpQxzElriNzSVg9qQSXsG9bwadXJNr8ojMjfzF9lNcf6Lmel5NZgnbRamgvWk
n9SQAcyLbsbpfMjsCKbPDOy2kyoeNrAOU8Z0XsWJLSauH3QhMZ0a/CPc5UZOoroq
Ssa08plSHjaaZkyZg3DAr75QcxJ6iFCM8tzidzA5ueLVoxMTU/LQw8zKS3KZvGPh
6W0ZtwPQLRhrRV3iraV9Gn236le5CA6OeH9xL7U2dHQHezQR4Kg=
=xVrp
-----END PGP SIGNATURE-----

--spoctghsagsgykco--
