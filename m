Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B905D3B811F
	for <linux-man@vger.kernel.org>; Mon, 17 Aug 2026 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786958646; cv=none; b=V2IdE6ZKlG/3GX9RILCXKVW9LIlefy64ZVoRV4RhsBsh9NIadtsCXNuBNDgRSrhmO2Km0BrEnJ/EXqPKQjazVU90nR33MXYDCI3zDxx96rzmHqvuSiOtkSZT5gF06dpQJjjdnpjyun/eaf5Av5rrwurBcPHrxvX3ejC+WAafY7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786958646; c=relaxed/simple;
	bh=/arUInePj3DiwBQwiz/doe0q6gHIToy8tzb/iVO2Ro8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hKbWwvfGUorZ9h5/pwzjFZ/iQFBPkHIMsu5oRm9cBkrddbda6rlIRzdMvdmci8XQp0OPIgy5QB99WloENuhI09NGixQYje+RiW3at9QudD8L/MS/JEvCZaO+YY5aQD4ErsCdevgWuZZmqXRB6eQPkKaG2rho7xMyhWDbcZkqALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=DAjrLOU3; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="DAjrLOU3"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 67H9NjMo899782
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 17 Aug 2026 02:23:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 67H9NjMo899782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026072801; t=1786958626;
	bh=KN/FrJQN87yduGwl8irQfOez0bRgT42AScnWJJWkEco=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DAjrLOU33WQ+KFF+0+MDg/+KD+IN621HlamOO4Y7GaXjuyt2gm+J+9CfWXzeznjO/
	 Rx0oZMkBgNAB5xt3hD/p0ok4J/wi3Lt+xkwDT9W5rGe7UWYR2PZiOfaKPDEx6daOcp
	 937e64HKR6t25LbDiC2waCfAGtOZlItblxcpxBSlISEfgl8Sg8ft2z3YdVRqYOGN6K
	 gZj4+9I8fqesPi0S6J/r+Hj4o2EfVXmThmaiVGyzxfGCXz+9hr1sRQQkIMaTdyWydU
	 4ZYxjP1YAm5LD3egzjWISq44tq7DXazBp8J8kk5i7HZ3aMeww5QNDxvsio1nz3PMX6
	 DUh+8TdhX8ZOw==
Date: Mon, 17 Aug 2026 02:23:39 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Alejandro Colomar <alx@kernel.org>
CC: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
        Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
