Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951E53BB126
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957396; cv=none; b=VpIM1BKbW87FudpJ0JUZY6D5HDMYIx3w3PCwRoi1RhtXAGGbHMvynDE/TqFHJKKmJbv9pSiPv+yH3E3C1wKRhO+LCMbxF37k63sSsgeSgHJLJa9M1HmsgAL+WYZ64Uvy+BGzylxq9zRpemmUxfn+nV8vDUmUPQjHYl1ATuM7fqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957396; c=relaxed/simple;
	bh=Ig8QmBUevxyhII8TzMe8YZG1Whw7ApRHUXoUHe8S5Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGdXBSjEe36QBFNMliYlShxNPHPILtVxeKnzef1vZt5EOl7i+/acUMk5WxkgUy0M4zSCt4il3QELa3beZMeQxNNPMuAcpwh9ZHLNGjPcTCvUlYpln83enFJlKh2F3JMKUS/r12JodKcZ1wG8aJO8dfDe3e9XAaPaEwxNl4ctqOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM124wdA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM124wdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDEF31F000E9;
	Mon, 17 Aug 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786957395;
	bh=vU9o3eVF1WulfbQq6pcGxXVkjrG6EInsIo2eMeal7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NM124wdAMZPBfy6DsQk99dB1q2RisFJo6OcdiAf+glpYZiE3QDbGBTxjOnzXcZhbF
	 JFqQ4jZescHyF9T1rARJ6INITMzQEX8ORiNQL9vvnvQbNJIMxNHLrtbW1BZj6YGsR5
	 7L+xsJ2n2gFKvgze/vetpK684hVfdyOxbuQwlC97qHE4CPPXLnDNmusCLrBOs/qatw
	 Lsq3KJ1gSn9+tzZlUi4lajgdMtal459OgPr1Pgt06REbGiK13VxyKB5Y+GebbwKOJB
	 Cm5uKyqYFmlzc2SAggFWNGJInwwj9Ax8meUVyIXHG/JvDCVtssL8aKwh4ZMw8Mvfga
	 Fz4S5YJXZHsyg==
Date: Mon, 17 Aug 2026 11:03:09 +0200
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoLOL-1JRTElewuP@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lm2dcgkauosbm7c2"
Content-Disposition: inline
In-Reply-To: <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>


--lm2dcgkauosbm7c2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org, 
	libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <aoLOL-1JRTElewuP@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
 <20260816131955.lbuwrp32eyq4rt4b@pali>
 <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
MIME-Version: 1.0
In-Reply-To: <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>

Hi all,

