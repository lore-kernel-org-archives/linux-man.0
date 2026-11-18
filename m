Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962732;
	b=tFCQ10DCIllO9P7RDMSjkXJBff+c7OSVC/8lgv+u73eAZc1+SPulmTPkU5tvcpMXdUN4
	 rU+BNhNtxEjTzVhRumf1Djzbtm4gzO/kchHGt2Yyn/TYukHgVSMnUac2IK0Zh9im0Zx07
	 3mdU1y8NZZksygLynr/sdhGvtjiXoovSNTli0xkUsGcjF25pj6kdnLYW59yfFSf5NHg/W
	 tK8RzsaRT2tCqglgQSojGDugVEar2iz2l8TQVuvyqHUVEJMSBZTYL7WKSM6MuVJ07rOUk
	 wmWY94MlSYy8zJiYVQJ9YyYrghYsTJJj87lwYYTS8/IOW+GkCkhufOv05FSf43UAXPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962732;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rAgPJYJM0vLv/+TYKZ2AQ2v1w5mwpZ0TNnHYCvx2etA=;
	b=KxzeRKQ9bT0f9jAXWtBSW1CB45EGl+VV9/xWQXKLhn4syXnBiOvyAMv0py7Ia06V6n84
	 SKOoEOwAqco9zgxrcRiedKFx0NcpfHCwcEXzZ4yh3jn8HIwDLa8gBcD+5GXD/G8nWwUWC
	 oasNWlyV5VWgnK+feNFWJjgegk/4A/s9vZwMdCBEZK9FyO3ZFnJ+GBnZvR9o7ue2HrUgS
	 bildYlRVtoIMgyZCMbAusEDFfcYrHd2ZPKA3XjD5tjuXevDyRYcQjZ8+0saukuA55agei
	 E5APiX7X22Kl6K3zk6RQabIyTKAhqXh6CTm31TH7jF04k7Wl4cKTDTwa1CV8Q+fYFkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkHfElRw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7168606A32A
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkHfElRw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A5E1F000C4;
	Wed, 18 Nov 2026 00:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794962732;
	bh=rAgPJYJM0vLv/+TYKZ2AQ2v1w5mwpZ0TNnHYCvx2etA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jkHfElRwRJXHevZtCW3d/ovoOLrCHU6fDypcRlXCY6Bgz3KAnQhKqmZJRVKlJBROC
	 iFx56LcABz3li9Dig3grltvFR00H0gJ2kr8bTZ5LTwbXZg0RumwuoBIc8uLkgz+ByE
	 wsLbYchqJoSwyFSMh5SP/tkyfPr+SeEgUxhxvL6R0rDRIjp9U2aVcjg5S6c1wwvJRp
	 OyTxenmQ2l6StO5+AIF11tp6P3F599YQ7dZ/zW8v2smyQ+ViMrnvEjAMnB9Mrx8kI1
	 RbeB44B6m6JSlh3ljBTrHC32nw3raYBkQ5Pn68AhgjFDZ+41Gl487mKqHywg0D9TIG
	 YYP2N2P8Siq9g==
Date: Wed, 18 Nov 2026 01:45:29 +0100
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <avz09FM5Bf5n6g-4@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
 <aveC_KnRVLx8eCkt@devuan>
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
	protocol="application/pgp-signature"; boundary="jlxk4zbqn4pvb7gs"
Content-Disposition: inline
In-Reply-To: <aveC_KnRVLx8eCkt@devuan>


--jlxk4zbqn4pvb7gs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-man@kernel.org>
To: Jorge Almeida <jjalmeida@gmail.com>
Cc: linux-man@vger.kernel.org
Subject: Re: [bug report] opendir(3): document file offset behavior for
 fdopendir()
Message-ID: <avz09FM5Bf5n6g-4@devuan>
References: <CAKpSnp+XojktUF=UL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mail.gmail.com>
 <aveC_KnRVLx8eCkt@devuan>
MIME-Version: 1.0
In-Reply-To: <aveC_KnRVLx8eCkt@devuan>

Hi Jorge,

