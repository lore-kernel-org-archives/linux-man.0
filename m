Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E402C38F25C
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 19:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909837; cv=none; b=ZToBGue6tQEOHdPzosE8g7i+0JoBVfSmqBLRfg4mGaR1OOrBy4hk1Q2xUJ2agaCadW+Q6PFxFoTztNiqAv220P//Lr+npwk6yQ4kV2FOkSfjSfH3dIXCSd8GVdH5e9gr0euqv00pyXqRRkJaVHM+hRx55NDw65H1coJmQF9lSHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909837; c=relaxed/simple;
	bh=foLTLeu/FcPjDMx0suq/DlUp5p5JJJQh8o8toI/tU+o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=m1r/yPi/deRlldzpHyL8TLFc2tWRenn0RCJal+Swaq+/Kw2DqRheJ3CNtwXLEfPvYJbQHhZXWE0uSJHg6iGvDXo7kQoS10DNvNOnWnupfcOZa3pq0sv53Yll6XuvTo62yHfTw77vS7IHn3G62PTnj3EpcnwEoeM05cuh62Iq6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=mkI03AKV; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="mkI03AKV"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 67GJo6uS3731932
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 16 Aug 2026 12:50:06 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 67GJo6uS3731932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026072801; t=1786909806;
	bh=AnJWq2lVOXe4L5hd24+gqRC7v/q7SMbx9RT7YyCgQXs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mkI03AKVNaRdXDhpOVcTTcPX256EcbZtPP4zsp+JfqTDQwogRjMZvVqnctgc9Kb2I
	 iLNqNBFIkxz32BcQ3NXSgUgld3JQPuSsetExJNluwA/VqoVhH/4nZXpuuIj28AV8lX
	 /6mFgPHDFPgpILfx0KTYkZ66KrydJ/XlB7KLMbgO04BjZYKbRDn5p4e0oEMXKBUfZx
	 IGpdM5YGupCvW2hUDVcNXH4UY8CrELHE7FC2VjoHm1dqU5BKE+dn0TtJUw6MGMycSz
	 bYyrpkAptX5XLcDv3ZcjPVV3XqV+mY3iTtMvXmnBtcxj5Q+3HUkj0oPnNiS1Oca1Fc
	 /2jfIKX6vdt/w==
Date: Sun, 16 Aug 2026 12:49:59 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
CC: Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
        libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
User-Agent: K-9 Mail for Android
In-Reply-To: <20260816131955.lbuwrp32eyq4rt4b@pali>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org> <20260816121505.jyz3ynrb3rxlvq6h@pali> <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org> <20260816131955.lbuwrp32eyq4rt4b@pali>
Message-ID: <83BA7F0B-7318-4F8B-B59B-1F508750E276@zytor.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On August 16, 2026 6:19:55 AM PDT, "Pali Roh=C3=A1r" <pali@kernel=2Eorg> wr=
ote:
>On Sunday 16 August 2026 10:03:24 Adhemerval Zanella Netto wrote:
>> On 16/08/26 09:15, Pali Roh=C3=A1r wrote:
>> > On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
>> >> Hi!
>> >>
>> >> I was just refreshing my mind about documentation around TIOCGWINSZ,
>> >> and noticed the weird <asm/termbits=2Eh> and <asm/termios=2Eh> usage=
 in
>> >> various ioctl man pages=2E
>> >>
>> >> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec2=
,
>> >> where it states that the =C2=ABstruct termios=C2=BB definitions in t=
he
>> >> <termios=2Eh> header are incompatible with the defined ioctl calls=
=2E
>> >>
>> >> This seems problematic, for one because the <asm/*> headers are Linu=
x
>> >> specific, so they reduce portability for all these macros, even when
>> >> they do not rely or make use of =C2=ABstruct termios=C2=BB=2E For an=
other because if
>> >> there is a problem in glibc with the interaction between =C2=ABstruc=
t termios=C2=BB
>> >> and the ioctl calls, then that should be fixed in glibc, instead of
>> >> adding these workarounds in the man pages=2E
>> >>
>> >> It seems the problem is that in glibc =C2=ABstruct termios=C2=BB map=
s to the Linux
>> >> =C2=ABstruct termios2=C2=BB, but the macros for ioctls that use =C2=
=ABstruct termios=C2=BB
>> >> do not match (for example TCGETS instead of TCGETS2)?
>> >>
>> >>
>> >> I think this should be fixed both in glibc, to make the definitions
>> >> coherent, and in man-pages to not use those Linux-only headers where
>> >> it is not necessary and then on a second stage to point back to the
>> >> portable headers once glibc has been fixed?
>> >>
>> >> Thanks,
>> >> Guillem
>> >=20
>> > Hello! The main problem is that glibc has different API and ABI for
>> > termios functions and structures than the raw Linux syscalls=2E
>> >=20
>> > And at the same time glibc does not provide API for all functionality
>> > which Linux syscall provides=2E
>> >=20
>> > And POSIX, nor GNU does not provide functions / API for setting
>> > arbitrary baudrate on the tty device=2E
>>=20
>> From NEWS:
>>=20
>>  464 Version 2=2E42
>>  [=2E=2E=2E]
>>  481 * On Linux, the <termios=2Eh> interface now supports arbitrary bau=
d rates;
>>  482   speed_t is redefined to simply be the baud rate specified as an
>>  483   unsigned int, which matches the kernel interface=2E
>
>Nice! So it was finally done=2E
>
>> >=20
>> > So all this functionality and information in the manpage are Linux
>> > specific, they are not portable=2E
>> >=20
>> > Therefore in this case it is necessary for Linux specific thing to us=
e
>> > Linux-only headers=2E
>> >=20
>> > When I was looking at it in the past, I had feeling that glibc cannot
>> > easily fix it because it would break existing glibc ABI and contract =
for
>> > all existing applications=2E
>>=20
>> It turned out to be doable, speed_t was already an unsigned int, old bi=
naries
>> and the legacy Bxxxx bit-pattern values remain accepted for compatibili=
ty=2E
>>=20
>> The struct termios ABI was preserved (the kernel conversion happens ins=
ide
>> tcgetattr/tcsetattr)=2E
>>=20
>> There was one regression in the transition (BZ 33340, non-standard baud=
 handling
>> of CIBAUD), fixed for 2=2E43 by 8d999a69936=2E
>>=20
>> >=20
>> > But once glibc provides API for setting the arbitrary baudrate on tty
>> > device, we can improve the manpages=2E But as this did not happened
>> > for 30 years (in past I saw that there were some attempts), I doubt t=
hat
>> > it would be in near future=2E It is not easy thing=2E
>>=20
>> The incompatibility we have is glibc and kernel struct termios have dif=
ferent
>> layout, so mixing them is a recipe for trouble=2E
>
>Yes, this is what I remember that there are two structures with same
>name but different layout and I was passing the wrong one to ioctl and
>it did not worked=2E
>
>> Kudos to H=2E Peter Anvin for this work=2E
>
>Thank you very much for this work=2E

It is not just the structure but the Bxxx and several other constants as w=
ell=2E My advice is to use <linux/termios=2Eh> in a separate translation un=
it if one is to use the ioctl interface directly=2E=20

It is *also* important to note that not all platforms have the TC*ETS*2 io=
ctls, and on powerpc the ioctl numbers in glibc are different=2E Virtually =
all code I have seen gets this wrong, together with the handling of CIBAUD=
=2E

glibc now also has an explicitly numeric interface, with -baud instead of =
-speed; the hope is that POSIX will eventually adopt that interface too=2E