> Date: 2026-08-16 12:49:59-0700
> From: "H. Peter Anvin" <hpa@zytor.com>
>
> On August 16, 2026 6:19:55 AM PDT, "Pali Roh=C3=A1r" <pali@kernel.org> wr=
ote:
> >On Sunday 16 August 2026 10:03:24 Adhemerval Zanella Netto wrote:
> >> On 16/08/26 09:15, Pali Roh=C3=A1r wrote:
> >> > On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
> >> >> Hi!
> >> >>
> >> >> I was just refreshing my mind about documentation around TIOCGWINSZ,
> >> >> and noticed the weird <asm/termbits.h> and <asm/termios.h> usage in
> >> >> various ioctl man pages.
> >> >>
> >> >> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec=
2,
> >> >> where it states that the =C2=ABstruct termios=C2=BB definitions in =
the
> >> >> <termios.h> header are incompatible with the defined ioctl calls.
> >> >>
> >> >> This seems problematic, for one because the <asm/*> headers are Lin=
ux
> >> >> specific, so they reduce portability for all these macros, even when
> >> >> they do not rely or make use of =C2=ABstruct termios=C2=BB. For ano=
ther because if
> >> >> there is a problem in glibc with the interaction between =C2=ABstru=
ct termios=C2=BB
> >> >> and the ioctl calls, then that should be fixed in glibc, instead of
> >> >> adding these workarounds in the man pages.
> >> >>
> >> >> It seems the problem is that in glibc =C2=ABstruct termios=C2=BB ma=
ps to the Linux
> >> >> =C2=ABstruct termios2=C2=BB, but the macros for ioctls that use =C2=
=ABstruct termios=C2=BB
> >> >> do not match (for example TCGETS instead of TCGETS2)?
> >> >>
> >> >>
> >> >> I think this should be fixed both in glibc, to make the definitions
> >> >> coherent, and in man-pages to not use those Linux-only headers where
> >> >> it is not necessary and then on a second stage to point back to the
> >> >> portable headers once glibc has been fixed?
> >> >>
> >> >> Thanks,
> >> >> Guillem
> >> >=20
> >> > Hello! The main problem is that glibc has different API and ABI for
> >> > termios functions and structures than the raw Linux syscalls.
> >> >=20
> >> > And at the same time glibc does not provide API for all functionality
> >> > which Linux syscall provides.
> >> >=20
> >> > And POSIX, nor GNU does not provide functions / API for setting
> >> > arbitrary baudrate on the tty device.
> >>=20
> >> From NEWS:
> >>=20
> >>  464 Version 2.42
> >>  [...]
> >>  481 * On Linux, the <termios.h> interface now supports arbitrary baud=
 rates;
> >>  482   speed_t is redefined to simply be the baud rate specified as an
> >>  483   unsigned int, which matches the kernel interface.
> >
> >Nice! So it was finally done.
> >
> >> >=20
> >> > So all this functionality and information in the manpage are Linux
> >> > specific, they are not portable.
> >> >=20
> >> > Therefore in this case it is necessary for Linux specific thing to u=
se
> >> > Linux-only headers.
> >> >=20
> >> > When I was looking at it in the past, I had feeling that glibc cannot
> >> > easily fix it because it would break existing glibc ABI and contract=
 for
> >> > all existing applications.
> >>=20
> >> It turned out to be doable, speed_t was already an unsigned int, old b=
inaries
> >> and the legacy Bxxxx bit-pattern values remain accepted for compatibil=
ity.
> >>=20
> >> The struct termios ABI was preserved (the kernel conversion happens in=
side
> >> tcgetattr/tcsetattr).
> >>=20
> >> There was one regression in the transition (BZ 33340, non-standard bau=
d handling
> >> of CIBAUD), fixed for 2.43 by 8d999a69936.
> >>=20
> >> >=20
> >> > But once glibc provides API for setting the arbitrary baudrate on tty
> >> > device, we can improve the manpages. But as this did not happened
> >> > for 30 years (in past I saw that there were some attempts), I doubt =
that
> >> > it would be in near future. It is not easy thing.
> >>=20
> >> The incompatibility we have is glibc and kernel struct termios have di=
fferent
> >> layout, so mixing them is a recipe for trouble.
> >
> >Yes, this is what I remember that there are two structures with same
> >name but different layout and I was passing the wrong one to ioctl and
> >it did not worked.
> >
> >> Kudos to H. Peter Anvin for this work.
> >
> >Thank you very much for this work.
>=20
> It is not just the structure but the Bxxx and several other constants as =
well. My advice is to use <linux/termios.h> in a separate translation unit =
if one is to use the ioctl interface directly.=20
>=20
> It is *also* important to note that not all platforms have the TC*ETS*2 i=
octls, and on powerpc the ioctl numbers in glibc are different. Virtually a=
ll code I have seen gets this wrong, together with the handling of CIBAUD.
>=20
> glibc now also has an explicitly numeric interface, with -baud instead of=
 -speed; the hope is that POSIX will eventually adopt that interface too.

So, any suggested changes to the manual pages?


Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--lm2dcgkauosbm7c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmqCzk0ACgkQ64mZXMKQ
wqmuKRAAkL27y+Nq9kHOWb2V8wDuTRMzr9XiSKK7cNV7cWuItqjcZ+95459ALJ6K
Xg/NZ2xWoEPD6Gq6eXa0AKDEtHhXDI5zrWnCkTgEWuV2z40cGPDbq0RHxAc4ceBS
lW9qZkDZwcx1Vw7EmQ42PB+nQYDPNlHwI0beXunuUvVGNPjpuAPr6YHrALFrtDwg
xBsw16fNx2KhJcAgvhjkDrfDfIM9/aTDj3JiA95ChbHmCJbOE2LtEyQXOnU/ROC2
rq40nnKRMdTAbjDjpA8kTO0Aj7qPJMiYIwZZElzQPJdx0KK4BByyxdH90UQDdpqJ
xH3wIhWAOKizx7nss0paU7RIG4xKAfMqiPedd5s6PvTdA6HKzEyGHuQY4gGXPcHo
ZuH68eOfP5zHe4U4QLqV8d09g4Lz+cykeklKfGAJfvwu0DorMSPCZ3629Nylrrdw
MyQj+isqtF7rsQ0P7WC31JHLjvOtPoMBjWtX3swKY2eiclOygSJdA/6TlQePJak4
Zn8gojpSGmA5MN/dIEopBe+DBexo8xFG1B/nen+OAnOGlGA7ua6kiENOevmtcLLC
+U3zsGWqnJy/cadLwknm5DIGilQ4I2OYJpSbUHowM/+Elnc7EgTAc7Kxsef0eiQS
5j1td1fYBOSBkIpokZC0piCmXtmdNCCJO81XzKgRcR58XFkyIBo=
=xuQO
-----END PGP SIGNATURE-----

--lm2dcgkauosbm7c2--
