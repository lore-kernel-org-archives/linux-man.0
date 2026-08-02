Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F4D22576E
	for <linux-man@vger.kernel.org>; Sun,  2 Aug 2026 21:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785706486; cv=none; b=oUfWEQloTAVBeDudfUhxXqSXOJuhSa66phgEKYxbpB/BYM81yAqUtfitsm8DGh4k2M5ioH1GXFo+kLxXwJm/Iuj6r6gSFFb3YDrxPT16NlzWiLajPlcAbBxnTxYSMgHH3yE1hfr2v/IXT9myVSs2/zeU4kZ+dINzUQ1RJWD63ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785706486; c=relaxed/simple;
	bh=QZnvbVau9OA1yES2E07c0OmZduL8Ysrkh4hNSPfQxSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFlIcmu+E2GaJbqlHFbTJHEXmkPUiwwKhEecgHFgzUVE+fTjn7xUNpnJ1KtKnkVWmjLxwBZ726DOGxep52BveAPLtLrR4us04kJInOHR6j7YLrUmWByGEtyfrgWUNwKQR51LgwXxqYXjVPtWO44SDbSBjVwrvidaMVbMis81ce0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+CgqVy2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+CgqVy2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27801F000E9;
	Sun,  2 Aug 2026 21:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785706485;
	bh=XXYFUPJAtbCNPWRkRAqfapVuFvAgdVOLhY5jsfFBBPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X+CgqVy2287J7qi3gxlgN77a4WGIRmtAELDewYkvRWyUs7Jrvl88syn+DgMFONitN
	 cdOhCYA5kA5k3EzCPUtRJTrDWQ5VBleGk0Ry5eVxx3TsC/V3serOiLgslYlslIKnup
	 1N5EXWsLJU+Rn7QlzfJs10wMsHYGzOCZqQZ7t101+rCXINAJDyLpcLyssVPfGBP+/U
	 n7pOtEEFOQMgS0Lckz8WR5N838YXwVyBURF4oJ/0s32nPLP2X+iSL5+ZewE4dGn7B1
	 cSVlK1M3m0IsbBkO/LrYdadr5jssDpUFgm+AXAUtNlC6jhTBylaobecxytFFMGWbCy
	 hXnhg0T6fK2lw==
Date: Sun, 2 Aug 2026 23:34:40 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am-2d02e1qq78Asv@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oxi5iqsvxt4eseua"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>


--oxi5iqsvxt4eseua
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Collin Funk <collin.funk1@gmail.com>, 
	"G. Branden Robinson" <g.branden.robinson@gmail.com>, Paul Eggert <eggert@cs.ucla.edu>, linux-man@vger.kernel.org, 
	bug-gnulib@gnu.org, libc-alpha@sourceware.org
Subject: Re: the Linux man-pages as an educational tool
Message-ID: <am-2d02e1qq78Asv@devuan>
References: <am50AM0bdufHa9W3@devuan>
 <15288158.RDIVbhacDa@cagnes>
 <am56ZBzNM5J07AUa@devuan>
 <f3f50282-8f40-449b-87c2-5df85fbfdc4e@cs.ucla.edu>
 <am6CnOddgaM10pry@devuan>
 <20260802000833.zpu27l7ibvrbouna@illithid>
 <am6PkypxYg-Fq4Iz@devuan>
 <87cxw1s58a.fsf@gmail.com>
 <am6X32HkGdm2xTd7@devuan>
 <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2608022219530.55540@angie.orcam.me.uk>

Hi Maciej,

> Date: 2026-08-02 22:23:36+0100
> From: "Maciej W. Rozycki" <macro@orcam.me.uk>
>
> What problem are you trying to fix anyway, what's wrong with=20
> using <string.h> for the APIs in question?

Programmers misunderstand these functions (some more than others), and
think they are appropriate for handling strings in ways that they are
inappropriate.

If <string.h> was described as providing functions that exclusively
handle strings, then programmers that only need to handle strings would
naturally self-limit to functions from this header file.

Those programmers that need more niche memory functions --maybe because
they need to handle a substring, or maybe because they need to handle
a utmp(5) fixed-width null-padded character array-- can resort to
<memory.h>, but that comes with the implied warning that those functions
are not the simple interfaces that <string.h> probides; they are
sharper: you can do more with them, but you need to be more careful.

Most programmers can live in the safe bubble of <string.h>: those
functions always require a string as input, and always provide a string
as output.  Plain and simple.  It's difficult to write bugs when using
those.

That's the rationale.


Have a lovely night!
Alex

>=20
>   Maciej

--=20
<https://www.alejandro-colomar.es>

--oxi5iqsvxt4eseua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmpvt+oACgkQ64mZXMKQ
wqnsFRAAmh6lhP/G7x0QI9eH97AyMg814jLxZPuaofNbqLhUIoD2vpqjP5HvWlIV
2T0KU54So4Wx6T9gcMwmYo4NbubkyMQknAbTvl14U5/TpiMUydE29PTb4lfKO4m1
kJgwOOoqZEWGUR4HoJ2qoN8KYJ/U/uyeU+Oj6Hsy7TvzDgsg6H8IW3YA8vFSrG4b
wZXqHpzSFOih4AgS7xyaJ3H3xfvMea7nnTFHLD5KW9ecD41Y2mvW6u0NiOLl2jgq
uYKnXiuaRAk5HmUZSDmne2ECC2hCWWjOFdQ/jr/+eNTTOhmA5N9bZP9Rg4uQpGP3
2OjF00lY0t/XVMMaxS8KCs5rKu9iYEij77fsf0h+lw3UgibiwZp75q/Qo9IRdCN1
Az4baWj0Wre0GHf1my44Lq/s8QAlCsnI9+ISoQuMpq9/3yU7Eu0rDVWGnEbXTG0n
0o2q041Hh5GXWlS0vhvJ1PPPaXOx7KX08Hlpmj3de75hiUOJMmBPyIvOihcAhFJY
+eN7L97wGwz20ehjFLujYYphkk7V7HidjvUJH8mReetI8T5+gFgKZ0b7txOOyr9F
+Qbpo79VH7KYQoPCIDMsXere8WtxykkdfqDPIhDtSUsZhqEmWzM0iKzAUiE7HdaH
sDIxkyOJUbAExdVzkgD8cFF+pqdH+MhDV6c0kKPGqiV5GcF8W/U=
=UEWm
-----END PGP SIGNATURE-----

--oxi5iqsvxt4eseua--
