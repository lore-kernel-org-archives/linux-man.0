Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1478C3E009D
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786882508; cv=none; b=lJB+ECKPAOeVLy/43UIsC7Z9x5e2nJZUXG7mPnFtn6FHrvCV9m7JUz1e+iB6zv43P/+mQzSlvlk5tamNi4Vip9lP4PCVHncU8Vg/tnVWUacgcOUtf7puT/p3VKwQg5EDRP6izTHJEP5hPIlNmCWsaK4XjqzhMA4+9Vy7lXmGtLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786882508; c=relaxed/simple;
	bh=dgmB+CzQ5YtKyyFugr2i7wNJ15urRFMwSMOheeYGl4o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QA8PAj/piha331XG1faAp/XHEssLxyOganGtf8cdm5PvkJTKzEvI2tWn2kWNz118bOGoYnwsTc9h11oU7tvmx+HlASE0psgzXQxg+odf+V1anxRdiRJyENbLek6CxnMhlbYnA84Ob7sTB3EgMoYT15PZPEEWJCQ4I/gkoUHZKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIbg8oLW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIbg8oLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AAF1F000E9;
	Sun, 16 Aug 2026 12:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786882505;
	bh=/ADk5V4F/bZaW/OwweyRhcsAUgYWDuRT1H7N2lWGAWQ=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=CIbg8oLWOxDtUhfdkecLCkTxWZZS1XVib6vX6fwa8q/Gbchp3eqk1Umom5J+Zqlk/
	 d/XBdCUofM4zZkahgit1ordDJD6DgxqirQdJ1cBs98atpzyVXoQv2NMooRaDW5Qme2
	 mXr8m3UQ8ZdD92+1B/GQGAdunOO/i79PM5+qW9yryj498UghjgWWFCCKR2RXpY+K9W
	 ow0EEzKCxOp86sZi28qNOaIZMrCvMfo4xOLg5P5MVDLA4W0PplcHnQmDkg7lqS9dRK
	 tZWBjHhrfamGi22HSXqJ7ixgvuzyBuoGzLB0m1uLD6c7PCGjcgJ6IVxdo5zbHY5t6t
	 qf9bChnptE7Rg==
Received: by pali.im (Postfix)
	id 6A33168D; Sun, 16 Aug 2026 14:15:05 +0200 (CEST)
Date: Sun, 16 Aug 2026 14:15:05 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <20260816121505.jyz3ynrb3rxlvq6h@pali>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
User-Agent: NeoMutt/20180716

On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
> Hi!
> 
> I was just refreshing my mind about documentation around TIOCGWINSZ,
> and noticed the weird <asm/termbits.h> and <asm/termios.h> usage in
> various ioctl man pages.
> 
> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec2,
> where it states that the «struct termios» definitions in the
> <termios.h> header are incompatible with the defined ioctl calls.
> 
> This seems problematic, for one because the <asm/*> headers are Linux
> specific, so they reduce portability for all these macros, even when
> they do not rely or make use of «struct termios». For another because if
> there is a problem in glibc with the interaction between «struct termios»
> and the ioctl calls, then that should be fixed in glibc, instead of
> adding these workarounds in the man pages.
> 
> It seems the problem is that in glibc «struct termios» maps to the Linux
> «struct termios2», but the macros for ioctls that use «struct termios»
> do not match (for example TCGETS instead of TCGETS2)?
> 
> 
> I think this should be fixed both in glibc, to make the definitions
> coherent, and in man-pages to not use those Linux-only headers where
> it is not necessary and then on a second stage to point back to the
> portable headers once glibc has been fixed?
> 
> Thanks,
> Guillem

Hello! The main problem is that glibc has different API and ABI for
termios functions and structures than the raw Linux syscalls.

And at the same time glibc does not provide API for all functionality
which Linux syscall provides.

And POSIX, nor GNU does not provide functions / API for setting
arbitrary baudrate on the tty device.

So all this functionality and information in the manpage are Linux
specific, they are not portable.

Therefore in this case it is necessary for Linux specific thing to use
Linux-only headers.

When I was looking at it in the past, I had feeling that glibc cannot
easily fix it because it would break existing glibc ABI and contract for
all existing applications.

But once glibc provides API for setting the arbitrary baudrate on tty
device, we can improve the manpages. But as this did not happened
for 30 years (in past I saw that there were some attempts), I doubt that
it would be in near future. It is not easy thing.

Pali
