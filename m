Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489146;
	b=bu2rqfI10NY4HNY9G2oLJ5RAT+MKQp22SRYdf0BAq1itQ2cd1bUtSVRUVzsmHd8ea8WD
	 DB3s8qdUJ5nZAZRRymTzNXPVdp7VZ0a1gEvD5DYdLO1TeMhCEbxd1jYds31RJfMvl+3S7
	 DjAz4b4JMjgz8rNTS01IAUUwzRqLk8LJXDyPV7EYeNLCdDqVCIUViwnzq02REckyzRYxH
	 m0QQ/Gwu9/0lZiBCzIotDKAiGxxqNSmNgphDWbKR0sRouP/pS65ze2pntsVG5nVfkPyiU
	 Osc+XBbw3ViyraPFCaB2X5P3DYHsHiNmkiwEf4MKb9nFV62D1aI5D7A9yVWgiOsueLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489146;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SG+L7YV3R6NXZnFs1/oTkBgPFSamKRG3WiS4K1C0xBM=;
	b=E7iRpBq4DuAyMhpYv7igmlZwBiR+3CkXg0ecj5y/DHXkuTCNovrzELjuAow5UDn5ST7x
	 hglJcI9SDpgNgVRi4SjiYGGLryytg6p9GL+moCzdZFLYq4cgIqQrNFtl6d1zn93aKiz+W
	 k2+K8ujO3d9FRcMFGIYjBU0G/M9PEqgdmNfW+XiAgDcPqoypB4S0TSxrgxKMiAjxE0OVp
	 Fhy7DlP8PU/VNllGmhZqh1fGtWj6+BlxdNGL8TMOrMcGLInhl2NJDkawtcexauYBo1MNP
	 BBu46ikZdC+P/asd9gQUhnZwJqGqW25UZ2SewG3nY/SLsAreLYqQBHZdr/AgNRn4lLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+Jt6I4Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897A1606A321
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 13:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U+Jt6I4Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8D41F00A0B;
	Thu, 12 Nov 2026 13:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794489146;
	bh=SG+L7YV3R6NXZnFs1/oTkBgPFSamKRG3WiS4K1C0xBM=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=U+Jt6I4QgjceuD8IxVKE3B6sE0jUW6as/ND3c9Z0uvOsYADaJVtU52l2AXf+ZITs6
	 4eLntVic0oMzhngDSD+MWl72A4D8T8f/lOuZ5xo9nVx9ZDGtKA3BUBBBEjh5dDrfYf
	 HjS+ULIf6iIvvr0L9OgJBiXyw07pCW4n4cA7UC8hooleJUiFm7KeWbYS6lVU7zQ6GH
	 akxY0SXJfTa1CvYHpQE5jctwgRIcxxlwmlEdfzHtcTisAdv7i22Wn9iX9PqLxBQblE
	 1AXL82RuAKr3pQwOJ+dWWj8EmLgX1W5rY8BwPs1aYzinQNkB5jfpfvL3ZSzRrH73gN
	 62ULOFMOBmj6Q==
Date: Thu, 12 Nov 2026 14:12:21 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Rich Felker <dalias@libc.org>, Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW2G8eKE5w0Xy9O@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112124114.GB3542221@port70.net>
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
	protocol="application/pgp-signature"; boundary="awultqdbpzdj2jgd"
Content-Disposition: inline
In-Reply-To: <20261112124114.GB3542221@port70.net>


--awultqdbpzdj2jgd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>, 
	Rich Felker <dalias@libc.org>, Vincent Lefevre <vincent@vinc17.net>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht, 
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <avW2G8eKE5w0Xy9O@devuan>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112124114.GB3542221@port70.net>
MIME-Version: 1.0
In-Reply-To: <20261112124114.GB3542221@port70.net>

Hi Szabolcs,