> Date: 2026-11-13 22:39:06+0100
> From: Alejandro Colomar <alx+linux-man@kernel.org>
>
>=20
> Hi Jorge,
>=20
> > Date: 2026-11-13 21:28:32+0000
> > From: Jorge Almeida <jjalmeida@gmail.com>
> >
> > Hi,
> >=20
> > The opendir(3) manual page currently describes fdopendir() as being
> > "like opendir(), but returns a directory stream for the directory
> > referred to by the open file descriptor fd."
> >=20
> > However, it omits a critical detail documented in POSIX (fdopendir(3p))
> > and the BSD man pages: fdopendir() uses the current file offset of fd
> > rather than resetting it to zero.
> >=20
> > If a caller duplicates an open directory descriptor with dup() and
> > exhausts the stream with readdir(), subsequent dup() + fdopendir()
> > calls will immediately hit EOF unless rewinddir() or lseek() is called.
> > By contrast, fdopen(3) explicitly warns that the stream's file
> > position indicator is set to that belonging to fd.
> >=20
> > Could a similar note be added to the fdopendir() description in
> > opendir(3)?

I have applied the following patch:

	commit 7b4329e4945b1506f75c67c18730ad0191e09fb0
	Author: Alejandro Colomar <alx@kernel.org>
	Date:   2026-11-18 01:38:13 +0100

	    man/man3/opendir.3: fdopendir(): Use wording mirroring that of fdopen(=
3)
	   =20
	    The old documentation didn't clarify whether the position indicator was
	    reset or was that of the existing file descriptor.  Let's use wording
	    mirroring fdopen(3), which already made this clear.  This makes the
	    pages more consistent.
	   =20
	    Reported-by: Jorge Almeida <jjalmeida@gmail.com>
	    Message-ID: <CAKpSnp+XojktUF=3DUL81JZ2bFyBSxXHneFSBsiPi2BMg043xa3g@mai=
l.gmail.com>
	    Signed-off-by: Alejandro Colomar <alx@kernel.org>

	diff --git a/man/man3/opendir.3 b/man/man3/opendir.3
	index 443ea8f3dd0a..8184844893b9 100644
	--- a/man/man3/opendir.3
	+++ b/man/man3/opendir.3
	@@ -43,16 +43,16 @@ .SH DESCRIPTION
	 The
	 .BR fdopendir ()
	 function
	-is like
	-.BR opendir (),
	-but returns a directory stream for the directory referred
	-to by the open file descriptor
	+associates a directory stream
	+with the existing directory file descriptor,
	 .IR fd .
	-After a successful call to
	-.BR fdopendir (),
	-.I fd
	-is used internally by the implementation,
	-and should not otherwise be used by the application.
	+The stream position indicator of the new directory stream
	+is set to that belonging to
	+.IR fd .
	+The file descriptor is not dup'ed,
	+and will be closed when the directory stream created by
	+.BR fdopendir ()
	+is closed.
	 .SH RETURN VALUE
	 The
	 .BR opendir ()

Let me know if you'd apply any changes after this patch.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--jlxk4zbqn4pvb7gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr89SkACgkQ64mZXMKQ
wqlmbQ/8D5ZxMEGSlh8+XCaNm/kEpMbYD660Ep1pSSdgV5/AwdFwQd3lSfCqNJ+m
MKP66hvuIBMgchX/hmM21eDQgcyfz2mmV30xRirlEOU+xUlCqboLsWf+BY8ztLfN
/0QmExawdJ+X3VEsMTehdqAFnt2RLj/aGRZSuD7+C2ZrtTpHIN3ankLaxxNBL5an
OJc51/0Ypb8nhLW5nO0eJGChMM5KtCVj6YVx2f+8cxtPPXeebQwhQRNRc2jeP0Um
Gqyn0LvmXBV65HwAk1yAuwly/HK4UG59jjk20H1JG+caFdR6ZjuPhUOfW21OxhA3
eQm/3PVdB4D8uHoxr3NtxsEL9hqE5jeTrkb/9irvqXx/ZtH1HCJ1wUQCsYOINvnI
mrVx9nCjqhyXXjCXIbiZPxEjt49SlByB97ecBREdvDQyWbbx1f3DyQG3zInv2J47
Qofw4PjkjnsOqKkFoDwICYd78KJKIrH9mBaYfJAC4hrtZcr6CJpl0njAtHoiWro7
PXhU935V3HBz8kfAbqWmtQi4An4y7OeXq62I7mpMa7BIkE9bc6AGmc9Odq3ilGsv
F1XR+vdrMWxgw8/FBJ6fMlf+jA95Ap+AacvTES7LaBbiPzUzPHGpXjr2q8iNzEF9
EAmDanWKRy4LZVdmNdYDgQIXuEJdjJaihNQJFLU6/ksn9OH+mYY=
=Z9BU
-----END PGP SIGNATURE-----

--jlxk4zbqn4pvb7gs--
