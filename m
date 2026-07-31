Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5D1E1E16
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785536922; cv=none; b=knFXl+VsQONzO35F30NmzIP3oz7B4acaTtNH4eZJW0pttXIkzfDtWVAIY1SMwC5wjcI3NlD/M/sHy5UTQzXd26sF6+deBiAROEKX0IziyAivATMa5Lw6X3mJBU8bCifaw6EiqwiV2rx9E5Q7f2v6F7c3b4dP1QtZnM15CYEUMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785536922; c=relaxed/simple;
	bh=yQlCEeF3N2EJnuve4Gg9aJHR11pCjaipfk65gkI4xDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONCRpQgbJAddbG2kmdSqwMm41EULh6dv83/sxXIkzYqnyKr7Zp3y3vIWzT19y15CjTq3pugED0tgF3P8IBlYvX7zwl+WzkygPaGnPuCWdD2lFFaXiAcNmQuwB/TuSGErtQdxAZrJRz9coWvwPf+6T3ZLYcLrKQgjHDDJnNWym6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okWQIEuU; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okWQIEuU"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66896892b6cso1901108d50.0
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 15:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785536920; x=1786141720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unOBwA56+N+sV3vomagL7m4AFWkkG+YRiYyIky81xpA=;
        b=okWQIEuUbebNBhianWoyD0khBJFUSvWCM2S6W/+Ln/wa2FfGT0TY+X1/zWi7GjCyLK
         C/Dom3ip2VXZkftWsm1VsNlk11Mq0h0QVcHOPYogLhKITIXVPs2szYbqX7+PnXdFdFSG
         Ot72Nxmd5iwR/6MfXqlJ8db5pVenV84kPz+SZM9WsleWTyZMnx979XmaandPTfDyCa9R
         A09jIwMRjZC3I1WeD5lHCIyhcfWz354y5Eo6o8KtksAGtkCkLZzuMoSMY+PFuEa0D16Y
         rSb2oGAV2wtzffva3+nB98zr9wekJT9t9nPw/NRKHnWAgAZFRClO+EEaT6ofGhYrqWAo
         TKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785536920; x=1786141720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unOBwA56+N+sV3vomagL7m4AFWkkG+YRiYyIky81xpA=;
        b=ngV2f2yv7OY+tHhlrHZW27ZIYE0IA0I9dZm+OEGZBKv0pwigQBNURgP0EpfjImXDmi
         nfyM8ZNGIr6f94fePG+9h9Eaqx5l8glk2Ds8h89jPkhZ6MCiO9nxOP+CNI6HXNysg7QH
         XXcGL3LI3qYp++W9RSVzcWA/plqfNNLnXM7Bp7k4kk+x1Z7aZu/8iCSiktzdJ53jdNeZ
         cZLH/sN1pT2OPiYoAOrwsjPUY+ACf/+mIVVDAgGM52ktkUDfaGW8CafbGE9OqMMsLhnL
         p/iUVtYGoOHaCn0utEn8l54SmvAtjxX/HQG72B14QQQzJnsZqgk843Clu01qhI6ZoAXN
         z3uw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7QDPLpixkltHW2X79s/X50mOSFiBOvX1oU7zbw3D5OJ0pW5EBeqJE3M4wsWHPNxFCdQOO1a62TMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBVC6uJjihTBB2jbTVDavEnh//wZtXxxL0K1S1fl2FSZJE3dF
	tRbchLhqJeuClVrZQNgNzJy3wZjdCliwVTfnHwEFrsg/L7qeQYHlOulK
X-Gm-Gg: AR+sD13rghyhJmkcj/3DQ0ftYLHqglNQ0Ze0m7drv99VnjbtW2PtWKb7F0GFDVD3/Ds
	qk4Jmlxz1C8BIWLUTQw0k4D4Q2ujXmDxLj1PveDvRW3diBV8xYrR6zREZN0t8Fs+1Icy7nPixjr
	HL2ISiIU4B4/vs/jw9zIWEsRZHcpcASvUl1HLJLVQ1UzW8I1lfRnOrgx87y5KmDRjtmeMZer8DE
	GMwSpzpJkmkqiJGEa5X/RoKPQUYwChO7meyd9CECV2AE8FAWzP7bQotont7eT7+9oscuZkViK3i
	evryd13bAdf17QRtmj2GEAchvkoAhUfiPDf67XCQtXl9SYfSoT+CH8rLRW+Bg1bCBzvhh+MYJMP
	a4oBl7iENxKHZGIYmMmGFq7KOo82AitzjydMVoRsacaXGIPdyE/Y1MWJH8QZD4FbDMgLydGBs5O
	5ZNino7Jn8xNttaY1xKFOaSlRbcKh6o0BHGg/lQoKVMJ2ww/HAkw==
