Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FC1175A68
	for <linux-man@vger.kernel.org>; Sun, 16 Aug 2026 13:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886397; cv=none; b=tcp09SwzhzSvtjakyjfkin1z7/3Rgwmr5VLdowISJMQu7tQt8TmCH729MsxNw1BN0f/fabF7K1sS6DVnf8twQgjb6TnuDQ1mw1E70CLxo7TrioJbSoLNPDrMHRI7pUTj9j3bcRT3pE0LPjUgMT8OsnHP2h4wzDV7W9b+jQ38mtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886397; c=relaxed/simple;
	bh=f+re7PRAmAAzIxFXk52LdxHDD6G1HuhcmcaV52pq/aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh3JQu6g0mKPBOGPyswTgk1v1NzuSFU3QgnTeDJxD7H8HjlAOULeHrBU4HpQ953rlzSgSwnqhufSvl1Nafa95C+keT+TXRKvs1lc5AVo6Je/919GYoPhdnm4MrpWK8Bykqo8mruj8lHlQ3vRN2Hi5hZUddxc7ek8ev23P0uTGjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c961/Ju0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c961/Ju0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E771F000E9;
	Sun, 16 Aug 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786886396;
	bh=pv/UAw+FFUHLyWXlD1Zjl6cZ0dNPb3PVj+sPMrjM+yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c961/Ju0Ww2fr6XUu7BlUBdgwTLH/2x2lFLF5pfYxdUoj2oxO8s9GJcoHb7MzaHyO
	 X6AVeO/nwF1LPkw4SGiMo6ixAn6sW/CLCU8mFeJl8tgxVFYEeVU9A80gmHome+CGKF
	 SB6TUpCYXnb774wP7HPknai7t1mKAHIzXmC5pvFvSDYsFtuBkVoWzFv3zjH959nZ/D
	 kGHd3vROKCREkg8gS9rJzx+mzka3ZypThtSI3QRTxayCmpPZDnCV3LljM+hCpF66TG
	 Z9wdEGkw8dnwe1s/rXwtS+eIwE1fxT6mTU1lwQtH6oxIS1UFnhNiJUGEJOnajO1QHQ
	 eWNuUj9R0jkeQ==
Received: by pali.im (Postfix)
	id AE1EA68D; Sun, 16 Aug 2026 15:19:55 +0200 (CEST)
Date: Sun, 16 Aug 2026 15:19:55 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Cc: Guillem Jover <guillem@debian.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Alejandro Colomar <alx@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: On <asm/termbits.h> and <asm/termios.h> usage in man pages
Message-ID: <20260816131955.lbuwrp32eyq4rt4b@pali>
References: <aoGk8FSBlwYAmvu8@thunder.hadrons.org>
 <20260816121505.jyz3ynrb3rxlvq6h@pali>
 <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61b8b3f7-9c33-4704-a0ba-29e77a5e3cba@linaro.org>
User-Agent: NeoMutt/20180716

On Sunday 16 August 2026 10:03:24 Adhemerval Zanella Netto wrote:
> On 16/08/26 09:15, Pali Rohár wrote:
> > On Sunday 16 August 2026 13:54:24 Guillem Jover wrote:
> >> Hi!
> >>
> >> I was just refreshing my mind about documentation around TIOCGWINSZ,
> >> and noticed the weird <asm/termbits.h> and <asm/termios.h> usage in
> >> various ioctl man pages.
> >>
> >> These originate from commit c023614536251bd6b47a0eab45ab3bcfd2ad9ec2,
> >> where it states that the «struct termios» definitions in the
> >> <termios.h> header are incompatible with the defined ioctl calls.
> >>
> >> This seems problematic, for one because the <asm/*> headers are Linux
> >> specific, so they reduce portability for all these macros, even when
> >> they do not rely or make use of «struct termios». For another because if
> >> there is a problem in glibc with the interaction between «struct termios»
> >> and the ioctl calls, then that should be fixed in glibc, instead of
> >> adding these workarounds in the man pages.
> >>
> >> It seems the problem is that in glibc «struct termios» maps to the Linux
> >> «struct termios2», but the macros for ioctls that use «struct termios»
> >> do not match (for example TCGETS instead of TCGETS2)?
> >>
> >>
> >> I think this should be fixed both in glibc, to make the definitions
> >> coherent, and in man-pages to not use those Linux-only headers where
> >> it is not necessary and then on a second stage to point back to the
> >> portable headers once glibc has been fixed?
> >>
> >> Thanks,
> >> Guillem
> > 
> > Hello! The main problem is that glibc has different API and ABI for
> > termios functions and structures than the raw Linux syscalls.
> > 
> > And at the same time glibc does not provide API for all functionality
> > which Linux syscall provides.
> > 
> > And POSIX, nor GNU does not provide functions / API for setting
> > arbitrary baudrate on the tty device.
> 
> From NEWS:
> 
>  464 Version 2.42
>  [...]
>  481 * On Linux, the <termios.h> interface now supports arbitrary baud rates;
>  482   speed_t is redefined to simply be the baud rate specified as an
>  483   unsigned int, which matches the kernel interface.

Nice! So it was finally done.

> > 
> > So all this functionality and information in the manpage are Linux
> > specific, they are not portable.
> > 
> > Therefore in this case it is necessary for Linux specific thing to use
> > Linux-only headers.
> > 
> > When I was looking at it in the past, I had feeling that glibc cannot
> > easily fix it because it would break existing glibc ABI and contract for
> > all existing applications.
> 
> It turned out to be doable, speed_t was already an unsigned int, old binaries
> and the legacy Bxxxx bit-pattern values remain accepted for compatibility.
> 
> The struct termios ABI was preserved (the kernel conversion happens inside
> tcgetattr/tcsetattr).
> 
> There was one regression in the transition (BZ 33340, non-standard baud handling
> of CIBAUD), fixed for 2.43 by 8d999a69936.
> 
> > 
> > But once glibc provides API for setting the arbitrary baudrate on tty
> > device, we can improve the manpages. But as this did not happened
> > for 30 years (in past I saw that there were some attempts), I doubt that
> > it would be in near future. It is not easy thing.
> 
> The incompatibility we have is glibc and kernel struct termios have different
> layout, so mixing them is a recipe for trouble.

Yes, this is what I remember that there are two structures with same
name but different layout and I was passing the wrong one to ioctl and
it did not worked.

> Kudos to H. Peter Anvin for this work.

Thank you very much for this work.
