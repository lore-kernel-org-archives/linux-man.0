Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.156.224.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494632;
	b=xNj3bEIDGa+5PGmvO+bJbtGQMaCxjh7/JQySifVMlhTJVr0nONcUY1POJr5OKvnxc8nD
	 M/CQRvJMS1Gv5wIcVfDF2AlOjABAA6T7D8CwshW/eMOVfNTEYRQjp8/8pdxtWOG5H1cbM
	 eM7jarbPMBKoQdoc5YFzpJYJA+ige+kmTV4Fj9GtABXi0iGmQ8gtp4cAi4k53yS54XMwp
	 GF+fVLoJ+TatCLojgw+4oKglTXIJFOiJTDgavcYuAoA9B6MWbBv0MFQou13Sd0+I53pvy
	 6ioT8H2/74XS3nrGDRILG9FaUXCN4YbJe8Ype1lAbXUBwtei6DM/LOT0IO3hkcHRXEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494632;
	h=DMARC-Filter:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=FrbaNEidDcBzV9u6E09MFd+Dww70gnSR4zJR+xCWmmM=;
	b=5ea1EFdo209fSjdkmywUpIjAbjDwBs8VZrSjXWUpZnLflWxzE9p85RWA+8eWdQYY0Cwb
	 O6zr+D7tKysShpdnqMxR042HSpFipG86x9+UuwP1swqYYQb/NsU3eBU76kWbKgi0GfrVy
	 aLNtNARfX6HJgmdrcTaAww7zH/mhp4aaPol9yWtxzBnWujsllPoG1QHGbWMfZ5/FaXg+D
	 tDhvi+J8pp0bfTBG4fkOnhIjiXVfyqngKtDR0WPo/hayRYIACOpPANMYvOw/kBLLZ4/og
	 5B2FU9bhF6CM02LifxsAivY1VeQezaXHhx+qto94xBPCy0HOzm7DyyAJ43gN1mfOaDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=libc.org;
	spf=pass smtp.mailfrom=aerifal.cx;
	arc=none smtp.remote-ip=104.156.224.86
Received: from brightrain.aerifal.cx (brightrain.aerifal.cx [104.156.224.86])
	(using TLSv1.2 with cipher ECDHE-ECDSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A286606A331
	for <linux-man@vger.kernel.org>; Thu, 12 Nov 2026 14:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A286606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=libc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aerifal.cx
Date: Thu, 12 Nov 2026 09:43:49 -0500
From: Rich Felker <dalias@libc.org>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Vincent Lefevre <vincent@vinc17.net>,
	Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org,
	libc-alpha@sourceware.org, Walter Harms <wharms@bfs.de>,
	~hallyn/shadow@lists.sr.ht, musl@lists.openwall.com
Subject: Re: [musl] Re: [PATCH v1] man/man3/crypt.3: These functions accept
 many algorithms, not only DES
Message-ID: <20261112144349.GO26138@brightrain.aerifal.cx>
References: <20261112032929.GB160897@qaa.vinc17.org>
 <20261112033742.GG5716@brightrain.aerifal.cx>
 <avWT2aQCFY2GIwLp@devuan>
 <20261112120831.GH5716@brightrain.aerifal.cx>
 <avWwXGpq1OLtNDSV@devuan>
 <20261112131737.GB1951@disset.lip.ens-lyon.fr>
 <avW9PMcZ6Hm26hl3@devuan>
 <20261112134516.GD1951@disset.lip.ens-lyon.fr>
 <20261112135501.GI5716@brightrain.aerifal.cx>
 <avXFw_RUi0C4Ta1V@devuan>
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
In-Reply-To: <avXFw_RUi0C4Ta1V@devuan>
User-Agent: Mutt/1.9.5 (2018-04-13)

On Thu, Nov 12, 2026 at 03:07:14PM +0100, Alejandro Colomar wrote:
> Hi Rich,
> 
> > Date: 2026-11-12 08:55:01-0500
> > From: Rich Felker <dalias@libc.org>
> >
> > On Thu, Nov 12, 2026 at 02:45:16PM +0100, Vincent Lefevre wrote:
> > > On 2026-11-12 14:23:08 +0100, Alejandro Colomar wrote:
> > > > Hmm, yeah, I didn't intend to say POSIX is bad; I just wanted to let
> > > > people know that POSIX is irrelevant about crypt(3) these days (as Rich
> > > > said).  Perhaps:
> > > > 
> > > > 	The POSIX specification is significantly outdated,
> > > > 	and all systems extend it significantly.
> > > > 
> > > > What do you think?
> > > 
> > > OK for me.
> > 
> > It's not "outdated". It just does not mandate particular algorithms
> > but leaves these choices up to the implementation. As usual the scope
> > of POSIX is what applications need to know to interface with the
> > system, not administrative policy. This is why POSIX doesn't define
> > things like mount, how init works, etc. either. They are in the scope
> > of things that applications generally don't have to care about; only
> > system components do.
> 
> But is the POSIX specification really useful for applications?

Yes. It tells you enough to validate a password for authentication
purposes:

	const char *result = crypt(password, hash);
	if (result && strcmp(result, hash)==0) {
		/* password validated */
	}

> An application is probably not interested in knowing that it shall
> pass two characters as the salt from the set './[A-Za-z]'.

Yes, it's less useful to know that, unless you don't care about hash
strength or portability to other systems. In that case you can use it
to make hashes.

> An application should not rely on the specified return value either.

It can rely on it for validating passwords against existing hashes.
That is the more usual application need. Setting new passwords is
usually an administrative task, except for non-system uses like making
.htaccess files.

Rich