> Date: 2026-11-12 13:41:14+0100
> From: Szabolcs Nagy <nsz@port70.net>
>
> * Alejandro Colomar <alx+linux-man@kernel.org> [2026-11-12 13:27:13 +0100=
]:
> > How about something this (we can improve the wording)?
> >=20
> > 	diff --git i/man/man3/crypt.3 w/man/man3/crypt.3
> > 	index 524781d3c2a0..d579bc5394fb 100644
> > 	--- i/man/man3/crypt.3
> > 	+++ w/man/man3/crypt.3
> > 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> > 	 .BR crypt_r ()
> > 	 T}     Thread safety   MT-Safe
> > 	 .TE
> > 	+.SH VERSIONS
> > 	+POSIX specifies a quite useless API,
> > 	+and all systems extend it significantly.
>=20
> please don't put nonsense into the official man pages.

I agree I could have used more precise wording.

I think you could have used more precise wording too, since you're
complaining about that.  What is nonsense in what I said?  Is it perhaps
too offensive?  Yes; I think I should have said s/useless/limited/.

Is it completely nonsense?  I think not.

> your job

Ironically, your job is *not* to judge or specify my job (if it's a job
at all).

I suggest that you limit yourself to comment on what *the manual pages*
should say, rather than on what *I* should do.

I'll continue as if you had said s/your job/the job of the manual pages/

> is to document the interface contract including
> implementation defined behaviour,

The contract is specified in the sections of the manual page that are
meant for that, such as DESCRIPTION, RETURN VALUE, etc.

VERSIONS is a section for discussing differences between
implementations, and between implementations and the spec (although this
might also go in STANDARDS; it's a blurry line).

> not to judge the spec

I do agree that we should not judge the spec unnecessarily.

But about what you said literally, I disagree.  The manual pages have
been full of opinions --where appropriate-- since the very early times
of manual pages.  Already in the early BSDs there were comments about
strncpy(3), for example.

Here's some of them:

	$ git show man-pages-5.00:man3/strcpy.3 \
	| MANWIDTH=3D64 lman /dev/stdin \
	| grep -A5 NOTES;
	NOTES
	     Some  programmers consider strncpy() to be inefficient and
	     error prone.  If the programmer knows (i.e., includes code
	     to test!)  that the size  of  dest  is  greater  than  the
	     length of src, then strcpy() can be used.

See <https://lore.kernel.org/linux-man/anJZza-qbi_y5r1N@devuan/> for
a (incomplete) list of historic counter-examples.

> and other systems.

I didn't judge other systems, I think.


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--awultqdbpzdj2jgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1uy8ACgkQ64mZXMKQ
wqlzKw//ZwmecCAjj4tJ5kyiGAOqkPfkCZpn3QWA8oqk2BWXzcCsp20RWffgWxpZ
WtUNaZPaLslrWdVusbwqiRW1EVNUdO7YY7AU51oFyfXPn6DM76Ow1y3i84JlfqVy
0QnzkVBBAZFGU/IpzGGrjVGEhyX7UHpf6cZNB09vabiVu4DVuckP7FuKheDwvReB
2TYpZCR1pFeYwI1jInPLZ5cUzwTDvBt85Bgv+QrbYrdT4NZTEgH1oouTTcqgSyU5
6QcfqrctO8S+eXlXBprs8aJxXTD1aCcSKVHyfDkp7OQDbq/SMeAadOmTkjumPXpO
cRMEzmriTr5bPVoAEtC/gsRuUL4d3TbgKtEt8m0K2G1pGeaQ8vHRPDSw2K0tcHP/
uGTms8MFd/9NqgonRyYgOpz7nn/ltCjmfssyEr9gk9n+CYahT9cuYsubxbtbKcm6
nYD9E+NfwoFGhIdp4tPos7Zu92XY3Q7LxkueXzNuoaflO14ljhas3h28JrsYqSU2
WEdGuN/T+ot5Ddy3ns2cOmwkVfVr8mZpMyY60rmV8CYGUi77nB0We9y9+fRUbwd1
iyIajaTIGM+ERe3Mmlc5EgHRgN/Ha1mJIUgBDpiX/YK7wkaGa3+joEZ4Jf0yRt3r
54d5Ms6MRrfO4i7HWpd4oIvApkoq0stF2n6fZuslWrV5vU0cnu4=
=G/eO
-----END PGP SIGNATURE-----

--awultqdbpzdj2jgd--
