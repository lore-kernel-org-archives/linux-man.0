Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6C3CBE66
	for <linux-man@vger.kernel.org>; Sat,  1 Aug 2026 20:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617113; cv=none; b=lvOILFWkGNzCHYpTZ4CfeIJU+67WMyar1tqZ+Q4lE+PxbAKMB3CVXTGnnUY6gBKnAksD25fmhreaWYjAub9RDCD2u31v/AooNKVBR0Z6ybn2DqFjE61R4Ey+PQCAsi8cev4c5o7wLh5E6LbkviNGjxUc4JJcfaI6pa8/Jy7I/5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617113; c=relaxed/simple;
	bh=vRP1bW5+ArClinHe++zQDNZTguls2L83eZSMfpKJjmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEIzHzJ+IKD4y7NsHG6KVLmqVOnwcKMC3pV+UGxzs9J8TMLzvVnHt9YmtZUfT/EUkE/SRpcg/OqJ7vTSExpDuSLGUitW9LH4Xww4xFxXaABnyZWyDGEq6hBKwmLn+d43Zr7OkgOu9dnBGN1DErR4gwqkKyihupKxACF3xxU2ECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSjGUYLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSjGUYLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720471F00AC4;
	Sat,  1 Aug 2026 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785617111;
	bh=CMDuHfznWoLZN3+3Lqh0ex5BwOrnibwBWExlMEnu1y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSjGUYLIshSlKafDYsCFgSeyvoacMsBdFnPBEQS2f3K6Ov/McjMBQx25WjxywxrTZ
	 QJmwqvIAeBxWFTzXe1KUyp2AK6ibYhzt7+ceavrqBGdLcXXrLRU3FBvBCDJy9u0xkb
	 kckz019IhbAYTrn6Pg/lf0xtiYJ2FwbILRCYmR58Y4f6ZKTqY55pdiBskVTAblEsOB
	 VgofNMK6CKo8kzNgrzXNX5ANyLLyOJc+fxweXnU0iDA4khoX8QfxZWjqP6/xrMZA+E
	 BjWnH640eGFfbZj/bGMKazwqdL5N2tUT+iaYgmPH+r6FCT/go33jiC3F1pGZUhI1xd
	 NwnxeZ0az0nhQ==
Date: Sat, 1 Aug 2026 22:45:06 +0200
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
Message-ID: <am5aZK60PGzeDO9e@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
 <am5Y5g4CltGIBwlE@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yd67clys4bos5cj3"
Content-Disposition: inline
In-Reply-To: <am5Y5g4CltGIBwlE@devuan>


--yd67clys4bos5cj3
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
Message-ID: <am5aZK60PGzeDO9e@devuan>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <87a4r6es6k.fsf@gentoo.org>
 <am3XeGZyi1Pvr77-@devuan>
 <87y0epdhxp.fsf@gentoo.org>
 <20260801201849.hzg6ufqxmwi2efzz@illithid>
 <am5Y5g4CltGIBwlE@devuan>
MIME-Version: 1.0
In-Reply-To: <am5Y5g4CltGIBwlE@devuan>

> Date: 2026-08-01 22:42:15+0200
> From: Alejandro Colomar <alx@kernel.org>
>
[...]
> 	$ git log --pretty=3Dreference -p -- SPONSORS=20
> 	6d9ae347cfac (SPONSORS: Two sponsors didn't renew this year, 2025-10-29)
>=20
> 	diff --git a/SPONSORS b/SPONSORS
> 	index 440fcca8b9ed..4b2f2e9011b8 100644
> 	--- a/SPONSORS
> 	+++ b/SPONSORS
> 	@@ -1,5 +1,3 @@
> 	-Adfinis              <https://adfinis.com/>
> 	 Google               <https://opensource.google/>
> 	 Hudson River Trading <https://www.hudsonrivertrading.com/>
> 	 Meta                 <https://www.meta.com/>
> 	-Red Hat              <https://www.redhat.com/>

FWIW, the reason for those two that dropped, IMO, is that Adfinis is
a small company that couldn't afford it, and Red Hat probably did to
have more cash to burn in the AI oven.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--yd67clys4bos5cj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpuWtIACgkQ64mZXMKQ
wqnEkBAAobRQh3tQqtky+8r+gs3VUWNIFB9fKEk4STNjQ0Bw45PS7Eog++9hHDHr
W+iyPGFLCXu6I4z9K+H5Ev93us5M4tntNQtedYfNf2CdmAOPauOD8cejLQn+vx28
7RstKVrk8rVf3EN4BQDLMzqCQ3ODUng1ioTjLriEPhGVEpulku/9LDoUftyyPNFa
OFGQJqe0mOHKOlQPSthytxKgS9PFlNS/HnTgw4fecqBkI9H4qITmXpy6OFINPl1E
Qb9mcwNdea1D7pZmwlhey0juMghS3AP3pnHugGIBjvE40Vac9iSTBFP5z+6m3fX+
O3z8cOdrzwnYdcE6z5Mp3Y16l3l14S4lbSkZ2AoMIk6VGRdA5iV9+PMivxNAOjpK
mJ7r0398GvaJoJ01HhkjIzl7TbZ+yeODdzTAYWGB6NH4Z+odq6xhOHCsBrCq+Qem
okcUrO5VJzzvzBYeu1v5nLS60YRw4IzA6A85wXBPFZKYNQnFe2ASejjF2J6zV9WB
lgpjuaEpPJIMk1oSfFLTuYwaD4jHeB6vcSoVYi+jo+tnw8DfsblhozNuDJCEIbWe
pfBFO594LcwPPAk3tN+Pgf+CwclpUYaLJn4+XlIOUrnTbjzHpzrziXDeVzakpswl
kONoET2c0PodLS0sX5w7pcD6qw60sBhxFRT4Bm/9NnAGO9qQX74=
=MRij
-----END PGP SIGNATURE-----

--yd67clys4bos5cj3--
