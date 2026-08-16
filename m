Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B8318EF4
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 20:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786911104; cv=none; b=A+6Kp1WoY/yeLkhCgTabKW/nkMN/iAeX5Hg0Bbindrq5nsUoAeqS4PQlA3peC5j6yOU+ygYT7he7KfXhF2Ix3DdlN7N82HHMyDXSXpZ4n0SruZhwxwCHoDw2Gp3B8ftx2nMnEAv1vPB+NB9MDhrTkjZ/6rxjm5K2W9TFmNuZJts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786911104; c=relaxed/simple;
	bh=t8BUIPtOrF3VE47fZuOWX9MrZHsxVSPiD1tepJepFhc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YCS/3YgjCVj0OqZRqrdDbMITK9Ug5NGJjCk2ja6AEhKB5289ZVh1qGMRXWpOI7trRlHk2hkye0dBD3wvtCHxUQ+gSgKzyiX/5i+769y1QWYL9CqIyV5Qn3RLAA51W6WGH5fqb0PIf8OzsSMmtAb3jxUisOxJeqW8AKdu6PcAESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=qJniSiRG; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="qJniSiRG"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 67GKBXKi3766610
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 16 Aug 2026 13:11:34 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 67GKBXKi3766610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026072801; t=1786911094;
	bh=YEvNYlSw5V52LhaEy+Y3OrVvrn/g9JlpP8tCkudzTe8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=qJniSiRGIXzMd57//avXtp47bb/UZ8gW9rJpDuwbao/0GjOCirZzVL/52QE5uMGZp
	 PxfGd7pUyU5gK+b/moJ8wxifMcphVUY62qxLvt+WAIXHRLsv7Yll6fntkElj4LQGh7
	 gL4kqAVXKQQLiC9a6T/0n+KL/U9pqsPhDUzPyfF3sQ8qKi6pIMFNbBb+iNyaRGlCbH
	 rOtZMlLaVB7PplwCfUih4OvPC4G0fkQjA3wm+PibWvvZCCi0YWTO+aDvVaosno9wYW
	 gKvj9At61IpRVr0f8MI4IIpFNCWeXgKvfOAZFn/XpwmkalV02u4ztmG+34z5QMODZW
	 JBjf8cNg5OCWw==
