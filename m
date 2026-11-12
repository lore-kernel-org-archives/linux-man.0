Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485316;
	b=GgNXRn3OnaktmmRaysSh8iYo7Qwm1/q5oeNPhotz0OYrXR/9awXfSxrSlHP3A0+NbXrt
	 1zwyrckIMLJeDzEoSsKtVQaeCnsYg5+dLuk8/aI7iFjV8UCzk7F1bCGGlwtwDGm68Zfll
	 M2PF6YA/sB0zeUBkZ/FwI2+B1PKeyy7Oied4moknJTxYVsSbWK8rHWVcFWURYUFVIuRLj
	 rQTZZe+AcTMA/UX3KkZQuAmmDMxt2Gn/3VfFxPswDayc0o48Sh2mAw0w/MKEDUP6b3r9v
	 fey2c7kmE3vmjIa2mxlQP8fObz28RcFasHH60c0ngr6R+jzoHIu3Rucz/euoQrPk1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485316;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=LtntM+oqAOayZrdPuCtnWuyGa2C/bVFbxsD4nIbzkPY=;
	b=CoKHeTHOWZJHYcLp9aVfYPFu7kyNKaRVReu1O6ZD87D5/C3SIP1zyHT2Hp5k/fm4aDgV
	 u1ss+bChiA3OKoxVyjpN+JGxtCZ/zgOAlg2287rkQNetx5trU/JBiX8PHxZjA3FM2TsPJ
	 d+d4RdyF+x4ZdNDEjPLL5ypZ7c0eSOjubmlWxU3VabyUdJZKqIs3AXDgoh1QqZouzR5WR
	 eE8jAxMho+67AgpN5Qr4/scq5KjJqF+r/R6M+eukxpYmRF9nRL6kz13A8oX7pn8BXe7le
	 eH0DkP+jMNIR7LSa6Hr3si9vh5lxhyVLznKQ1gHmJnMn7vg+rxqoLuhSgho+UGOjVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065E606A31C
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 12:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C065E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 12 Nov 2026 07:08:32 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx+linux-man@kernel.org>,
	linux-man@vger.kernel.org, libc-alpha@sourceware.org,
	Walter Harms <wharms@bfs.de>, ~hallyn/shadow@lists.sr.ht,
	musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112120831.GH5716@brightrain.aerifal.cx>
References: <313da4c4e217a58e49e981f62d16bd15c97352bf.1794268615.git.alx@kernel.org>
 <avJeq6_q5rpqoGlW@devuan>
 <20261112015223.GA242717@joooj.vinc17.net>
 <20261112025339.GM26138@brightrain.aerifal.cx>
 <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avWT2aQCFY2GIwLp@devuan>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 11:28:20AM +0100, Alejandro Colomar wrote:
> Hi Rich, Vincent,
> 
> > Date: 2026-11-11 22:37:42-0500
> > From: Rich Felker <dalias@libc.org>
> >
> > On Thu, Nov 12, 2026 at 04:29:29AM +0100, Vincent Lefevre wrote:
> > > On 2026-11-11 21:53:39 -0500, Rich Felker wrote:
> > > > That's the whole reason '$' was chosen: POSIX doesn't define the
> > > > behavior (since a "shall" is violated) so the implementation is free
> > > > to define a behavior here. The behaviors for the portable base64
> > > > character set documented in POSIX uses only 2 characters as salt
> > > > (insufficient) and the common agreed-upon definition for how they are
> > > > used is as salt for the classic DES-based password hash.
> > > 
> > > But the behavior is completely out of scope of POSIX.
> > 
> > Yes. And that's allowed because POSIX does not define the behavior but
> > leaves it undefined. I'm not sure if you're objecting to something
> > here or questioning how it should be documented or something else..?
> 
> Yeah, I think it'd be okay to document that this is an extension to
> POSIX.  Perhaps, we could add this:
> 
> 	@@ -111,6 +111,9 @@ .SH ATTRIBUTES
> 	 .BR crypt_r ()
> 	 T}     Thread safety   MT-Safe
> 	 .TE
> 	+.SH VERSIONS
> 	+While POSIX only specifies the DES algorithms for these functions,
> 	+all systems implement several other algorithms.

POSIX doesn't specify any algorithm. It specifies the input format for
salt in a way that's aligned with the traditional DES password hashing
algorithm but it doesn't assign any actual definition for the
algorithm.

DES hash provides the implementation-defined algorithm POSIX mandates
exists but doesn't specify. The other hashes fill in the gaps where
the specification leaves things undefined.

For practical purposes POSIX is irrelevant to the way you choose salt
strings for producing new password hashes; it only specifies how to
call the function and validate a password against a hash.

Rich