X-Received: by 2002:a05:690c:9a0e:b0:81e:98d3:cac7 with SMTP id 00721157ae682-81fd4a27718mr22348487b3.12.1785536919723;
        Fri, 31 Jul 2026 15:28:39 -0700 (PDT)
Received: from illithid ([2600:1702:7cd0:e980::41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf30319sm15476647b3.6.2026.07.31.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 15:28:38 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:28:36 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: Joseph Myers <josmyers@redhat.com>, linux-man@vger.kernel.org,
	Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>,
	Nevin Liber <nevin@cplusplusguy.com>,
	JeanHeyd Meneide <phdofthehouse@gmail.com>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Iker Pedrosa <ipedrosa@redhat.com>,
	"Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>,
	Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org,
	libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
Message-ID: <20260731222836.ka7ytufa365po3ll@illithid>
References: <cover.1785532392.git.alx@kernel.org>
 <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org>
 <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com>
 <20260731215122.4p4aepsbgeoibx74@illithid>
 <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ixrju5kiui2yjvqs"
Content-Disposition: inline
In-Reply-To: <am0fnb4BMRrTajqx@devuan>


--ixrju5kiui2yjvqs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS:
 Document these as provided by <memory.h>
MIME-Version: 1.0

Hi Alex,

At 2026-08-01T00:21:34+0200, Alejandro Colomar wrote:
> > Date: 2026-07-31 22:10:13+0000
> > From: Joseph Myers <josmyers@redhat.com>
> > man-pages should document the world of C APIs as it is, in a way
> > that has broad community agreement; it should follow, not lead, on
> > any changes.
> >=20
> > When an API has been in <string.h> since 1989, that means
> > documenting <string.h> as the main location for that API - not some
> > other location one person thinks is better and that most of the
> > community has never heard of.
>=20
> FWIW, the APIs have been in <memory.h> since 1986 in 4.3BSD, and in
> System V they go back further to 1983.

I meant to respond earlier with this research tidbit, but I've been busy
with preparing groff 1.25.0.rc2 and Mark Harris stepped in with much the
same info.  Thanks, Mark!

https://github.com/ryanwoodsmall/oldsysv/blob/master/sysv-pdp11_tape/usr/in=
clude/memory.h

Regards,
Branden

--ixrju5kiui2yjvqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmptIZMACgkQ0Z6cfXEm
bc6hExAAmlsKBwF8u+U+E5+ArZjFcyIUWTbgrMu+MCPIqJJ8cZu7605tW53AYyiH
OZhFlp9QXYCkiO7e0W30D/0CBAwa77FSS5Mi/mkBY8KWSeE7zFeCqbwWGQp9Omtl
LmM4yjLdYRCjkSkC03ISw+9UKJMzBNLDStX+0pQpXxVqshp65Ryvxz0q1NoCPTey
5ujpxX1aGtkqkg5RqMDN8mMFVuVKmELfQ6pEHhaYGiXeLGveC6w+pJz/eChCWu8a
4BdJVpKQcLNWYP9ZGCGXxor365aoJH7ZntbjFqklVFKhqnfmebXYIX4twHUHcZWB
MLNNE5UdmkMdAetSFopway7Lr8UiyuU2EvV1lmbZpnXz+e/c2lNRaeKHBufDR5iL
6zBfQtbxCD/xHtPcgSLwazpke9R7Or0Qm/kCaWt8yIY0+t9ozry/PnlW9325ZSF1
SeAGSh0W+z+LZBDZ4wVD+b2Nh9yYSa9MLbBIxtXqGusouQCAPvN5ULInC7tPewGh
THVJqyDA+R468tiilLCKYGgqu0DjiXuw6gttk0209eQiIWwcy+DZCfYDegmAu0d5
/2Dd7i63jitTlSwbyStnaKzyjgOwY3s7Mj4KVBbuiRvvBXsVwWX8vslVBkyf8+Ph
VxHN2EABMpsG066wTGxJWtKoE8LnIFXBcj7sLcDlZiTi9fW83Oo=
=DQjF
-----END PGP SIGNATURE-----

--ixrju5kiui2yjvqs--