Date: Sun, 16 Aug 2026 13:11:28 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
CC: Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
User-Agent: K-9 Mail for Android
In-Reply-To: <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org> <20260816121505.jyz3ynrb3rxlvq6h@pali> <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org> <20260816131955.lbuwrp32eyq4rt4b@pali> <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
Message-ID: <5FED7739-1E2D-49E7-9A09-D17AAFBC973D@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2026 12:49:59 PM PDT, "H=2E Peter Anvin" <hpa@zytor=2Ecom> wr=
ote:
>On August 16, 2026 6:19:55 AM PDT, "Pali Roh=C3=A1r" <pali@kernel=2Eorg> =
wrote:
>>On Sunday 16 August 2026 10:03:24 Adhemerval Zanella Netto wrote:
>>> On 16/08/26 09:15, Pali Roh=C3=A1r wrote:
>>> > On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
>>> >> Hi!
>>> >>
>>> >> I was just refreshing my mind about documentation around TIOCGWINSZ=
,
>>> >> and noticed the weird <asm/termbits=2Eh> and <asm/termios=2Eh> usag=
e in
>>> >> various ioctl man pages=2E
>>> >>
>>> >> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec=
2,
>>> >> where it states that the =C2=ABstruct termios=C2=BB definitions in =
the
>>> >> <termios=2Eh> header are incompatible with the defined ioctl calls=
=2E
>>> >>
>>> >> This seems problematic, for one because the <asm/*> headers are Lin=
ux
>>> >> specific, so they reduce portability for all these macros, even whe=
n
>>> >> they do not rely or make use of =C2=ABstruct termios=C2=BB=2E For a=
nother because if
>>> >> there is a problem in glibc with the interaction between =C2=ABstru=
ct termios=C2=BB
>>> >> and the ioctl calls, then that should be fixed in glibc, instead of
>>> >> adding these workarounds in the man pages=2E
>>> >>
>>> >> It seems the problem is that in glibc =C2=ABstruct termios=C2=BB ma=
ps to the Linux
>>> >> =C2=ABstruct termios2=C2=BB, but the macros for ioctls that use =C2=
=ABstruct termios=C2=BB
>>> >> do not match (for example TCGETS instead of TCGETS2)?
>>> >>
>>> >>
>>> >> I think this should be fixed both in glibc, to make the definitions
>>> >> coherent, and in man-pages to not use those Linux-only headers wher=
e
>>> >> it is not necessary and then on a second stage to point back to the
>>> >> portable headers once glibc has been fixed?
>>> >>
>>> >> Thanks,
>>> >> Guillem
>>> >=20
>>> > Hello! The main problem is that glibc has different API and ABI for
>>> > termios functions and structures than the raw Linux syscalls=2E
>>> >=20
>>> > And at the same time glibc does not provide API for all functionalit=
y
>>> > which Linux syscall provides=2E
>>> >=20
>>> > And POSIX, nor GNU does not provide functions / API for setting
>>> > arbitrary baudrate on the tty device=2E
>>>=20
>>> From NEWS:
>>>=20
>>>  464 Version 2=2E42
>>>  [=2E=2E=2E]
>>>  481 * On Linux, the <termios=2Eh> interface now supports arbitrary ba=
ud rates;
>>>  482   speed_t is redefined to simply be the baud rate specified as an
>>>  483   unsigned int, which matches the kernel interface=2E
>>
>>Nice! So it was finally done=2E
>>
>>> >=20
>>> > So all this functionality and information in the manpage are Linux
>>> > specific, they are not portable=2E
>>> >=20
>>> > Therefore in this case it is necessary for Linux specific thing to u=
se
>>> > Linux-only headers=2E
>>> >=20
>>> > When I was looking at it in the past, I had feeling that glibc canno=
t
>>> > easily fix it because it would break existing glibc ABI and contract=
 for
>>> > all existing applications=2E
>>>=20
>>> It turned out to be doable, speed_t was already an unsigned int, old b=
inaries
>>> and the legacy Bxxxx bit-pattern values remain accepted for compatibil=
ity=2E
>>>=20
>>> The struct termios ABI was preserved (the kernel conversion happens in=
side
>>> tcgetattr/tcsetattr)=2E
>>>=20
>>> There was one regression in the transition (BZ 33340, non-standard bau=
d handling
>>> of CIBAUD), fixed for 2=2E43 by 8d999a69936=2E
>>>=20
>>> >=20
>>> > But once glibc provides API for setting the arbitrary baudrate on tt=
y
>>> > device, we can improve the manpages=2E But as this did not happened
>>> > for 30 years (in past I saw that there were some attempts), I doubt =
that
>>> > it would be in near future=2E It is not easy thing=2E
>>>=20
>>> The incompatibility we have is glibc and kernel struct termios have di=
fferent
>>> layout, so mixing them is a recipe for trouble=2E
>>
>>Yes, this is what I remember that there are two structures with same
>>name but different layout and I was passing the wrong one to ioctl and
>>it did not worked=2E
>>
>>> Kudos to H=2E Peter Anvin for this work=2E
>>
>>Thank you very much for this work=2E
>
>It is not just the structure but the Bxxx and several other constants as =
well=2E My advice is to use <linux/termios=2Eh> in a separate translation u=
nit if one is to use the ioctl interface directly=2E=20
>
>It is *also* important to note that not all platforms have the TC*ETS*2 i=
octls, and on powerpc the ioctl numbers in glibc are different=2E Virtually=
 all code I have seen gets this wrong, together with the handling of CIBAUD=
=2E
>
>glibc now also has an explicitly numeric interface, with -baud instead of=
 -speed; the hope is that POSIX will eventually adopt that interface too=2E
I also am expecting that at some point we are going to represent more than=
 4 Gbps=2E This is why baud_t is explicitly *not* defined to be an integer;=
 it would be far more logical to make the kernel interface contain a scalin=
g factor =E2=80=93 in other words, floating point=2E

A single precision floating-point number (with a suitable cflag to indicat=
e that encoding) would fit quite nicely and be able to encode up to 3=2E4=
=C3=9710=C2=B3=E2=81=B8 bps to a precision of =C2=B160 ppb both of which pr=
ovide enormous headroom for any real-life application=2E

It also gives *downward* headroom for extremely slow baud rates, like "B13=
4" which is really supposed to be 134=2E5 or the teletype 45=2E45=2E Extrem=
ely low rates can be important in some specialized applications like radio=
=2E

This doesn't mean the kernel would use floating-point math, just that sinc=
e the format exists we might as well use it=2E

Most advanced hardware implementations these days end up with a base frequ=
ency which can be chosen from a limited number of prescaler values and/or b=
ase oscillators (often rather arbitrary), a multiplier, and a divider, all =
of which have a specific limited ranges=2E These values can sometimes be fr=
actional and nearly always includes a fixed constant like 16, but from an a=
lgorithm point of view that can always be absorbed into the base frequency=
=2E