User-Agent: K-9 Mail for Android
In-Reply-To: <aoLOL-1JRTElewuP@debian>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org> <20260816121505.jyz3ynrb3rxlvq6h@pali> <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org> <20260816131955.lbuwrp32eyq4rt4b@pali> <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com> <aoLOL-1JRTElewuP@debian>
Message-ID: <919B6782-3170-4A69-8431-1576526CA33A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 17, 2026 2:03:09 AM PDT, Alejandro Colomar <alx@kernel=2Eorg> wro=
te:
>Hi all,
>
>> Date: 2026-08-16 12:49:59-0700
>> From: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>>
>> On August 16, 2026 6:19:55 AM PDT, "Pali Roh=C3=A1r" <pali@kernel=2Eorg=
> wrote:
>> >On Sunday 16 August 2026 10:03:24 Adhemerval Zanella Netto wrote:
>> >> On 16/08/26 09:15, Pali Roh=C3=A1r wrote:
>> >> > On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
>> >> >> Hi!
>> >> >>
>> >> >> I was just refreshing my mind about documentation around TIOCGWIN=
SZ,
>> >> >> and noticed the weird <asm/termbits=2Eh> and <asm/termios=2Eh> us=
age in
>> >> >> various ioctl man pages=2E
>> >> >>
>> >> >> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9=
ec2,
>> >> >> where it states that the =C2=ABstruct termios=C2=BB definitions i=
n the
>> >> >> <termios=2Eh> header are incompatible with the defined ioctl call=
s=2E
>> >> >>
>> >> >> This seems problematic, for one because the <asm/*> headers are L=
inux
>> >> >> specific, so they reduce portability for all these macros, even w=
hen
>> >> >> they do not rely or make use of =C2=ABstruct termios=C2=BB=2E For=
 another because if
>> >> >> there is a problem in glibc with the interaction between =C2=ABst=
ruct termios=C2=BB
>> >> >> and the ioctl calls, then that should be fixed in glibc, instead =
of
>> >> >> adding these workarounds in the man pages=2E
>> >> >>
>> >> >> It seems the problem is that in glibc =C2=ABstruct termios=C2=BB =
maps to the Linux
>> >> >> =C2=ABstruct termios2=C2=BB, but the macros for ioctls that use =
=C2=ABstruct termios=C2=BB
>> >> >> do not match (for example TCGETS instead of TCGETS2)?
>> >> >>
>> >> >>
>> >> >> I think this should be fixed both in glibc, to make the definitio=
ns
>> >> >> coherent, and in man-pages to not use those Linux-only headers wh=
ere
>> >> >> it is not necessary and then on a second stage to point back to t=
he
>> >> >> portable headers once glibc has been fixed?
>> >> >>
>> >> >> Thanks,
>> >> >> Guillem
>> >> >=20
>> >> > Hello! The main problem is that glibc has different API and ABI fo=
r
>> >> > termios functions and structures than the raw Linux syscalls=2E
>> >> >=20
>> >> > And at the same time glibc does not provide API for all functional=
ity
>> >> > which Linux syscall provides=2E
>> >> >=20
>> >> > And POSIX, nor GNU does not provide functions / API for setting
>> >> > arbitrary baudrate on the tty device=2E
>> >>=20
>> >> From NEWS:
>> >>=20
>> >>  464 Version 2=2E42
>> >>  [=2E=2E=2E]
>> >>  481 * On Linux, the <termios=2Eh> interface now supports arbitrary =
baud rates;
>> >>  482   speed_t is redefined to simply be the baud rate specified as =
an
>> >>  483   unsigned int, which matches the kernel interface=2E
>> >
>> >Nice! So it was finally done=2E
>> >
>> >> >=20
>> >> > So all this functionality and information in the manpage are Linux
>> >> > specific, they are not portable=2E
>> >> >=20
>> >> > Therefore in this case it is necessary for Linux specific thing to=
 use
>> >> > Linux-only headers=2E
>> >> >=20
>> >> > When I was looking at it in the past, I had feeling that glibc can=
not
>> >> > easily fix it because it would break existing glibc ABI and contra=
ct for
>> >> > all existing applications=2E
>> >>=20
>> >> It turned out to be doable, speed_t was already an unsigned int, old=
 binaries
>> >> and the legacy Bxxxx bit-pattern values remain accepted for compatib=
ility=2E
>> >>=20
>> >> The struct termios ABI was preserved (the kernel conversion happens =
inside
>> >> tcgetattr/tcsetattr)=2E
>> >>=20
>> >> There was one regression in the transition (BZ 33340, non-standard b=
aud handling
>> >> of CIBAUD), fixed for 2=2E43 by 8d999a69936=2E
>> >>=20
>> >> >=20
>> >> > But once glibc provides API for setting the arbitrary baudrate on =
tty
>> >> > device, we can improve the manpages=2E But as this did not happene=
d
>> >> > for 30 years (in past I saw that there were some attempts), I doub=
t that
>> >> > it would be in near future=2E It is not easy thing=2E
>> >>=20
>> >> The incompatibility we have is glibc and kernel struct termios have =
different
>> >> layout, so mixing them is a recipe for trouble=2E
>> >
>> >Yes, this is what I remember that there are two structures with same
>> >name but different layout and I was passing the wrong one to ioctl and
>> >it did not worked=2E
>> >
>> >> Kudos to H=2E Peter Anvin for this work=2E
>> >
>> >Thank you very much for this work=2E
>>=20
>> It is not just the structure but the Bxxx and several other constants a=
s well=2E My advice is to use <linux/termios=2Eh> in a separate translation=
 unit if one is to use the ioctl interface directly=2E=20
>>=20
>> It is *also* important to note that not all platforms have the TC*ETS*2=
 ioctls, and on powerpc the ioctl numbers in glibc are different=2E Virtual=
ly all code I have seen gets this wrong, together with the handling of CIBA=
UD=2E
>>=20
>> glibc now also has an explicitly numeric interface, with -baud instead =
of -speed; the hope is that POSIX will eventually adopt that interface too=
=2E
>
>So, any suggested changes to the manual pages?
>
>
>Have a lovely day!
>Alex
>

Didn't we talk about this about two months ago?
