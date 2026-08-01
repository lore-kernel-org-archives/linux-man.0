Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D23CC7F3
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 21:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618748; cv=none; b=jTOLxxjY8rnAKjz+/k3NLdlc1NNct9VdzNxquvQZpFUx/QU3sytwudBE3kHCTu3UYR39YVLzrEiRDkQqKR63W62fTvJLi35YpVllvFnIPXmj+iKGi3sqKjb3xxPZolgIDaJpzNxevXc80a+XLnxN5t2mFSsg7u7BhIcdHHdJ//4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618748; c=relaxed/simple;
	bh=hcq2uAd2PQCDFNm9KNNwOJngb32zWm8mL9Ixhn1akkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHDtTyzPJj/XghJxmF1RMTmO2pusBJmv531f3beXV+dWiKBH+EU9RsGHpD1xAqmFuIMK8cpN9xHElN2OX1gvtQztUU5agMle9Ni9nPCg8Tm615elY7ixQ5xs1gDBx05Laa1VQl3hX0H2/G7Lbx1cLLpQnAnIxDB8rIGj8/ucMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYpzNXa2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYpzNXa2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F391F00AC4;
	Sat,  1 Aug 2026 21:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785618747;
	bh=V7nuoqKsuaNSFj/7xQIvu01bPxEPM7jYMZPucOUVDKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NYpzNXa22c3hECo0XWNiL2JmrzUTUrHwx8c+9xUlgT2DR5COqomDrrhVFwhihIpe2
	 awCyT86ueEdjVjgnQiNuYIdnhRIjZFFTGog7r01fMB5+dkslH1+nUbcuD+k3kYqBmO
	 A+PGb5TprNvFTL4P8Zb7nilfo3Z2p4wV2iWEkzTISXpkgqIkuSQG3pJiHVfcJ3MXTR
	 gJMRn/vS61Utvye2DXEMHjnvH/i6sQmHnmHN0RayLIwFlHNAoK2aPHcfC6JF5g1tnw
	 klTe11MXLyt+cpjc3zitUH+EkIl3Pi0TjX4lDTgcjBaaOQ/PeYKI9JtwlIM4t1TRib
	 714ZvSmm0jiww==
Date: Sat, 1 Aug 2026 23:12:21 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5fMCFsvAAaukym@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
 <am5Y5g4CltGIBwlE@devuan>
 <20260801205226.jta53rrxkglmpv6q@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdbekibbdixqzphd"
Content-Disposition: inline
In-Reply-To: <20260801205226.jta53rrxkglmpv6q@illithid>


--zdbekibbdixqzphd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: Sam James <sam@gentoo.org>, Joseph Myers <josmyers@redhat.com>, 
	linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
	Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
	JeanHeyd Meneide <phdofthehouse@gmail.com>, Christopher Bazley <chris.bazley.wg14@gmail.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
	libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on the irresponsibility of pursuing C language reform
Message-ID: <am5fMCFsvAAaukym@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
 <am5Y5g4CltGIBwlE@devuan>
 <20260801205226.jta53rrxkglmpv6q@illithid>
MIME-Version: 1.0
In-Reply-To: <20260801205226.jta53rrxkglmpv6q@illithid>

Hi Branden,

> Date: 2026-08-01 15:52:26-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Alex,
>=20
> At 2026-08-01T22:42:09+0200, Alejandro Colomar wrote:
> > That's public, and has been since the begining.  It's published in the
> > git repository:
>=20
> I knew it was there somewhere.  (I see now--prominently, even!)

:)

>=20
> > 	$ cat SPONSORS
> > 	Google               <https://opensource.google/>
> > 	Hudson River Trading <https://www.hudsonrivertrading.com/>
> > 	Meta                 <https://www.meta.com/>
>=20
> I don't think many occasions call for you to quote the file contents.

In every release, I do it.  For example, see the last one:

<https://lore.kernel.org/linux-man/aekjQuAEaq1ILKAa@devuan/>

	> From: Alejandro Colomar <alx@kernel.org>
	> To: linux-man@vger.kernel.org
	> Cc: linux-kernel@vger.kernel.org, libc-alpha@sourceware.org
	> Subject: man-pages-6.18 released
	> Date: Wed, 22 Apr 2026 22:04:52 +0200	[thread overview]
	> Message-ID: <aekjQuAEaq1ILKAa@devuan> (raw)
	>=20
	> Gidday!
	>=20
	> I'm proud to announce:
	>=20
	> 	man-pages-6.18 - manual pages for GNU+Linux
	>=20
	...
	>=20
	> Thanks to all the contributors to this release (in BCC)!
	> And thanks to our sponsors!
	>=20
	> 	$ sort --random-sort <SPONSORS;
	> 	Meta                 <https://www.meta.com/>
	> 	Hudson River Trading <https://www.hudsonrivertrading.com/>
	> 	Google               <https://opensource.google/>

Properly random-sorted, to avoid any preferences.  In the actual file,
they're sorted alphabetically.  I haven't even asked how much money each
of them pays to me, because I don't want to know.  I only get the total
amount through the Linux Foundation.  (But FWIW, I guess the three pay
the same.)

> In your position I would simply have the URL to this file handy for any
> occasion where someone takes a run at my transparency.

Yup.

> In fact I think your approach to disclosure is near-optimal.

I've been thinking that I should disclose the total amount in the commit
messages that update the file.

>  In my view
> it is strongly superior to slathering acknowledgements of your sponsors
> on all of your emails in your capacity as Linux man-pages maintainer,
> which would degrade software engineering into something like NASCAR.

I do in the releases, but since they only happen a few times a year,
I guess it's okay.

> (There I go, alienating yet another fan community...)
>=20
> Regards,
> Branden


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--zdbekibbdixqzphd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuYS0ACgkQ64mZXMKQ
wqlZdQ/9Flxs+KhWKCW3XhwauZ/pdqX9BJEYvxEseEjezuUC9WASkq684KFS08o0
j30LHMZv6ZVGnFnpc4W+qy0TDYkaB7hG5HUSslvVIkf6Xz8nb1xDvjHgUJY4mRLi
VyByYb/RMJqex9a58Hdsgcp+noYgkNWFy5GsMtuqTirhi5INSPzCEyLOrVIMheZo
f3U0o4p87Zs+hUxZRE21ai8vlYmj1S9eWSFCEAx/MNC+pJEju+Y1ooIRoI6Mrnq3
/sANRfHExYl++oEfXr7c5/Lp5FfyY1S4Od0b6vJ65lQ1ugeKO5dwdjgl3MhlWaAj
0BQUwHO/L4XW7mC00yyv5Xvzxn9FwS/yPXiEynSfAzaqpBoOEf0WFDVbpADrVbA1
S0yD3X4codwSoLMGI9tpvv2ZtKjiwb8pdIQi2gYsOINwI+C6QIhDkjn5fVzCeGpl
Ejjcn8oIJ4osOk+CSi+nofOmWa6lVN47Bd8/l26NMlpNHBEYdwbxp7GLFI4TI2G/
xE/aJ/6+wN+3x7FT6bp5JK1nJvhJgNUNMgiWrZd44oEm4bzljyZPAGh50lX2ARzl
6MbHNwID/RtXqbBlzqe0arzLgnScXw1UHyeg4HCmxJPzpdl4HpihZN2xDjNS1Ozg
IjeM3FqsiNDAQOGp6ilLlgn2XFsFuvCTFot5up2kAn9NNGYWSwo=
=Whg1
-----END PGP SIGNATURE-----

--zdbekibbdixqzphd--
