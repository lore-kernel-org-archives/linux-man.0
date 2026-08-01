Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C32234DB6D
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785616936; cv=none; b=Ro3XIehbQ3IDSlCBlSM87eW/H29G307CkEaE3wwCpt1Y9FnABIBLfUstWfhMq9HNcBDCk3dKOSPlIsnx/0p8Gbdrm2nbGafU23AWyXmtwPRFIybqxs2wg0ZI8UxPylT++HRVWzFIEacXrgeJ3cKrDCGdzHvRHa/sxbEUNgqO7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785616936; c=relaxed/simple;
	bh=DoVpBfpnVy67D5CxbLsaq33YEUAbOAUeB9P2K0rqzhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcjFGryCS2TvQhnhlrQifzRURtMlg/oqF5dho+jk6On04T2eteOx+PDA/mCXDl5AzYU+LZYsdvngXRZ9QRaH/Zv/H04awdaP2BxAsMHp2mavqZOlWshAdhduY1t7Pkv4Q2R9Lg/sUG+eNpYcp2zNOOLsaqrmUC/KZ7H+83ChUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYmJZq94; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYmJZq94"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF5A1F00AC4;
	Sat,  1 Aug 2026 20:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785616935;
	bh=P5HmSai6dY3qHIeS69dvhrkZFn0ARcIFvMzB1g3kvlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AYmJZq94oUO63A+HDWJki7pdt70d4365meyJ5zWnFokCHp1skURtxDzx4YQ8aLyBI
	 JNM9KoZWCQRbXf7vSoEBg3biw3SVYPJC3Lk4mzcvhm5i5d8qepn1+ZlTr7akiTYwM5
	 +oRXQK23e0h7NN36kjSyY+oeSyLWCEpEwIw0kf1cFhouf3ZL+ifpfwGQIhcomHeOCn
	 w1jVeLzhSWgUCJfSMo71zZjShwC4aXAU4HnISZrbFBiXVAI50OusAC9BCxudABNjDM
	 7VEB8IxFR/z0E3XpEbN+zNGRYjRq8VAk1DstXC6Ae0J9kLILIMsOlYSZ+E3zTrTVla
	 wzyc7uvavgqCw==
Date: Sat, 1 Aug 2026 22:42:09 +0200
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
Message-ID: <am5Y5g4CltGIBwlE@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uoq5oed3xf4e7obb"
Content-Disposition: inline
In-Reply-To: <20260801201849.hzg6ufqxmwi2efzz@illithid>


--uoq5oed3xf4e7obb
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
Message-ID: <am5Y5g4CltGIBwlE@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
MIME-Version: 1.0
In-Reply-To: <20260801201849.hzg6ufqxmwi2efzz@illithid>

Hi Branden,

> Date: 2026-08-01 15:18:49-0500
> From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
>
> Hi Sam & Alex,
>=20
> Just a quick note on conflicts on interest since I'm the one who dragged
> that label into the conversation--though the concept was implicitly
> present already.
>=20
> At 2026-08-01T15:38:42+0100, Sam James wrote:
> > Alejandro Colomar <alx@kernel.org> writes:
> > > FWIW, regarding the possible conflict of interest that was mentioned
> > > yesterday, I'll say that I don't get paid for my contributions to
> > > ISO C as a member of WG14.  There's no benefit to me other than
> > > public recognition.  I'll also disclose the exact quantity that I've
> > > been paid for maintaining the Linux man-pages project:
> >=20
> > You can have a conflict of interest in responsibliity without money
> > being involved. In fact, I have never believed you were influenced by
> > money,
>=20
> Sam makes a good point, and Alex, I think you overlooked one.
>=20
> Disclosure of the quantity of your compensation as Linux man-pages
> maintainer is of less importance than _who_ sponsored your work.

That's public, and has been since the begining.  It's published in the
git repository:

	$ cat SPONSORS=20
	Google               <https://opensource.google/>
	Hudson River Trading <https://www.hudsonrivertrading.com/>
	Meta                 <https://www.meta.com/>

Here's the history of that file:

	$ git log --pretty=3Dreference -p -- SPONSORS=20
	6d9ae347cfac (SPONSORS: Two sponsors didn't renew this year, 2025-10-29)

	diff --git a/SPONSORS b/SPONSORS
	index 440fcca8b9ed..4b2f2e9011b8 100644
	--- a/SPONSORS
	+++ b/SPONSORS
	@@ -1,5 +1,3 @@
	-Adfinis              <https://adfinis.com/>
	 Google               <https://opensource.google/>
	 Hudson River Trading <https://www.hudsonrivertrading.com/>
	 Meta                 <https://www.meta.com/>
	-Red Hat              <https://www.redhat.com/>
	7ea35690e060 (SPONSORS: Publish the sponsors of this project, 2025-01-15)

	diff --git a/SPONSORS b/SPONSORS
	new file mode 100644
	index 000000000000..440fcca8b9ed
	--- /dev/null
	+++ b/SPONSORS
	@@ -0,0 +1,5 @@
	+Adfinis              <https://adfinis.com/>
	+Google               <https://opensource.google/>
	+Hudson River Trading <https://www.hudsonrivertrading.com/>
	+Meta                 <https://www.meta.com/>
	+Red Hat              <https://www.redhat.com/>


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--uoq5oed3xf4e7obb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuWiEACgkQ64mZXMKQ
wql97g/9FhuNSB+y7s6IhY2t+FaoGBl6Qac3GXLi9bISE0u3XPUx6uBUKXTrmtsV
szHBxPdk87z4CyPJvOdHRkLA6iKqHn3wCtvntOYT+Qe7bU7D9g6P6vIlM1Gyjh0C
bocKubcJlC8H9asArCvKWw2hXqJnhhwu/Wc8NJ676EYmvZjtNWdplBkl+HukUee8
bqG3n5PA0bJMyP4F3WZ024KoQMnoC8u79JWI8yTUnCY/hzjk2b/2COiUQWgRW7jp
BVl7zK0RoJmZlc0O/yEEsY4oxhG2N8QwBqKXcAwGgBJrSc9FGRKQp54PiYr4mL+o
3doSZX/Qm+CuzbTiSiz72wH8kjV2bBBPpQZtFoBO7O9I/7FMPV126GP4k8JFlqSk
CZlz18dCCaG9BYWbN0T5zguBiGN/CCnMByzrLc08PSc4Sn4+qMum5un9xx8XVZvv
WQ4CV3x8HWGTROx66Hh8zt55RmnwVgzKI3mNUcGTBdy2N+Jh7s/Fg0q2uHTwO2rx
ZHICf05cwp3NQN+b9/QFRSEq+RSXi8PMWHepSkfSv9G13qnJbdp7qtdZcftKUvop
kggKUJBq9fTtih65R1fJnTHhVZ3pnUfOw1MjeZos/ZEvmybAq7XlCCUAXoXHC+qS
AtMAdZlcGf+2D4XfuQDV+1zjh3ourTttn/RNx9+o4WXSGxC6VK8=
=RRF6
-----END PGP SIGNATURE-----

--uoq5oed3xf4e7obb--
